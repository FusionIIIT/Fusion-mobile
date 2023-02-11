import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Iwd/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

class view extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<view> {
   bool _loading1 = true;

  //integrating_api
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    var service = locator<StorageService>();
    try {
      data = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    //TODO: Remove this?
    getData();
  }

  getData() async {
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.deepOrangeAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //NAME OF USER
                  // 'Rajat Gupta',
                  data.user!['first_name'] + ' ' + data.user!['last_name'],
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  // 'CSE',
                  data.profile!['department']!['name'] +
                      ' | ' +
                      data.profile!['user_type'],
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        Card(
            
           
            child: Column(
            mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
           <Widget>[
          TextField(
            decoration: const InputDecoration(
              labelText: 'Enter Project ID',
                suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Colors.red,
                  ),
              ),
             ),
             SizedBox(
                 
              height: 10.0,
             ),
             ElevatedButton(
         
          onPressed: () {},
          child: Text(
            'Submit',
            style: Theme.of(context).textTheme.headline6,
          ),
        )
         
          
            
              ],
            ),
          ),
          ],
        ),
  );
    
  }
}