import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/Department/Alumni_details/alumni_details.dart';
import 'package:fusion/screens/Department/Student_details/student_details.dart';
import 'package:fusion/screens/Department/Faculty_details/faculty_details.dart';
import 'package:fusion/screens/Department/Announcements/browse_announcement.dart';

void main() {
  runApp(DepartmentScreen());
}

class DepartmentScreen extends StatefulWidget {
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  ProfileData? data;
  late var fetchedDepartment;
  late String selectedDepartment;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;
    if (data != null &&
        data!.profile != null &&
        data!.profile!['department'] != null) {
      selectedDepartment =
          data!.profile!['department']!['name'] + ' Department';
    } else {
      selectedDepartment = 'CSE Department';
    }
  }

  List<String> departmentOptions = [
    'CSE Department',
    'ECE Department',
    'ME Department',
    'SM Department'
  ];

  @override
  Widget build(BuildContext context) {
    // Define the RGBA color
    Color customColor = Colors.deepOrangeAccent;
    Color outlineColor = Colors.grey;

    return MaterialApp(
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
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
                        top: 10.0,
                        bottom: 12.0,
                        left: 24,
                        right: 24), // Add your desired padding value
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
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: data!.profile!['department']!['name'],
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: ' '), // Add space between the texts
                              TextSpan(
                                text: data!.profile!['user_type'],
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
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StudentDetailsScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Text('Student details',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: customColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 14),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FacultyDetailsScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Text('Faculty details',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: customColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 14),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AlumniDetailsScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Text('Alumni details',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: customColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 14),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BrowseAnnouncementScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Text('Announcements',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: customColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
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
                        value: selectedDepartment,
                        items: departmentOptions.map((String department) {
                          return DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
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
      ),
    );
  }
}
