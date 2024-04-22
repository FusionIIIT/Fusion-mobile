import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class News extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _notificationsBool = false;
  bool _newsBool = true;
  bool _announcementsBool = false;
  bool _homeBool = false;

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
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

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
      print("gfsgsgd");
      Response response = await dashboardService.getDashboard();
      print("1");
      Response response2 = await profileService.getProfile();
      print("2");
      print(response);
      print(response2);

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
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "News",

        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: _dashboardController.stream,
              builder: (context, AsyncSnapshot snapshot) {
                return Stack(children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 13.0,
                                right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    Navigator.pushReplacementNamed(
                                        context, "/notification");
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Only handle navigation when the icon is clicked
                                          _notificationsBool = true;
                                          _announcementsBool = false;
                                          _newsBool = false;
                                          setState(() {
                                            _notificationsBool = true;
                                            _announcementsBool = false;
                                            _newsBool = false;
                                          });
                                          Navigator.pushReplacementNamed(
                                              context, "/landing");
                                        },
                                        child: Icon(
                                          Icons.navigate_before_rounded,
                                          color: Colors.black,
                                          size: 25.0,
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Text(
                                        'News',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 170.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        
                      ],
                    ),
                  ),
                ]);
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