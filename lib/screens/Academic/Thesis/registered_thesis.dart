

import 'package:flutter/material.dart';

class RegisteredThesis extends StatefulWidget {
  @override
  _RegisteredThesisState createState() => _RegisteredThesisState();
}

class _RegisteredThesisState extends State<RegisteredThesis> {
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
                    label: Text("Course"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Thesis Topic"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Supervisor"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Status"),
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
          ],
        ),
      ),
    );
  }
}
