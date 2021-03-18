import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body:Container(
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
              columns: <DataColumn>[
                DataColumn(
                  label: Text("Course ID"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Present"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Total Classes"),
                  numeric: false,
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
