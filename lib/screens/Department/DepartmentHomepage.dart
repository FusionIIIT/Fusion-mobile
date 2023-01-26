import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/gymkhana_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';

class DepartmentHomepage extends StatefulWidget {
  @override
  _DepartmentHomepageState createState() => _DepartmentHomepageState();
}

class _DepartmentHomepageState extends State<DepartmentHomepage> {
  late String name = "";
  late String studentType = "";
  late ProfileData data2;
  bool _loading = true;
  late ProfileService profileService;
  @override
  void initState() {
    super.initState();
    // _dashboardController = StreamController();
    // dashboardService = DashboardService();
    // _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response2 = await profileService.getProfile();
      setState(() {
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: ListView(
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
                    name,
                    // data.details!['current_user']['first_name'] +
                    //     ' ' +
                    //     data.details!['current_user']['last_name'],
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    studentType,
                    // data.details!['user_branch'] + ' | ' + "STUDENT",
                    // style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
