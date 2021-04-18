import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/academic.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  getRows(Map map) {
    List<DataRow> list = [];
    map.forEach((key, value) {
      list.add(DataRow(cells: [
        DataCell(Text(key)),
        DataCell(Text(value["present"].toString())),
        DataCell(Text(value["total"].toString()))
      ]));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final AcademicData data =
        ModalRoute.of(context)!.settings.arguments as AcademicData;
    final Map? attendanceMap = data.attendance;
    //print(attendanceMap);
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey),
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
                rows: getRows(attendanceMap!)),
          ),
        ),
      ),
    );
  }
}
