import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  final data;
  const Courses({Key? key, this.data}) : super(key: key);
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  getRows() {
    return [
      DataRow(cells: [
        DataCell(Text('DS302')),
        DataCell(Text('Engineering Design')),
        DataCell(Text('4')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS307')),
        DataCell(Text('Computer Network')),
        DataCell(Text('4')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS308')),
        DataCell(Text('Operating System')),
        DataCell(Text('4')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS309')),
        DataCell(Text('Language Theory')),
        DataCell(Text('4')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS310a')),
        DataCell(Text('Soft Computing')),
        DataCell(Text('2')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS310b')),
        DataCell(Text('Parallel Computing')),
        DataCell(Text('2')),
        DataCell(Text('5')),
      ]),
      DataRow(cells: [
        DataCell(Text('CS311L')),
        DataCell(Text('Lab based Project 2')),
        DataCell(Text('2')),
        DataCell(Text('5')),
      ]),
    ];

    // map?.forEach((element) {
    //   element.length > 0
    //       ? list.add(DataRow(cells: [
    //           DataCell(Text(element['course_id']['id'].toString())),
    //           DataCell(Text(element['course_code'].toString())),
    //           DataCell(Text(element['course_id']['course_name'].toString())),
    //           DataCell(Text(element['credits'].toString())),
    //           DataCell(Text(element['sem'].toString()))
    //         ]))
    //       : true;
    // });
    // list.add(DataRow(cells: ));
    // return list;
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
