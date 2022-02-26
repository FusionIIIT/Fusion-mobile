import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  final List? data;
  const Courses({Key? key, this.data}) : super(key: key);
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  getRows() {
    List <DataRow> dummy = [
      DataRow(cells: [
        DataCell(Text('Dummy Course Code')),
        DataCell(Text('Dummy Course Name')),
        DataCell(Text('Dummy Credit')),
        DataCell(Text('Dummy Semester')),
      ]),
      // DataRow(cells: [
      //   DataCell(Text('DS302')),
      //   DataCell(Text('Engineering Design')),
      //   DataCell(Text('4')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS307')),
      //   DataCell(Text('Computer Network')),
      //   DataCell(Text('4')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS308')),
      //   DataCell(Text('Operating System')),
      //   DataCell(Text('4')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS309')),
      //   DataCell(Text('Language Theory')),
      //   DataCell(Text('4')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS310a')),
      //   DataCell(Text('Soft Computing')),
      //   DataCell(Text('2')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS310b')),
      //   DataCell(Text('Parallel Computing')),
      //   DataCell(Text('2')),
      //   DataCell(Text('5')),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('CS311L')),
      //   DataCell(Text('Lab based Project 2')),
      //   DataCell(Text('2')),
      //   DataCell(Text('5')),
      // ]),
    ];

    if(widget.data == null){
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
}
