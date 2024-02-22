import 'package:flutter/material.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Semester extends StatefulWidget {
  // final data;
  final courseList;
  const Semester({Key? key, this.courseList}) : super(key: key);
  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> courseList = jsonDecode(widget.courseList);

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  DataCell(Text(data['course_id']['id'].toString())),
                  DataCell(Text(data['course_code'].toString())),
                  DataCell(Text(data['course_id']['course_name'].toString())),
                  DataCell(Text(data['credits'].toString())),
                  DataCell(Text(data['sem'].toString())),
                ]);
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
