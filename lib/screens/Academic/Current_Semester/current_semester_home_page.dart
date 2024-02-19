import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/screens/Academic/Current_Semester/academic_calendar.dart';
import 'package:fusion/screens/Academic/Current_Semester/exam_time_table.dart';
import 'package:fusion/screens/Academic/Current_Semester/list_of_holidays.dart';
import 'package:fusion/screens/Academic/Current_Semester/semester.dart';
import 'package:fusion/screens/Academic/Current_Semester/time_table.dart';

class CurrentSemesterHomePage extends StatefulWidget {
  @override
  _CurrentSemesterHomePageState createState() =>
      _CurrentSemesterHomePageState();
}

class _CurrentSemesterHomePageState extends State<CurrentSemesterHomePage> {
  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)!.settings.arguments as AcademicData;
    final courseList = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black, // Setting background color of app bar
          title: Text(
            'Offered Courses',
            style:
                TextStyle(color: Colors.white), // Setting text color to white
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Semester(courseList: courseList)
        // TimeTable(),Time-T
        // AcademicCalendar(),
        // HolidaysList(),
        // ExamTimeTable(),
        );
  }
}
