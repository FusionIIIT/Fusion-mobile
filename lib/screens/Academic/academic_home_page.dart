import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/models/academic.dart';
import 'dart:async';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'dart:convert';
import 'package:http/http.dart';

main() async {
  //  final String? token;
  // static String tag = 'academic-page';
  // AcademicHomePage(this.token);
  late ProfileService profileService;
  late ProfileData data;
  bool _loading = true;
  late String studentType;
  profileService = ProfileService();
  try {
    Response response = await profileService.getProfile();

    data = ProfileData.fromJson(jsonDecode(response.body));

    print(data.user!['username']);
    _loading = false;
    studentType = data.profile!['department']!['name'] +
        '  ' +
        data.profile!['user_type'];
    print(studentType);
  } catch (e) {
    print(e);
  }
}

class AcademicHomePage extends StatefulWidget {
  // final String? token;
  // static String tag = 'academic-page';
  // AcademicHomePage(this.token);
  @override
  _AcademicHomePageState createState() => _AcademicHomePageState();
}

class _AcademicHomePageState extends State<AcademicHomePage> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading = true;

  late StreamController _profileController;
  late String studentType;
  late ProfileService profileService;
  late ProfileData data;
  @override
  void initState() {
    super.initState();

    _profileController = StreamController();
    profileService = ProfileService();

    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));

        print(data.user!['username']);
        _loading = false;
      });
      studentType = data.profile!['department']!['name'] +
          '  ' +
          data.profile!['user_type'];
      // print(studentType);
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _profileController.add(res);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      //  border: new Border.all(
      //     color: Colors.deepOrangeAccent,
      //     width: 2.0,
      //     style: BorderStyle.solid,
      //   ),
      color: Colors.white, // Add
      boxShadow: [
        // Add this full block boxshadow
        BoxShadow(
          color: Color.fromARGB(255, 139, 139, 139),
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(4.0), // change radius 15 to 4
      ),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          letterSpacing:
              0.7), //Change fontsize 20 to 17,fontweight w500 to w w600 ans add leetetespace
    );
  }

  //  Padding myContainer(String text) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: myText(text),
  //       ),
  //       decoration: myBoxDecoration(),
  //     ),
  //   );
  // }

  // Change this full block with given bellow block
  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [myText(text)],
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar().buildAppBar(),
//       drawer: SideDrawer(),
//       body: _loading1 == true
//           ? Center(child: CircularProgressIndicator())
//           : ListView(
//               shrinkWrap: true,
//               physics: ClampingScrollPhysics(),
//               children: [
//                 Card(
//                   elevation: 2.0,
//                   margin:
//                       EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//                   shadowColor: Colors.black,
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 20.0),
//                         width: 170.0,
//                         height: 170.0,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/unknown.jpg'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Text(
//                         //NAME OF USER
//                         data.details!['current_user']['first_name'] +
//                             ' ' +
//                             data.details!['current_user']['last_name'],
//                         style: TextStyle(fontSize: 20.0, color: Colors.black),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Text(
//                         data.details!['user_branch'] + ' | ' + "STUDENT",
//                         style: TextStyle(fontSize: 15.0, color: Colors.black),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Center(
//                           child: Text(
//                         "Academic",
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.white,
//                         ),
//                       )),
//                     ),
//                     decoration: new BoxDecoration(
//                       color: Colors.deepOrangeAccent,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black,
//                           offset: Offset(0.0, 1.0),
//                           blurRadius: 2.0,
//                         )
//                       ],
//                       borderRadius:
//                           new BorderRadius.all(new Radius.circular(5.0)),
//                     ),
//                   ),
//                 ),

// change this whole block with below
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
            color: Color.fromARGB(255, 58, 58, 58),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/unknown.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.0,
                  ),
                  Text(
                    //NAME OF USER
                    data.user!['first_name'] + ' ' + data.user!['last_name'],
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    data.profile!['department']!['name'] + '  ' + "Student",
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                  "Academics Work",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                )),
              ),
              decoration: new BoxDecoration(
                color: Color.fromARGB(255, 247, 100, 55),
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
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
                  child: myContainer("Current Semester"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/academic_home_page/current_semester_home_page',
                    );
                  },
                ),
                InkWell(
                  child: myContainer("Registration"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/academic_home_page/registration_home_page',
                    );
                  },
                ),
                InkWell(
                  child: myContainer("Add/Drop courses"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/academic_home_page/add_drop_courses');
                  },
                ),
                InkWell(
                  child: myContainer("Check Dues"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/academic_home_page/dues',
                    );
                  },
                ),
                InkWell(
                  child: myContainer("Thesis"),
                  onTap: () {
                    Navigator.pushNamed(context, '/academic_home_page/thesis');
                  },
                ),
                InkWell(
                  child: myContainer("Apply for Bonafide"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/academic_home_page/bonafide',
                    );
                  },
                ),
                InkWell(
                  child: myContainer("Check Attendance"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/academic_home_page/attendance');
                  },
                ),
                InkWell(
                  child: myContainer("Branch Change"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/academic_home_page/branch_change');
                  },
                ),
                InkWell(
                  child: myContainer("Evaluate Teaching Credits"),
                  //onTap: (){},
                ),
                InkWell(
                  child: myContainer("View Performance"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/academic_home_page/performance');
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
