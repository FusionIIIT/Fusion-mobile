import 'package:flutter/material.dart';

class Semester extends StatefulWidget {
  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DataTable(
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
          Text(
            "Current CPI- 9.5",
          ),
          Text(
            "Current SPI - ",
          ),
        ],
      ),
    );
  }
}
