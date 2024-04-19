import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/Department/Student_details/batch_details.dart';

class StudentDetails extends StatefulWidget {
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  ProfileData? data;
  late String programme;
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
  Map<String, String> departmentCodes = {
    'CSE Department': '1',
    'ECE Department': '2',
    'ME Department': '3',
    'SM Department': '4',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: data!.profile!['department']!['name'],
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        children: [
                          TextSpan(text: ' '),
                          TextSpan(
                            text: data!.profile!['user_type'],
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
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
            Container(
              margin: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrangeAccent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Students',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(color: kPrimaryColor),
                foregroundColor: kPrimaryColor,
                backgroundColor: Colors.white,
                minimumSize: Size(550, 50),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatchDetails(
                      selectedProgramme: 'PhD',
                      selectedDepartmentData: {
                        'department': selectedDepartment,
                        'departmentCode':
                            departmentCodes[selectedDepartment] ?? '',
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'PhD Students',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(color: kPrimaryColor),
                foregroundColor: kPrimaryColor,
                backgroundColor: Colors.white,
                minimumSize: Size(550, 50),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatchDetails(
                      selectedProgramme: 'M.Tech',
                      selectedDepartmentData: {
                        'department': selectedDepartment,
                        'departmentCode':
                            departmentCodes[selectedDepartment] ?? '',
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'M.Tech Students',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(color: kPrimaryColor),
                foregroundColor: kPrimaryColor,
                backgroundColor: Colors.white,
                minimumSize: Size(550, 50),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatchDetails(
                      selectedProgramme: 'B.Tech',
                      selectedDepartmentData: {
                        'department': selectedDepartment,
                        'departmentCode':
                            departmentCodes[selectedDepartment] ?? '',
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'B.Tech Students',
                style: TextStyle(fontSize: 18),
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
                    border: Border.all(color: Colors.grey, width: 2.0),
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
    );
  }
}
