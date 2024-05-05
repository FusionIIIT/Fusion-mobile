import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
// import 'package:fusion/Components/bottom_navigation_bar.dart';

class ProgrammeCurriculumHome extends StatefulWidget {
  @override
  _ProgrammeCurriculumHomeState createState() =>
      _ProgrammeCurriculumHomeState();
}

class _ProgrammeCurriculumHomeState extends State<ProgrammeCurriculumHome> {
  late String name = "";
  late String studentType = "";
  late String userType = "";
  late List<dynamic> userdesg = [];
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  // ignore: unused_field
  bool _loading = true;
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
      userType = data2.profile!['user_type'];
      userdesg = data.designation!;
      print(userdesg);
      print("this is name: $name");
      print("this is UserType: $userType");
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
    final data = '';
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Programme and Curriculum",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
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
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  studentType, // Display Type of User
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Programme Curriculum",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
              ),
              decoration: new BoxDecoration(
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  child: myContainer("Browse Programmes"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/programme',
                        arguments: data);
                  },
                ),
                userdesg.contains('acadadmin')
                    ? InkWell(
                        child: myContainer("Add Programmes"),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/programme_curriculum_home/programme_form',
                            arguments: data,
                          );
                        },
                      )
                    : SizedBox(),
                InkWell(
                  child: myContainer("Browse Curriculums"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/curriculum',
                        arguments: data);
                  },
                ),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Add Curriculum"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/curriculum_form',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
                InkWell(
                  child: myContainer("Browse Courses"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/courses',
                        arguments: data);
                  },
                ),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Add Courses"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/courses_form',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
                InkWell(
                  child: myContainer("Browse Disciplines"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/discipline',
                        arguments: data);
                  },
                ),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Add Disciplines"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/discipline_form',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
                InkWell(
                  child: myContainer("Browse Batches"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/batches',
                        arguments: data);
                  },
                ),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Add Batches"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/batches_form',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Browse Course Proposal"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/course_proposals',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
                userType != 'student'
                    ? InkWell(
                        child: myContainer("Add Course Proposal"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/programme_curriculum_home/coursesProposal_form',
                              arguments: data);
                        },
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
