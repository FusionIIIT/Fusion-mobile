// import 'package:flutter/material.dart';
// import 'package:fusion/services/login_service.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class GradingScheme extends StatefulWidget {
//   @override
//   _GradingSchemeState createState() => _GradingSchemeState();
// }

// class _GradingSchemeState extends State<GradingScheme> {
//   bool _loading = true;
//   late String name;
//   late String depttype;
//   Map<String, dynamic>? courseDetails;

//   @override
//   void initState() {
//     super.initState();
//     var service = locator<StorageService>();
//     name = service.profileData.user!["first_name"] +
//         " " +
//         service.profileData.user!["last_name"];
//     depttype = service.profileData.profile!['department']!['name'] +
//         " " +
//         service.profileData.profile!['user_type'];
//   }
//   Future<void> fetchCourseDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? selectedCourseId = prefs.getInt('selectedCourseId');
//     String? storedToken = 'Token 7f272a843c2589f1304d0167d8aae96dd649930f';

//     if (selectedCourseId == null) {
//       print('No course selected');
//       return;
//     }

//     final url = Uri.parse('http://localhost:8000/ocms/api/courses/');

//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization': storedToken,
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['courses'] is List) {
//         final courses = List<Map<String, dynamic>>.from(data['courses']);
//         final course = courses.firstWhere(
//           (course) => course['id'] == selectedCourseId,
//           orElse: () => {},
//         );
//         setState(() {
//           courseDetails = course;
//           _loading = false;
//         });
//         print(courseDetails);
//       } else {
//         print('Unexpected data format: courses key is not a list');
//         setState(() {
//           _loading = false;
//         });
//       }
//     } else {
//       print('Failed to load courses: ${response.statusCode}');
//       setState(() {
//         _loading = false;
//       });
//     }
//   }
  
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//         color: Colors.deepOrangeAccent,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.circular(15.0),
//     );
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
//                 SizedBox(height: 10.0),
//                 Text(
//                   //NAME OF USER
//                   name,
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   depttype,
//                 ),
//                 SizedBox(height: 10.0),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Text(
//                     "Assignments",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.deepOrangeAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 2.0,
//                   )
//                 ],
//                 borderRadius: BorderRadius.circular(5.0),
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
//                   child: myContainer("100 - 90 => Grade A+"),
//                   onTap: () {
//                     // Handle onTap event
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("89-80 => Grade A"),
//                   onTap: () {
//                     // Handle onTap event
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("79 - 70 => Grade B+"),
//                   onTap: () {
//                     // Handle onTap event
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GradingScheme extends StatefulWidget {
  @override
  _GradingSchemeState createState() => _GradingSchemeState();
}

class _GradingSchemeState extends State<GradingScheme> {
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

  List<Widget> buildGradingSchemeWidgets(Map<String, dynamic> course) {
    List<Widget> gradingWidgets = [];

    if (course.containsKey('percent_quiz_1')) {
      gradingWidgets.add(myContainer("Quiz 1: ${course['percent_quiz_1']}%"));
    }
    if (course.containsKey('percent_midsem')) {
      gradingWidgets.add(myContainer("Midsem: ${course['percent_midsem']}%"));
    }
    if (course.containsKey('percent_quiz_2')) {
      gradingWidgets.add(myContainer("Quiz 2: ${course['percent_quiz_2']}%"));
    }
    if (course.containsKey('percent_endsem')) {
      gradingWidgets.add(myContainer("Endsem: ${course['percent_endsem']}%"));
    }
    if (course.containsKey('percent_project')) {
      gradingWidgets.add(myContainer("Project: ${course['percent_project']}%"));
    }
    if (course.containsKey('percent_lab_evaluation')) {
      gradingWidgets.add(myContainer("Lab Evaluation: ${course['percent_lab_evaluation']}%"));
    }
    if (course.containsKey('percent_course_attendance')) {
      gradingWidgets.add(myContainer("Course Attendance: ${course['percent_course_attendance']}%"));
    }

    return gradingWidgets;
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15.0),
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
          : ListView(
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
                            image: AssetImage('assets/unknown.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        name,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Text(depttype),
                      SizedBox(height: 10.0),
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
                          "Grading Scheme",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: courseDetails != null
                        ? buildGradingSchemeWidgets(courseDetails!)
                        : [Text('No grading scheme available')],
                  ),
                ),
              ],
            ),
    );
  }
}
