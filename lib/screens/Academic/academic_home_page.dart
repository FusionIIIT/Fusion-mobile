import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class AcademicHomePage extends StatefulWidget {
  final String? token;
  static String tag = 'academic-page';
  AcademicHomePage(this.token);
  @override
  _AcademicHomePageState createState() => _AcademicHomePageState();
}

class _AcademicHomePageState extends State<AcademicHomePage> {
  int _loading1 = 2;
  late StreamController _academicController;
  late AcademicService academicService;
  late AcademicData data;
  var courseList;
  @override
  void initState() {
    super.initState();
    _academicController = StreamController();
    academicService = AcademicService();
    getAcademicDataStream();
    getCourseList();
  }

  getCourseList() async {
    //print('token-'+widget.token!);
    try {
      Response response =
          await academicService.getRegistrationCourses(widget.token!);
      setState(() {
        print(response.body);
        courseList = response.body;
        _loading1--;
      });
    } catch (e) {
      print(e);
    }
  }

  getAcademicDataStream() async {
    //print('token-'+widget.token!);
    try {
      Response response =
          await academicService.getAcademicDetails(widget.token!);
      setState(() {
        print(response.body);
        data = AcademicData.fromJson(jsonDecode(response.body));
        _loading1--;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getAcademicDataStream().then((res) {
      _academicController.add(res);
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading1 != 0
          ? Center(child: CircularProgressIndicator())
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        //NAME OF USER
                        data.details!['current_user']['first_name'] +
                            ' ' +
                            data.details!['current_user']['last_name'],
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        data.details!['user_branch'] + ' | ' + "STUDENT",
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
                        "Academic",
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
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5.0)),
                    ),
                  ),
                ),
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        child: myContainer("View Offered Courses"),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/academic_home_page/current_semester_home_page',
                              arguments: courseList);
                        },
                      ),
                      InkWell(
                        child: myContainer("Final Registration"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/academic_home_page/final_registration',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Pre Registration"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/academic_home_page/pre_registration',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Add Course"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/academic_home_page/add_drop_courses',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Fill Backlog Form"),
                        onTap: () {
                          // Navigator.pushNamed(context,
                          //     '/academic_home_page/current_semester_home_page',
                          //     arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Drop/Replace Course"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/academic_home_page/add_drop_courses',
                              arguments: data);
                        },
                      ),
                      // InkWell(
                      //   child: myContainer("Current Semester"),
                      //   onTap: () {
                      //     Navigator.pushNamed(context,
                      //         '/academic_home_page/current_semester_home_page',
                      //         arguments: data);
                      //   },
                      // ),
                      // InkWell(
                      //   child: myContainer("Add/Drop courses"),
                      //   onTap: () {
                      //     Navigator.pushNamed(
                      //         context, '/academic_home_page/add_drop_courses');
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
