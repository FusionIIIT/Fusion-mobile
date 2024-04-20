// ignore_for_file: must_be_immutable
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Department/Alumni_details/alumni_details.dart';
import 'package:fusion/screens/Department/Faculty_details/faculty_details.dart';
import 'package:fusion/screens/Department/Announcements/browse_announcement.dart';
import 'package:fusion/screens/Department/Student_details/student_details.dart';
import 'package:fusion/screens/Department/facilities.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class DepartmentScreen extends StatefulWidget {
  String? token;
  DepartmentScreen(this.token);
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData? data;
  bool _loading = true;
  late var fetchedDepartment;
  late String selectedDepartment;

  @override
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    var service = locator<StorageService>();
    data = service.profileData;
    getData();

    if (data != null &&
        data!.profile != null &&
        data!.profile!['department'] != null) {
      selectedDepartment =
          data!.profile!['department']!['name'] + ' Department';
    } else {
      selectedDepartment = 'CSE Department';
    }
  }

  getData() async {
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));
        // print(data!.user!);
        // print(data!.profile!);
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _profileController.add(res);
    });
  }

  List<String> departmentOptions = [
    'CSE Department',
    'ECE Department',
    'ME Department',
    'SM Department'
  ];

  @override
  Widget build(BuildContext context) {
    Color customColor = kPrimaryColor;
    Color outlineColor = Colors.grey;

    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Department",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2.0,
                      shadowColor: Colors.black,
                      color: Color.fromARGB(255, 255, 237, 232),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 12.0, left: 24, right: 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 22.0),
                              width: 180.0, // Increased width
                              height: 160.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/unknown.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              data!.user!['first_name'] +
                                  ' ' +
                                  data!.user!['last_name'],
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            RichText(
                              text: TextSpan(
                                text: data!.profile!['department']!['name'],
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                children: [
                                  TextSpan(text: ' '),
                                  TextSpan(
                                    text: curr_desig,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 234, 228, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FacilitiesPage(),
                                        ),
                                      );
                                    },
                                    child: Text('Facilities',
                                        style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: customColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                                SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StudentDetails(),
                                        ),
                                      );
                                    },
                                    child: Text('Student details',
                                        style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: customColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                                SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FacultyDetailsScreen(
                                                  selectedDepartment: data!
                                                          .profile![
                                                      'department']!['name']),
                                        ),
                                      );
                                    },
                                    child: Text('Faculty details',
                                        style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: customColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                                SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AlumniDetails(),
                                        ),
                                      );
                                    },
                                    child: Text('Alumni details',
                                        style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: customColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                                SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BrowseAnnouncement()),
                                      );
                                    },
                                    child: Text('Announcements',
                                        style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: customColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 18),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: outlineColor, width: 2.0),
                          ),
                          child: DropdownButton<String>(
                            value:
                                departmentOptions.contains(selectedDepartment)
                                    ? selectedDepartment
                                    : '----------',
                            items: departmentOptions.map((String department) {
                              return DropdownMenuItem<String>(
                                value: department,
                                child: Text(department),
                              );
                            }).toList()
                              ..add(DropdownMenuItem<String>(
                                  value: '----------',
                                  child: Text('----------'))),
                            onChanged: (String? newValue) {
                              if (newValue != null &&
                                  newValue != '----------') {
                                setState(() {
                                  selectedDepartment = newValue;
                                });
                              }
                            },
                            underline: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
