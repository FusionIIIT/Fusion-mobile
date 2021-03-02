import 'package:flutter/material.dart';
import 'package:fusion/screens/home.dart';
import 'package:fusion/screens/Academic/academic_home_page.dart';
import 'package:fusion/screens/Academic/Current_Semester/current_semester_home_page.dart';
import 'package:fusion/screens/Academic/Registration/registration_home_page.dart';
import 'package:fusion/screens/Academic/Thesis/thesis_home_page.dart';
import 'package:fusion/screens/Academic/Apply_for_Bonafide/bonafide.dart';
import 'package:fusion/screens/Academic/Branch_Change/branch_change.dart';
import 'package:fusion/screens/Academic/Check_Attendance/attendance.dart';
import 'package:fusion/screens/Academic/View_Performance/performance.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/academic_home_page',
      routes: {
        '/academic_home_page' : (context) => AcademicHomePage(),
        '/current_semester_home_page': (context) => CurrentSemesterHomePage(),
        '/registration_home_page': (context) => RegistrationHomePage(),
        '/bonafide': (context) => Bonafide(),
        '/branch_change': (context) => BranchChange(),
        '/attendance': (context) => Attendance(),
        '/dues': (context) => Dues(),
        '/thesis': (context) => ThesisHomePage(),
        '/performance': (context) => Performance(),
      },
    );
  }
}