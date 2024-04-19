import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ReplaceCourses extends StatefulWidget {
  @override
  _ReplaceCoursesState createState() => _ReplaceCoursesState();
}

class _ReplaceCoursesState extends State<ReplaceCourses> {
  bool _loading1 = true;
  late AcademicService academicService;
  List<dynamic> courseList = [];
  Map<String, String?> preferences = {};
  int index = -1;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    getAssignedCourses();
  }

  getAssignedCourses() async {
    try {
      Response response = await academicService.getRegistrationCourses();
      setState(() {
        courseList = jsonDecode(response.body)['next_sem_registration_courses'];
        for (var i = 0; i < courseList.length; i++) {
          preferences[courseList[i]['slot_name']] =
              courseList[i]['courses'][0]['name'].toString();
        }
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Replace Courses",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
          MyBottomNavigationBar(),
      body: _loading1 == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Slot name')),
                        DataColumn(label: Text('Slot Type')),
                        DataColumn(label: Text('Semester')),
                        DataColumn(label: Text('Credits')),
                        DataColumn(label: Text('Allocated Course')), // New column
                        DataColumn(label: Text('Replace')),
                      ],
                      rows: courseList.map((data) {
                        index++;
                        final courses = data['courses'] as List;

                        // Use a map function to get the 'name' property from each course object
                        List<String> courseNames = courses
                            .map((course) => course['name'] as String)
                            .toList();

                        return DataRow(cells: [
                          DataCell(Text('oe${index + 1}')), // Hardcoded slot name
                          DataCell(Text(data['slot_type'].toString())),
                          DataCell(Text(data['semester'].toString())),
                          DataCell(
                              Text(data['courses'][0]['credit'].toString())),
                          DataCell(Text('Allocated Course')), // Hardcoded allocated course
                          DataCell(DropdownButton<String>(
                            value: preferences[data['slot_name']],
                            onChanged: (String? newValue) {
                              setState(() {
                                preferences[data['slot_name']] = newValue;
                              });
                            },
                            items: courseNames.map((course) {
                              return DropdownMenuItem<String>(
                                value: course,
                                child: Text(course),
                              );
                            }).toList(),
                          )),
                        ]);
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                      height:
                          20), // Adding spacing between table and submit button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                                .orange[
                            900]), // Setting background color of button to blue
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text('Replace Courses',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          20), // Adding spacing between submit button and bottom
                ],
              ),
            ),
    );
  }
}
