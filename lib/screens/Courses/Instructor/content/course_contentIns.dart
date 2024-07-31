// import 'dart:async';
// import 'dart:convert';
// import 'package:fusion/models/profile.dart';
// import 'package:fusion/services/profile_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/dashboard.dart';
// import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
// import 'package:fusion/services/dashboard_service.dart';
// import 'package:http/http.dart';

// class CourseContentIns extends StatefulWidget {
//   @override
//   _CourseContentInsState createState() => _CourseContentInsState();
// }

// class _CourseContentInsState extends State<CourseContentIns> {
//   bool _loading = true;
//   late String name;
//   late String studentType;
//   // Stream Controller for API
//   late StreamController _dashboardController;
//   late DashboardService dashboardService;
//   late DashboardData data;
//   late StreamController _profileController;
//   late ProfileService profileService;
//   late ProfileData data2;
//   @override
//   void initState() {
//     super.initState();
//     _dashboardController = StreamController();
//     dashboardService = DashboardService();
//     _profileController = StreamController();
//     profileService = ProfileService();
//     getData();
//   }

//   getData() async {
//     try {
//       Response response = await dashboardService.getDashboard();
//       Response response2 = await profileService.getProfile();
//       setState(() {
//         data = DashboardData.fromJson(jsonDecode(response.body));
//         data2 = ProfileData.fromJson(jsonDecode(response2.body));
//         _loading = false;
//       });
//       name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
//       studentType = data2.profile!['department']!['name'] +
//           '  ' +
//           data2.profile!['user_type'];
//     } catch (e) {
//       print(e);
//     }
//   }

//   loadData() async {
//     getData().then((res) {
//       _dashboardController.add(res);
//       _profileController.add(res);
//     });
//   }

//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//         border: new Border.all(
//           color: Colors.deepOrangeAccent,
//           width: 2.0,
//           style: BorderStyle.solid,
//         ),
//         borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
//   }

//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }

//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = '';
//     return Scaffold(
//       appBar: DefaultAppBar().buildAppBar(),
//       drawer: SideDrawer(),
//       body: ListView(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         children: [
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//             shadowColor: Colors.black,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 20.0),
//                   width: 170.0,
//                   height: 170.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/unknown.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   //NAME OF USER
//                   name,
//                   // data.details!['current_user']['first_name'] +
//                   //     ' ' +
//                   //     data.details!['current_user']['last_name'],
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   studentType,
//                   // data.details!['user_branch'] + ' | ' + "STUDENT",
//                   // style: TextStyle(fontSize: 15.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                     child: Text(
//                   "Course-Code",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 )),
//               ),
//               decoration: new BoxDecoration(
//                 color: Colors.deepOrangeAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 2.0,
//                   )
//                 ],
//                 borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
//               ),
//             ),
//           ),
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             shadowColor: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 InkWell(
//                   child: myContainer("Module 1"),
//                   onTap: () {
//                     Navigator.pushNamed(context,
//                         '/registered_courses/instructor/course_home/module',
//                         arguments: data);
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Module 2"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                         context, '/registered_courses/course_home/module',
//                         arguments: data);
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Upload"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                         context, '/registered_courses/course_home/module',
//                         arguments: data);
//                   },
//                 ),
//                 // InkWell(
//                 //   child: myContainer("Assignments"),
//                 //   onTap: () {
//                 //     Navigator.pushNamed(
//                 //         context, '/registered_courses/course_home/assignment',
//                 //         arguments: data);
//                 //   },
//                 // )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class CourseContentIns extends StatefulWidget {
  @override
  _CourseContentInsState createState() => _CourseContentInsState();
}

class _CourseContentInsState extends State<CourseContentIns> {
  bool _loading = true;
  late String name;
  late String depttype;
  Map<String, dynamic>? courseDetails;

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
    fetchCourseDetails();
  }

  Future<void> fetchCourseDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedCourseId = prefs.getInt('selectedCourseId');
    String? storedToken = 'Token 7f272a843c2589f1304d0167d8aae96dd649930f';

    if (selectedCourseId == null) {
      print('No course selected');
      return;
    }

    final url = Uri.parse('http://localhost:8000/ocms/api/courses/');

    final response = await http.get(
      url,
      headers: {
        'Authorization': storedToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['courses'] is List) {
        final courses = List<Map<String, dynamic>>.from(data['courses']);
        final course = courses.firstWhere(
          (course) => course['id'] == selectedCourseId,
          orElse: () => {},
        );
        setState(() {
          courseDetails = course;
          _loading = false;
        });
        print(courseDetails);
      } else {
        print('Unexpected data format: courses key is not a list');
        setState(() {
          _loading = false;
        });
      }
    } else {
      print('Failed to load courses: ${response.statusCode}');
      setState(() {
        _loading = false;
      });
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
          : courseDetails == null
              ? Center(child: Text('No course details available'))
              : ListView(
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
                            name,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            depttype,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
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
                            "Course Code: ${courseDetails!['code']}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 2.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shadowColor: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Course Name: ${courseDetails!['name']}",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...courseDetails!['syllabus']
                              .split('\n')
                              .map<Widget>((line) => InkWell(
                                    child: myContainer(line),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context,
                                          '/registered_courses/course_home/module',
                                          arguments: line);
                                    },
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
