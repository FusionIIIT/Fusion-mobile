import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/appBar_services.dart';


class AcadminHomePage extends StatefulWidget {
  final String? token;
  static String tag = 'academic-page';
  AcadminHomePage(this.token);
  @override
  _AcadminHomePageState createState() => _AcadminHomePageState();
}

class _AcadminHomePageState extends State<AcadminHomePage> {
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

  // List<Map<String, dynamic>> flattenCourseData(List<dynamic> coursesList) {
  //   final flattenedData = <Map<String, dynamic>>[];

  //   for (final courseSlot in coursesList) {
  //     final slotName = courseSlot['slot_name'] as String;
  //     final slotType = courseSlot['slot_type'] as String;
  //     final semester = courseSlot['semester'] as int;

  //     for (final course in courseSlot['courses'] as List<dynamic>) {
  //       final courseName = course['name'] as String;
  //       final credit = course['credit'] as int;
  //       final courseCode = course['course_code'] as String;

  //       flattenedData.add({
  //         'slot_name': slotName,
  //         'slot_type': slotType,
  //         'semester': semester,
  //         'course_name': courseName,
  //         'credit': credit,
  //         'course_code': courseCode,
  //       });
  //     }
  //   }
  //   print(flattenedData);
  //   return flattenedData;
  // }

  // getCourseList() async {
  //   //print('token-'+widget.token!);
  //   try {
  //     Response response = await academicService.getRegistrationCourses();
  //     setState(() {
  //       // print(jsonDecode(response.body)['next_sem_registration_courses']);
  //       courseList = flattenCourseData(
  //           jsonDecode(response.body)['next_sem_registration_courses']);
  //       // courseList = response.body;
  //       _loading1--;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // getAcademicDataStream() async {
  //   //print('token-'+widget.token!);
  //   try {
  //     Response response =
  //         await academicService.getAcademicDetails(widget.token!);
  //     setState(() {
  //       print(response.body);
  //       data = AcademicData.fromJson(jsonDecode(response.body));
  //       _loading1--;
  //       getCourseList();
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // loadData() async {
  //   getAcademicDataStream().then((res) {
  //     _academicController.add(res);
  //   });
  // }


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
                                          context, "/course_list_home_page");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        
                                        SizedBox(width: 40.0),
                                        Text(
                                          'View Course List',
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
                                          context, "/configure_pre_registration");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        
                                        SizedBox(width: 40.0),
                                        Text(
                                          'Configure Pre Registration',
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
                                        Navigator.pushReplacementNamed(
                                          context, "/configure_final_registration");
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly, // Align the children along the main axis with space between them
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // Align the children along the cross axis (vertically by default)
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(width: 40.0),
                                          Text(
                                            'Configure Final Registration',
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

