import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  final data;
  const Courses({Key? key, this.data}) : super(key: key);
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  getRows(List? map) {
    List<DataRow> list = [];
    map!.forEach((element) {
      element.length > 0
          ? list.add(DataRow(cells: [
              DataCell(Text(element['course_id']['id'].toString())),
              DataCell(Text(element['course_code'].toString())),
              DataCell(Text(element['course_id']['course_name'].toString())),
              DataCell(Text(element['credits'].toString())),
              DataCell(Text(element['sem'].toString()))
            ]))
          : true;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List? finalData = widget.data.add_courses_options;
    print(finalData);
    if (finalData == null) finalData = [];
    return Container(
        child: Column(
      children: [
        Text("Available Courses for Next Semester"),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: <DataColumn>[
              DataColumn(
                label: Text("Course Id"),
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
            ], rows: getRows(finalData)),
          ),
        ),
      ],
    ));
  }
}
