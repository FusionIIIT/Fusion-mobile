import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Add_Drop_Courses/add_drop_courses.dart';
import 'package:fusion/screens/Establishment/establishment_home_page.dart';
import 'package:fusion/screens/Library/Book_Search.dart';
import 'package:fusion/screens/Library/issued_items.dart';
import 'package:fusion/screens/Library/lib_home_screen.dart';
import 'package:fusion/screens/LoginandDashboard/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/login_page.dart';
import 'package:fusion/screens/Academic/academic_home_page.dart';
import 'package:fusion/screens/Academic/Current_Semester/current_semester_home_page.dart';
import 'package:fusion/screens/Academic/Registration/registration_home_page.dart';
import 'package:fusion/screens/Academic/Thesis/thesis_home_page.dart';
import 'package:fusion/screens/Academic/Apply_for_Bonafide/bonafide.dart';
import 'package:fusion/screens/Academic/Branch_Change/branch_change.dart';
import 'package:fusion/screens/Academic/Check_Attendance/attendance.dart';
import 'package:fusion/screens/Academic/View_Performance/performance.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues.dart';
import 'package:fusion/screens/Gymkhana/GymkhanaHomepage.dart';
import 'package:fusion/screens/Gymkhana/Polls.dart';
import 'package:fusion/screens/Gymkhana/Apply.dart';
import 'package:fusion/screens/Gymkhana/Record.dart';
import 'package:fusion/screens/Gymkhana/Club.dart';
import 'package:fusion/screens/Complaint/complaint.dart';
import 'package:fusion/screens/Profile/profile.dart';
import 'package:fusion/screens/landing_page.dart';
import 'package:fusion/screens/Healthcenter/healthcentermodule.dart';
import 'package:fusion/screens/Healthcenter/feedback.dart';
import 'package:fusion/screens/Healthcenter/viewschedule.dart';
import 'package:fusion/screens/Healthcenter/history.dart';
import 'package:fusion/screens/Healthcenter/HealthCenter.dart';
import 'package:fusion/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fusion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Nunito'),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/login_page': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/academic_home_page': (context) => AcademicHomePage(
            ModalRoute.of(context)!.settings.arguments.toString()),
        '/academic_home_page/current_semester_home_page': (context) =>
            CurrentSemesterHomePage(),
        '/academic_home_page/registration_home_page': (context) =>
            RegistrationHomePage(),
        '/academic_home_page/bonafide': (context) => Bonafide(),
        '/academic_home_page/branch_change': (context) => BranchChange(),
        '/academic_home_page/attendance': (context) => Attendance(),
        '/academic_home_page/dues': (context) => Dues(),
        '/academic_home_page/thesis': (context) => ThesisHomePage(),
        '/academic_home_page/performance': (context) => Performance(),
        '/academic_home_page/add_drop_courses': (context) => AddDropCourses(),
        '/establishment': (context) => Establishment(),
        '/gymkhana_homepage': (context) => GymkhanaHomepage(),
        '/gymkhana_homepage/apply': (context) => Apply(),
        '/gymkhana_homepage/polls': (context) => Polls(),
        '/gymkhana_homepage/clubs': (context) => Club(),
        '/gymkhana_homepage/member_records': (context) => Records(),
        '/library_homepage': (context) => LibraryHomeScreen(),
        '/library_homepage/book_search': (context) => BookSearch(),
        '/library_homepage/issued_items': (context) => IssuedItems(),
        '/library_homepage/dues': (context) => Dues(),
        '/complaint': (context) =>
            Complaint(ModalRoute.of(context)!.settings.arguments.toString()),
        '/profile': (context) => Profile(),
        '/health_center': (context) => HealthCenterMod(
            ModalRoute.of(context)!.settings.arguments.toString()),
        '/health_center/healthcenter': (context) => HealthCenter(),
        '/health_center/feedback': (context) => FeedBack(),
        '/health_center/viewschedule': (context) => ViewSchedule(),
        '/health_center/history': (context) => History(),
      },
    );
  }
}
