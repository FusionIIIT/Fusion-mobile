import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

class page extends StatefulWidget {
  @override
  Page_1 createState() => Page_1();
}

class Page_1 extends State<page> {
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
        physics: ClampingScrollPhysics(),
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: myContainer('Create project requisition:'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/iwd_home_page/page1',
                              arguments: data);
                        },
                        child: const Text('Fill Page 1')),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Fill Page 2')),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Fill Page 3')),
                  ],
                ),
              ]),
          SizedBox(
            height: 10.0,
          ),
          Text('AES'),
          SizedBox(
            height: 10.0,
          ),
          Text('SI. NO.'),
          TextFormField(),
          SizedBox(
            height: 10.0,
          ),
          Text('Description of item'),
          TextFormField(),
          SizedBox(
            height: 10.0,
          ),
          Text('Unit'),
          TextFormField(),
          SizedBox(
            height: 10.0,
          ),
          Text('Quantity'),
          TextFormField(),
          SizedBox(
            height: 10.0,
          ),
          Text('Amount'),
          TextFormField(),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Previous')),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Submit')),
            ],
          ),
        ],
      ),
    );
  }
}
