import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  Dashboard();
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _notificationsBool = true;
  bool _newsBool = false;
  bool _announcementsBool = false;
  bool _loading = true;
  late String name;
  late String studentType;
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
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

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('New Content Loaded'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar()
          .buildAppBar(), // This is default app bar used in all modules
      drawer: SideDrawer(), // This is sideDrawer used in all modules
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: _dashboardController.stream,
              builder: (context, AsyncSnapshot snapshot) {
                return ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            width: 170.0,
                            height: 170.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/profile_pic.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            name, //Display name of User
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            studentType, // Display Type of User
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _notificationsBool = true;
                                _announcementsBool = false;
                                _newsBool = false;
                                setState(() {
                                  _notificationsBool = true;
                                  _announcementsBool = false;
                                  _newsBool = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.notifications_active_rounded,
                                    color: _notificationsBool
                                        ? Colors.deepOrangeAccent
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _newsBool = true;
                                _announcementsBool = false;
                                _notificationsBool = false;
                                setState(() {
                                  _newsBool = true;
                                  _announcementsBool = false;
                                  _notificationsBool = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'News',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: _newsBool
                                        ? Colors.deepOrangeAccent
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _announcementsBool = true;
                                _newsBool = false;
                                _notificationsBool = false;
                                setState(() {
                                  _announcementsBool = true;
                                  _newsBool = false;
                                  _notificationsBool = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Announcements',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.announcement,
                                      color: _announcementsBool
                                          ? Colors.deepOrangeAccent
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _notificationsBool
                        ? NotificationCard(
                            notifications: data.notifications,
                          )
                        : NewsCard(),
                  ],
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}
