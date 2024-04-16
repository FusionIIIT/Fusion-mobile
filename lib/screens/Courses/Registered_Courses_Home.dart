// import 'package:flutter/material.dart';
// import 'package:fusion/services/login_service.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class RegisteredCoursesHome extends StatefulWidget {
//   @override
//   _RegisteredCoursesHomeState createState() => _RegisteredCoursesHomeState();
// }

// class Course {
//   final String courseCode;
//   final String courseName;

//   Course.fromJson(Map<String, dynamic> json)
//       : courseCode = json['course_code'],
//         courseName = json['course_name'];
// }

// class _RegisteredCoursesHomeState extends State<RegisteredCoursesHome> {
//   late String name;
//   late String depttype;
//   late List<Course> registeredCourses = [];

//   // Function to fetch registered courses from student or instructor data
//   Future<void> fetchRegisteredCourses(String userType) async {
//     final url = Uri.parse('http://localhost:3000/$userType');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = convert.jsonDecode(response.body);
//       setState(() {
//         registeredCourses = List<Course>.from(
//             data['registered_courses'].map((item) => Course.fromJson(item)));
//       });
//     } else {
//       // Handle error scenario (e.g., display error message)
//       print('Failed to load courses: ${response.statusCode}');
//     }
//   }

//   // Course class to represent registered course data

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

//     // Determine user type (student or instructor) and fetch courses
//     final userType = service.profileData.profile!['user_type'];
//     fetchRegisteredCourses(userType);
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
//                   name,
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   depttype,
//                   style: TextStyle(fontSize: 15.0, color: Colors.black),
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
//                   "Courses",
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
//                 // Loop through registeredCourses and display course details
//                 for (final course in registeredCourses)
//                   InkWell(
//                     child: myContainer(
//                         course.courseCode + " - " + course.courseName),
//                     onTap: () {
//                       // Handle course selection (e.g., navigate to course details page)
//                       print('Selected course: ${course.courseCode}');
//                       // You can navigate to a course details page here
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fusion/screens/Courses/course_home.dart';

class RegisteredCoursesHome extends StatefulWidget {
  @override
  _RegisteredCoursesHomeState createState() => _RegisteredCoursesHomeState();
}

class Course {
  final String courseCode;
  final String courseName;

  Course.fromJson(Map<String, dynamic> json)
      : courseCode = json['course_code'],
        courseName = json['course_name'];
}

class _RegisteredCoursesHomeState extends State<RegisteredCoursesHome> {
  late String name;
  late String depttype;
  late List<Course> registeredCourses = [];

  // Function to fetch users based on type and optionally ID
  // Future<void> fetchUsers(String name, String? type) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? storedUsername = prefs.getString('username');
  //   print(name);
  //   final url = Uri.parse('http://localhost:3000/users?id=$storedUsername');

  //   final response = await http.get(url);
  //   print("response:$response");

  //   if (response.statusCode == 200) {
  //     final data = convert.jsonDecode(response.body);
  //     print("data: $data\n");
  //     final users = List<Map<String, dynamic>>.from(data['users']);
  //     print(users);

  //     // Extract courses based on user type (logic can be improved if needed)
  //     registeredCourses = users.fold<List<Course>>([], (courses, user) {
  //       if (user['type'] == type && user['id'] == name) {
  //         courses.addAll(List<Course>.from(
  //             user['registered_courses'].map((item) => Course.fromJson(item))));
  //       }
  //       return courses;
  //     });

  //     setState(() {});
  //   } else {
  //     // Handle error scenario (e.g., display error message)
  //     print('Failed to load users: ${response.statusCode}');
  //   }
  // }
  Future<void> fetchUsers(String name, String? type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    print(name);

    final url = Uri.parse('http://localhost:3000/users?id=$storedUsername');

    final response = await http.get(url);
    print("response:$response");

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print("data: $data\n");

      // Check if 'users' is a list before accessing it
      if (data is List) {
        final users = List<Map<String, dynamic>>.from(data);
        print(users);

        // Extract courses based on user type (logic can be improved if needed)
        registeredCourses = users.fold<List<Course>>([], (courses, user) {
          if (user['type'] == type) {
            courses.addAll(List<Course>.from(user['registered_courses']
                .map((item) => Course.fromJson(item))));
          }
          return courses;
        });
      } else {
        // Handle the case where 'users' is not a list (e.g., display error message)
        print('Unexpected data format: users key is not a list');
      }

      print(registeredCourses);

      setState(() {});
    } else {
      // Handle error scenario (e.g., display error message)
      print('Failed to load users: ${response.statusCode}');
    }
  }

  // Course class to represent registered course data

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

    // Determine user type and potentially user ID (logic can be improved)
    final userType = service.profileData.profile!['user_type'];
    final userID =
        service.profileData.user!["first_name"]; // Assuming ID retrieval

    print("userid:$userID");
    fetchUsers(service.profileData.user!["first_name"], userType);
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
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
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
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  depttype,
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
                  "Courses",
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
                // Loop through registeredCourses and display course details
                for (final course in registeredCourses)
                  InkWell(
                    child: myContainer(
                        course.courseCode + " - " + course.courseName),
                    onTap: () {
                      // Handle course selection (e.g., navigate to course details page)
                      print('Selected course: ${course.courseCode}');
                      Navigator.pushNamed(
                        context,
                        '/registered_courses/course_home',
                      );
                      // You can navigate to a course details page here
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
