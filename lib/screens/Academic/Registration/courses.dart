import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  final List? data;
  const Courses({Key? key, this.data}) : super(key: key);
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    // List? finalData = widget.data?.add_courses_options;
    return Container(
        child: Column(
      children: [
        SizedBox(height: 20),
        Text("Available Courses for Next Semester"),
        SizedBox(height: 10),
        // if (finalData != null)
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: <DataColumn>[
              DataColumn(
                label: Text("Course ID"),
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
            ], rows: getRows()),
          ),
        ),
        // if (finalData == null)
        // Expanded(
        //     child: Center(
        //         child: Text(
        //   'Course List not available',
        //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        // )))
      ],
    ));
  }

  List<DataRow> getRows() {
    List<DataRow> dummy = [
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
    ];

    if (widget.data == null) {
      print("Current Registered Courses List is null");
      return dummy;
    }

    if (widget.data!.length == 0) {
      print("Current Registered Courses List is Empty");
      return dummy;
    }

    return widget.data!
        .map((element) => DataRow(cells: [
              DataCell(Text(element['course_id']['id'].toString())),
              DataCell(Text(element['course_code'].toString())),
              DataCell(Text(element['course_id']['course_name'].toString())),
              DataCell(Text(element['credits'].toString())),
              DataCell(Text(element['sem'].toString()))
            ]))
        .toList();
  }
}
