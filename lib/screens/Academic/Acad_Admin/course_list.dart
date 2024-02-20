import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseList createState() => _CourseList();
}

class _CourseList extends State<CourseList> {
  List<dynamic> courseList = [];
  bool _loading1 = true;
  late AcademicService academicService;

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    Future.delayed(Duration.zero, () {
      final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
      print(arguments['programme']);
      print(arguments['branch']);
      print(arguments['batch']);
      getCourseList(
          arguments['programme'], arguments['branch'], arguments['batch']);
    });
  }

  getCourseList(String programme, String branch, String batch) async {
    try {
      Response response =
          await academicService.getCourseList(programme, branch, batch);
      setState(() {
        courseList = jsonDecode(response.body);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black, // Setting background color of app bar
          title: Text(
            'Course List',
            style:
                TextStyle(color: Colors.white), // Setting text color to white
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
        ),
        body: _loading1 == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text("#"),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text("Course Code"),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text("Course Name"),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text("Credits"),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text("Semester"),
                                numeric: false,
                              )
                            ],
                            rows: courseList.map((data) {
                              return DataRow(cells: [
                                DataCell(
                                    Text(data['course_id']['id'].toString())),
                                DataCell(Text(data['course_code'].toString())),
                                DataCell(Text(data['course_id']['course_name']
                                    .toString())),
                                DataCell(Text(data['credits'].toString())),
                                DataCell(Text(data['sem'].toString())),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ]),
                ),
              ));
  }
}
