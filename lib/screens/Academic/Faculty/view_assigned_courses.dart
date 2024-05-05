import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';

class ViewAssignedCourses extends StatefulWidget {
  @override
  _ViewAssignedCourses createState() => _ViewAssignedCourses();
}

class _ViewAssignedCourses extends State<ViewAssignedCourses> {
  bool _loading1 = true;
  late AcademicService academicService;
  List<dynamic> courseList = [];
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
      Response response = await academicService.getAssignedCourses();
      setState(() {
        courseList = jsonDecode(response.body);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    // print(widget.data.currently_registered);

    // List<dynamic> courseList = jsonDecode(widget.courseList);

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: "Assigned Courses",
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
            : TabBarView(
                children: [
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: <DataColumn>[
                                  // DataColumn(
                                  //   label: Text("#"),
                                  //   numeric: false,
                                  // ),
                                  DataColumn(
                                    label: Text("Course Code"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Course Type"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Programme"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Branch"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Semester"),
                                    numeric: false,
                                  ),
                                  DataColumn(label: Text("Roll List"), numeric: false),
                                ],
                                rows: courseList.map((data) {
                                  return DataRow(cells: [
                                    DataCell(
                                        Text(data['course_code'].toString())),
                                    DataCell(
                                        Text(data['course_type'].toString())),
                                    DataCell(
                                        Text(data['programme'].toString())),
                                    DataCell(Text(data['branch'].toString())),
                                    DataCell(Text(data['sem'].toString())),
                                    DataCell(ElevatedButton(
                                      onPressed: () {
                                        // Handle Apply for Registration action
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.orange[900]),
                                      ),
                                      child: Text('Generate Roll List',
                                          style: TextStyle(color: Colors.white)),
                                    )),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
