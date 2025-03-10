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
import 'package:fusion/services/appBar_services.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  Dashboard();
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _notificationsBool = false;
  bool _newsBool = false;
  bool _announcementsBool = false;
  bool _homeBool = true;

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
  late List<String> designationsArray;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool isStudent = false;

  final appBarServices _appBarServices = appBarServices();
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
      print(data2.user!);
      print(
          '-----------------------------------=---------------------------------------');
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'];

      if (data2.profile!['user_type'] == 'student') {
        isStudent = true;
      }
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

  fetchDesignations() async {
    try {
      designationsArray = await _appBarServices.getDesignations();
    } catch (e) {
      print("Error fetching designations: $e");
      return null;
    }
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
        headerTitle: "Dashboard",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
          MyBottomNavigationBar(), // This is sideDrawer used in all modules
      body: Column(
        children: [
          Expanded(
            child: _loading == true
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
                                horizontal: 20.0, vertical: 30.0),
                            // shadowColor: Colors.black,
                            color: Colors.white,

                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  width: 170.0,
                                  height: 190.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/profile_pic.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  name, //Display name of User
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  studentType +
                                      " " +
                                      curr_desig, // Display Type of User
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),

                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            color: Colors.deepOrangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50.0), // Set the border radius here
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 13.0,
                                  right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // Align the children along the main axis with space between them
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Align the children along the cross axis (vertically by default)
                                // mainAxisSize: MainAxisSize.max,
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
                                          context, "/profile");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        SizedBox(width: 40.0),
                                        Text(
                                          'Professsional Profile',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 40.0),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          if (!isStudent)
                            Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              color: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.0), // Set the border radius here
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 13.0,
                                    right: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly, // Align the children along the main axis with space between them
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // Align the children along the cross axis (vertically by default)
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.notifications_active_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 40.0),
                                          Text(
                                            'Admistrative Profile',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          // _notificationsBool
                          //     ? NotificationCard(
                          //         notifications: data.notifications,
                          //       )
                          //     : NewsCard(),
                        ],
                      );
                    },
                  ),
          ),
          // Place the BottomNavigationBar here
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}