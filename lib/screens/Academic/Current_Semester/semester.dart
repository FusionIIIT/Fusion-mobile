import 'package:flutter/material.dart';

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
    List<Map<String, dynamic>> courseList = widget.courseList;

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                // DataColumn(
                //   label: Text("#"),
                //   numeric: false,
                // ),
                DataColumn(
                  label: Text("Slot Name"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Slot Type"),
                  numeric: false,
                ),
                // DataColumn(
                //   label: Text("Slot Name"),
                //   numeric: false,
                // ),
                // DataColumn(
                //   label: Text("Slot Type"),
                //   numeric: false,
                // ),
                DataColumn(
                  label: Text("Course Name"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course Code"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Credits"),
                  numeric: false,
                )
              ],
              //
              rows: courseList.map((data) {
                return DataRow(cells: [
                  DataCell(Text(data['slot_name'].toString())),
                  DataCell(Text(data['slot_type'].toString())),
                  DataCell(Text(data['course_name'].toString())),
                  DataCell(Text(data['course_code'].toString())),
                  DataCell(Text(data['credit'].toString())),
                ]);
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
