

import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Current_Semester/academic_calendar.dart';
import 'package:fusion/screens/Academic/Current_Semester/exam_time_table.dart';
import 'package:fusion/screens/Academic/Current_Semester/list_of_holidays.dart';
import 'package:fusion/screens/Academic/Current_Semester/semester.dart';
import 'package:fusion/screens/Academic/Current_Semester/time_table.dart';

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
          title: Text('current semester'),
          backgroundColor: Colors.grey[900],
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
