// // import 'package:flutter/material.dart';
// // import 'package:fusion/services/login_service.dart';
// // import 'package:fusion/services/service_locator.dart';
// // import 'package:fusion/services/storage_service.dart';
// // import 'package:flutter/material.dart';
// // import 'package:fusion/Components/appBar.dart';
// // import 'package:fusion/Components/side_drawer.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert' as convert;

// // class RegisteredCoursesHome extends StatefulWidget {
// //   @override
// //   _RegisteredCoursesHomeState createState() => _RegisteredCoursesHomeState();
// // }

// // class Course {
// //   final String courseCode;
// //   final String courseName;

// //   Course.fromJson(Map<String, dynamic> json)
// //       : courseCode = json['course_code'],
// //         courseName = json['course_name'];
// // }

// // class _RegisteredCoursesHomeState extends State<RegisteredCoursesHome> {
// //   late String name;
// //   late String depttype;
// //   late List<Course> registeredCourses = [];

// //   // Function to fetch registered courses from student or instructor data
// //   Future<void> fetchRegisteredCourses(String userType) async {
// //     final url = Uri.parse('http://localhost:3000/$userType');
// //     final response = await http.get(url);

// //     if (response.statusCode == 200) {
// //       final data = convert.jsonDecode(response.body);
// //       setState(() {
// //         registeredCourses = List<Course>.from(
// //             data['registered_courses'].map((item) => Course.fromJson(item)));
// //       });
// //     } else {
// //       // Handle error scenario (e.g., display error message)
// //       print('Failed to load courses: ${response.statusCode}');
// //     }
// //   }

// //   // Course class to represent registered course data

// //   @override
// //   void initState() {
// //     super.initState();
// //     var service = locator<StorageService>();
// //     name = service.profileData.user!["first_name"] +
// //         " " +
// //         service.profileData.user!["last_name"];
// //     depttype = service.profileData.profile!['department']!['name'] +
// //         " " +
// //         service.profileData.profile!['user_type'];

// //     // Determine user type (student or instructor) and fetch courses
// //     final userType = service.profileData.profile!['user_type'];
// //     fetchRegisteredCourses(userType);
// //   }

// //   BoxDecoration myBoxDecoration() {
// //     return BoxDecoration(
// //         border: new Border.all(
// //           color: Colors.deepOrangeAccent,
// //           width: 2.0,
// //           style: BorderStyle.solid,
// //         ),
// //         borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
// //   }

// //   Text myText(String text) {
// //     return Text(
// //       text,
// //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
// //     );
// //   }

// //   Padding myContainer(String text) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Container(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: myText(text),
// //         ),
// //         decoration: myBoxDecoration(),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: DefaultAppBar().buildAppBar(),
// //       drawer: SideDrawer(),
// //       body: ListView(
// //         shrinkWrap: true,
// //         physics: ClampingScrollPhysics(),
// //         children: [
// //           Card(
// //             elevation: 2.0,
// //             margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
// //             shadowColor: Colors.black,
// //             child: Column(
// //               children: [
// //                 Container(
// //                   margin: EdgeInsets.only(top: 20.0),
// //                   width: 170.0,
// //                   height: 170.0,
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                       image: AssetImage('assets/unknown.jpg'),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   height: 10.0,
// //                 ),
// //                 Text(
// //                   name,
// //                   style: TextStyle(fontSize: 20.0, color: Colors.black),
// //                 ),
// //                 SizedBox(
// //                   height: 10.0,
// //                 ),
// //                 Text(
// //                   depttype,
// //                   style: TextStyle(fontSize: 15.0, color: Colors.black),
// //                 ),
// //                 SizedBox(
// //                   height: 10.0,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Container(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Center(
// //                     child: Text(
// //                   "Courses",
// //                   style: TextStyle(
// //                     fontSize: 20.0,
// //                     color: Colors.white,
// //                   ),
// //                 )),
// //               ),
// //               decoration: new BoxDecoration(
// //                 color: Colors.deepOrangeAccent,
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black,
// //                     offset: Offset(0.0, 1.0),
// //                     blurRadius: 2.0,
// //                   )
// //                 ],
// //                 borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
// //               ),
// //             ),
// //           ),
// //           Card(
// //             elevation: 2.0,
// //             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// //             shadowColor: Colors.black,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 // Loop through registeredCourses and display course details
// //                 for (final course in registeredCourses)
// //                   InkWell(
// //                     child: myContainer(
// //                         course.courseCode + " - " + course.courseName),
// //                     onTap: () {
// //                       // Handle course selection (e.g., navigate to course details page)
// //                       print('Selected course: ${course.courseCode}');
// //                       // You can navigate to a course details page here
// //                     },
// //                   ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:fusion/services/login_service.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fusion/screens/Courses/course_home.dart';

// class RegisteredCoursesHome extends StatefulWidget {
//   @override
//   _RegisteredCoursesHomeState createState() => _RegisteredCoursesHomeState();
// }

// // class Course {
// //   final String courseCode;
// //   final String courseName;

// //   Course.fromJson(Map<String, dynamic> json)
// //       : courseCode = json['course_code'],
// //         courseName = json['course_name'];
// // }
// class Course {
//   final int id;
//   final String code;
//   final String name;
//   // Add other fields as needed

//   Course({required this.id, required this.code, required this.name});

//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       id: json['id'],
//       code: json['code'],
//       name: json['name'],
//       // Initialize other fields as needed
//     );
//   }
// }
// class _RegisteredCoursesHomeState extends State<RegisteredCoursesHome> {
//   late String name;
//   late String depttype;
//   late List<Course> registeredCourses = [];

//   // Function to fetch users based on type and optionally ID
//   // Future<void> fetchUsers(String name, String? type) async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? storedUsername = prefs.getString('username');
//   //   print(name);
//   //   final url = Uri.parse('http://localhost:3000/users?id=$storedUsername');

//   //   final response = await http.get(url);
//   //   print("response:$response");

//   //   if (response.statusCode == 200) {
//   //     final data = convert.jsonDecode(response.body);
//   //     print("data: $data\n");
//   //     final users = List<Map<String, dynamic>>.from(data['users']);
//   //     print(users);

//   //     // Extract courses based on user type (logic can be improved if needed)
//   //     registeredCourses = users.fold<List<Course>>([], (courses, user) {
//   //       if (user['type'] == type && user['id'] == name) {
//   //         courses.addAll(List<Course>.from(
//   //             user['registered_courses'].map((item) => Course.fromJson(item))));
//   //       }
//   //       return courses;
//   //     });

//   //     setState(() {});
//   //   } else {
//   //     // Handle error scenario (e.g., display error message)
//   //     print('Failed to load users: ${response.statusCode}');
//   //   }
//   // }
//   // Future<void> fetchUsers(String name, String? type) async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? storedUsername = prefs.getString('username');
//   //   print(name);

//   //   final url = Uri.parse('http://localhost:3000/users?id=$storedUsername');

//   //   final response = await http.get(url);
//   //   print("response:$response");

//   //   if (response.statusCode == 200) {
//   //     final data = convert.jsonDecode(response.body);
//   //     print("data: $data\n");

//   //     // Check if 'users' is a list before accessing it
//   //     if (data is List) {
//   //       final users = List<Map<String, dynamic>>.from(data);
//   //       print(users);

//   //       // Extract courses based on user type (logic can be improved if needed)
//   //       registeredCourses = users.fold<List<Course>>([], (courses, user) {
//   //         if (user['type'] == type) {
//   //           courses.addAll(List<Course>.from(user['registered_courses']
//   //               .map((item) => Course.fromJson(item))));
//   //         }
//   //         return courses;
//   //       });
//   //     } else {
//   //       // Handle the case where 'users' is not a list (e.g., display error message)
//   //       print('Unexpected data format: users key is not a list');
//   //     }

//   //     print(registeredCourses);

//   //     setState(() {});
//   //   } else {
//   //     // Handle error scenario (e.g., display error message)
//   //     print('Failed to load users: ${response.statusCode}');
//   //   }
//   // }
//   Future<void> fetchUsers(String name, String? type) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? storedUsername = prefs.getString('username');
//   String? storedPassword = prefs.getString('password'); // Assuming password is also stored
//   String? storedToken = 'Token ef03c341eda820cd8e2dc95a1b8e4b75228b1077'; // Assuming token is also stored

//   print(name);

//   final url = Uri.parse('http://localhost:8000/ocms/api/courses/');

//   final response = await http.get(
//     url,
//     headers: {
//         'Authorization': storedToken,
//         'Content-Type': 'application/json',
//       },
//   );
//   // print("response: ${response.body}");

//   if (response.statusCode == 200) {
//     final data = convert.jsonDecode(response.body);
//     print("data: $data\n");

//     // Check if 'courses' is a list before accessing it
//     if (data['courses'] is List) {
//       final coursesData = List<Map<String, dynamic>>.from(data['courses']);
//       print(coursesData);

//       List<Course> registeredCourses = coursesData.map((courseData) {
//         return Course.fromJson(courseData);
//       }).toList();

//       // If needed, filter courses by type or any other criteria
//       // if (type != null) {
//       //   registeredCourses = registeredCourses.where((course) {
//       //     // Apply the type filtering logic here if needed
//       //     // Assuming 'type' is a property in the course object
//       //     return course.type == type; // Adjust this condition based on your data structure
//       //   }).toList();
//       // }

//       print(registeredCourses);

//       // Call setState() to update the UI if you're in a stateful widget
//       // setState(() {});
//     } else {
//       // Handle the case where 'courses' is not a list (e.g., display error message)
//       print('Unexpected data format: courses key is not a list');
//     }
//   } else {
//     // Handle error scenario (e.g., display error message)
//     print('Failed to load courses: ${response.statusCode}');
//   }
// }

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

//     // Determine user type and potentially user ID (logic can be improved)
//     final userType = service.profileData.profile!['user_type'];
//     final userID =
//         service.profileData.user!["first_name"]; // Assuming ID retrieval

//     print("userid:$userID");
//     fetchUsers(service.profileData.user!["first_name"], userType);
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
//                 // for (final course in registeredCourses)
//                 //   InkWell(
//                 //     child: myContainer(
//                 //         course.courseCode + " - " + course.courseName),
//                 //     onTap: () {
//                 //       // Handle course selection (e.g., navigate to course details page)
//                 //       print('Selected course: ${course.courseCode}');
//                 //       Navigator.pushNamed(
//                 //         context,
//                 //         '/registered_courses/course_home',
//                 //       );
//                 //       // You can navigate to a course details page here
//                 //     },
//                 //   ),
//                 for (final course in registeredCourses)
//                   InkWell(
//                     child: myContainer(course.code + " - " + course.name),
//                     onTap: () {
//                       // Handle course selection (e.g., navigate to course details page)
//                       print('Selected course: ${course.code}');
//                       Navigator.pushNamed(
//                         context,
//                         '/registered_courses/course_home',
//                       );
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
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class RegisteredCoursesHome extends StatefulWidget {
  @override
  _RegisteredCoursesHomeState createState() => _RegisteredCoursesHomeState();
}

class Course {
  final int id;
  final String code;
  final String name;
  // Add other fields as needed

  Course({required this.id, required this.code, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      // Initialize other fields as needed
    );
  }
}

class _RegisteredCoursesHomeState extends State<RegisteredCoursesHome> {
  late String name;
  late String depttype;
  List<Course> registeredCourses = [];

  Future<void> fetchUsers(String name, String? type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword =
        prefs.getString('password'); // Assuming password is also stored
    String? storedToken =
        'Token ef03c341eda820cd8e2dc95a1b8e4b75228b1077'; // Assuming token is also stored
    String? token2 = 'Token 7f272a843c2589f1304d0167d8aae96dd649930f';

    print(name);

    final url = Uri.parse('http://localhost:8000/ocms/api/courses/');

    final response = await http.get(
  url,
  headers: {
    'Authorization': type == 'student' ? storedToken : token2,
    'Content-Type': 'application/json',
  },
);
    print("response: ${response.body}");

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print("data: $data\n");

      // Check if 'courses' is a list before accessing it
      if (data['courses'] is List) {
        final coursesData = List<Map<String, dynamic>>.from(data['courses']);
        print(coursesData);

        List<Course> courses = coursesData.map((courseData) {
          return Course.fromJson(courseData);
        }).toList();

        setState(() {
          registeredCourses = courses;
        });

        print(registeredCourses);
      } else {
        // Handle the case where 'courses' is not a list (e.g., display error message)
        print('Unexpected data format: courses key is not a list');
      }
    } else {
      // Handle error scenario (e.g., display error message)
      print('Failed to load courses: ${response.statusCode}');
    }
  }

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
                for (final course in registeredCourses)
                  InkWell(
                    child: myContainer(course.code + " - " + course.name),
                    onTap: () {
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.setInt('selectedCourseId', course.id);
                        print('Selected course: ${course.code}');
                        Navigator.pushNamed(
                          context,
                          '/registered_courses/course_home',
                        );
                      });
                      // Handle course selection (e.g., navigate to course details page)
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
