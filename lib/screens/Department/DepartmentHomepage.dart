import 'dart:async';
import 'package:fusion/constants.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepartmentHomepage extends StatefulWidget {
  @override
  _DepartmentHomepageState createState() => _DepartmentHomepageState();
}

Color textColor = Colors.black;

class _DepartmentHomepageState extends State<DepartmentHomepage> {
  late String name = "";
  late String studentType = "";
  late ProfileData data2;
  late String user_type = "";
  bool _loading = true;
  late ProfileService profileService;
  @override
  void initState() {
    super.initState();

    profileService =
        ProfileService(); // calling profile service to get user's data

    getData(); // storing user's data in their respective variables
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
      user_type = data2.profile!['user_type'];
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double kHeight = MediaQuery.of(context).size.height;
    double kWidth = MediaQuery.of(context).size.width;
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
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    // users brnch and role(faculty/ student /admin)
                    studentType,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5 * kHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/department_homepage/aboutus");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('About Us',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/department_homepage/facilities");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.article_rounded,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Facilities',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/department_homepage/faculty");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.attribution_outlined,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Faculty',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    "/department_homepage/achievements");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.emoji_events,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Achievements',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/department_homepage/students");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Students',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    "/department_homepage/announcements");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.volume_down_outlined,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Announcements',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/department_homepage/alumni");
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.graduationCap,
                                    color: kPrimaryColor,
                                    size: 45.0,
                                  ),
                                  Text('Alumni',
                                      style: TextStyle(color: textColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  // Icon(
                                  //   Icons.app_registration,
                                  //   size: 45.0,
                                  // ),
                                  Text(''),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
