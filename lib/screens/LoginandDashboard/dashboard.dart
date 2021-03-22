import 'dart:async';
import 'dart:convert';

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
  String? token;
  static String tag = 'home-page';

  Dashboard(this.token);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _bool = true;
  bool _loading = true;

  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  @override
  void initState() {
    super.initState();

    _dashboardController = StreamController();
    dashboardService = DashboardService();

    getData();
  }

  getData() async {
    Response response = await dashboardService.getDashboard(widget.token!);

    setState(() {
      data = DashboardData.fromJson(jsonDecode(response.body));
      print(data.notifications);
      _loading = false;
    });
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
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
                                image: AssetImage('assets/unknown.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Piyush Agrawal',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            data.designation![0],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _bool = true;
                              setState(() {
                                _bool = true;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
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
                                    color: _bool
                                        ? Colors.deepOrangeAccent
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _bool = false;
                              setState(() {
                                _bool = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
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
                                    color: _bool
                                        ? Colors.white
                                        : Colors.deepOrangeAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _bool
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
