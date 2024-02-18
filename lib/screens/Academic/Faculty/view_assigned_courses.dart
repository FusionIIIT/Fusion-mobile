import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
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
        print(response.body);
        // courseList = response.body;
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "FUSION",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'View Assigned Courses',
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
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
                                ],
                                rows: courseList.map((data) {
                                  return DataRow(cells: [
                                    DataCell(
                                        Text(data['course_code'].toString())),
                                    DataCell(
                                        Text(data['course_type'].toString())),
                                    DataCell(
                                        Text(data['programmme'].toString())),
                                    DataCell(Text(data['branch'].toString())),
                                    DataCell(Text(data['sem'].toString())),
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
