import 'package:flutter/material.dart';

class Semester extends StatefulWidget {
  final data;
  const Semester({Key? key, this.data}) : super(key: key);
  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.currently_registered);
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
                    DataCell(Text("OE2m07")),
                    DataCell(Text("Operation Research")),
                    DataCell(Text("3")),
                    DataCell(Text("4")),
                  ],
                ),
              ],
            ),
          ),
          // Text(
            // "Current CPI - " + ' ' + widget.data.details['cpi'].toString(),
          // ),
          // Text(
            // "Current SPI - " + ' ' + widget.data.details['spi'].toString(),
          // ),
        ]),
      ),
    );
  }
}
