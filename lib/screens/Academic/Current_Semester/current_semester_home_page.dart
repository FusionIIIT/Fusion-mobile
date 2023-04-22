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
    final AcademicData data =
        ModalRoute.of(context)!.settings.arguments as AcademicData;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            "Current Semester" + ' - ' + data.details!['user_sem'].toString(),
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
        ),
        drawer: SideDrawer(),
        body: Container(
          child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                DefaultTabController(
                  length: 5, // length of tabs
                  initialIndex: 0,
                  child: Column(children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        isScrollable: true,
                        indicatorColor: Colors.black,
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
                    Container(
                      height: 400, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            child: Semester(data: data),
                          ),
                          Container(
                            child: TimeTable(),
                          ),
                          Container(
                            child: AcademicCalendar(),
                          ),
                          Container(
                            child: HolidaysList(),
                          ),
                          Container(
                            child: ExamTimeTable(),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
