

import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Current_Semester/academic_calendar.dart';
import 'package:fusion/screens/Academic/Current_Semester/exam_time_table.dart';
import 'package:fusion/screens/Academic/Current_Semester/list_of_holidays.dart';
import 'package:fusion/screens/Academic/Current_Semester/semester.dart';
import 'package:fusion/screens/Academic/Current_Semester/time_table.dart';
import 'package:fusion/screens/Login%20and%20Dashboard/Components/side_drawer.dart';

class CurrentSemesterHomePage extends StatefulWidget {
  @override
  _CurrentSemesterHomePageState createState() => _CurrentSemesterHomePageState();
}

class _CurrentSemesterHomePageState extends State<CurrentSemesterHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Current Semester",
            style: TextStyle(color: Colors.white),
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
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Semester',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Time-Table',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Academic Calendar',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'List of Holidays',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Exam time table',
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            Semester(),
            TimeTable(),
            AcademicCalendar(),
            HolidaysList(),
            ExamTimeTable(),
          ],
        ),
      ),
    );
  }
}
