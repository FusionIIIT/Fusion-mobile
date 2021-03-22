

import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Text("Available Courses for Next Semester"),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text("#"),
                    numeric: false,
                  ),
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
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("")),
                      DataCell(Text("")),
                      DataCell(Text("")),
                      DataCell(Text("")),
                      DataCell(Text("")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
