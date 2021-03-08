

import 'package:flutter/material.dart';

class Semester extends StatefulWidget {
  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
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
            Text('Current CPI'),
            Text('SPI'),
          ],
        ),
      ),
    );
  }
}
