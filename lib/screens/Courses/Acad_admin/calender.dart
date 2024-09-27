import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late ProfileData profileData;
  bool _loading = true;
  late String name;
  late String depttype;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];
    _loading = false;
    print(name);
    print(depttype);
  }

  // Future<void> fetchProfileData() async {
  //   try {
  //     final response = await http.get(Uri.parse('your_api_url_here'));
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         profileData = ProfileData.fromJson(jsonDecode(response.body));
  //         _loading = false;
  //       });
  //     } else {
  //       throw Exception('Failed to load profile data');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0),
      borderRadius: BorderRadius.circular(15.0),
    );
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
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                // Profile Data
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
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
                      SizedBox(height: 10.0),
                      Text(
                        '$name',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '$depttype',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                // Calendar Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Handle navigation to the Calendar upload page
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Upload Calendar",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
