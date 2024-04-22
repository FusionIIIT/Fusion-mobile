import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/models/academic.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class AttendanceRecord {
  String courseId;
  int present;
  int totalClass;

  AttendanceRecord(
      {required this.courseId,
      required this.present,
      required this.totalClass});

  //comparator behaviours used for sorting
  // ignore: non_constant_identifier_names
  static int compare_course_id(AttendanceRecord a, AttendanceRecord b) =>
      a.courseId.compareTo(b.courseId);

  // ignore: non_constant_identifier_names
  static int compare_attendance(AttendanceRecord a, AttendanceRecord b) =>
      a.present - b.present;

  // ignore: non_constant_identifier_names
  static int compare_total_class(AttendanceRecord a, AttendanceRecord b) =>
      a.totalClass - b.totalClass;
}

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  int _currentSortColumn = 0;
  bool _isAscending = true;

  List<AttendanceRecord> _attendanceRecordList = [];

  //default comparator for sorting
  int Function(AttendanceRecord, AttendanceRecord) _compare_behaviour =
      AttendanceRecord.compare_course_id;

  //construct list of DataRow from list of AttendanceRecord
  //uses cmpBehaviour to sort data
  List<DataRow> getRows() {
    List<DataRow> list = [];
    //use comparator to sort list,
    //if sort in descending then multiply -1 to comparator
    _attendanceRecordList.sort((a, b) => _isAscending == true
        ? _compare_behaviour(a, b)
        : -_compare_behaviour(a, b));
    _attendanceRecordList.forEach((record) {
      list.add(DataRow(cells: [
        DataCell(Text(record.courseId)),
        DataCell(Text(record.present.toString())),
        DataCell(Text(record.totalClass.toString()))
      ]));
    });
    return list;
  }

  //called by DataColumn.onSort property,
  //based on columnIndex and sortAscending, it updates variables
  //responsible for sorting
  update_compare_behaviour(int columnIndex, bool sortAscending,
      int Function(AttendanceRecord, AttendanceRecord) cmpBehaviour) {
    //if tapped on already selected column header => change sort order
    //of current column
    if (columnIndex == _currentSortColumn) {
      _isAscending = !_isAscending;
    }
    //if tapped on newly selected column header =>
    //sort selected column in ascending order
    else {
      _currentSortColumn = columnIndex;
      _isAscending = true;
    }
    _compare_behaviour = cmpBehaviour;
  }

  @override
  Widget build(BuildContext context) {
    final AcademicData data =
        ModalRoute.of(context)!.settings.arguments as AcademicData;
    final Map? attendanceMap = data.attendance;
    //if attendanceMap is null, then DataRows cannot be constructed, then
    //default to a error message
    if (attendanceMap == null) {
      print(
          'Received null map attendanceMap for constructing DataTable in Check_Attendance');
    } else {
      _attendanceRecordList = [];
      attendanceMap.forEach((key, value) {
        _attendanceRecordList.add(AttendanceRecord(
            courseId: key,
            present: value['present'],
            totalClass: value['total']));
      });
    }

    return Scaffold(
      appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'Branches', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                sortColumnIndex: _currentSortColumn,
                sortAscending: _isAscending,
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text("Course ID"),
                    numeric: false,
                    onSort: (columnIndex, sortAscending) {
                      setState(() {
                        update_compare_behaviour(columnIndex, sortAscending,
                            AttendanceRecord.compare_course_id);
                      });
                    },
                  ),
                  DataColumn(
                    label: Text("Present"),
                    numeric: false,
                    onSort: (columnIndex, sortAscending) {
                      setState(() {
                        update_compare_behaviour(columnIndex, sortAscending,
                            AttendanceRecord.compare_attendance);
                      });
                    },
                  ),
                  DataColumn(
                    label: Text("Total Classes"),
                    numeric: false,
                    onSort: (columnIndex, sortAscending) {
                      setState(() {
                        update_compare_behaviour(columnIndex, sortAscending,
                            AttendanceRecord.compare_total_class);
                      });
                    },
                  ),
                ],
                rows: getRows()),
          ),
        ),
      ),
    );
  }
}
