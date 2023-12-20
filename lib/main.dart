import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fusion/screens/Academic/Add_Drop_Courses/add_drop_courses.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/complain_history.dart';
import 'package:fusion/screens/Complaint/Feedback/feedback.dart';
import 'package:fusion/screens/Complaint/LodgeComplaint/lodge_complaint.dart';
import 'package:fusion/screens/Establishment/establishment_home_page.dart';
import 'package:fusion/screens/Library/Book_Search.dart';
import 'package:fusion/screens/Library/dues.dart';
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
import 'package:fusion/screens/Placement_Cell/Add_Event.dart';
import 'package:fusion/screens/Placement_Cell/Add_Placement_Record.dart';
import 'package:fusion/screens/Placement_Cell/Batch_Statistics.dart';
import 'package:fusion/screens/Placement_Cell/Past_Records.dart';
import 'package:fusion/screens/Placement_Cell/View_Placement_Records.dart';
import 'package:fusion/screens/Placement_Cell/Placement_Cell_Home.dart';
import 'package:fusion/screens/Profile/profile.dart';
import 'package:fusion/screens/Programme_Curriculum/Batches/batches.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses/courses.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses_Info/courses_info.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/curriculums.dart';
import 'package:fusion/screens/Programme_Curriculum/Discipline/discipline.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/programme_home_page.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/programme_info.dart';
import 'package:fusion/screens/Programme_Curriculum/programme_curriculum_home.dart';
import 'package:fusion/screens/landing_page.dart';
import 'package:fusion/screens/Healthcenter/healthcentermodule.dart';
import 'package:fusion/screens/Healthcenter/feedback.dart';
import 'package:fusion/screens/Healthcenter/viewschedule.dart';
import 'package:fusion/screens/Healthcenter/history.dart';
import 'package:fusion/screens/Healthcenter/HealthCenter.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/screens/Scholarships_Awards/scholarship_awards.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/award_catalogue.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/Faculty/invite_application.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/Faculty/award_catalogue.dart';
import 'package:fusion/screens/Scholarships_Awards/ApplyForAwards/applyforawards.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //runApp(MyApp());
  runZonedGuarded(() {
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print("---caught error in zoned---\n");
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    windowData = windowData.copyWith(
      textScaleFactor: 1,
    );
    return MediaQuery(
      data: windowData,
      child: MaterialApp(
        useInheritedMediaQuery: true,
        title: 'Fusion',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // primarySwatch: Colors.blueGrey,
          // colorSchemeSeed: Color(0xFF2085D0),
          colorSchemeSeed: Color(0xFFF36C35),
            fontFamily: 'Nunito',
          useMaterial3: true,
        ),
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
          '/programme_curriculum_home': (context) => ProgrammeCurriculumHome(),
          '/programme_curriculum_home/programme': (context) => Programme(),
          '/programme_curriculum_home/batches': (context) => Batches(),
          '/programme_curriculum_home/discipline': (context) => Discipline(),
          '/programme_curriculum_home/curriculum': (context) => Curriculum(),
          '/programme_curriculum_home/programme_info': (context) =>
              ProgrammeInfo(),
          '/programme_curriculum_home/courses': (context) => Courses(),
          '/programme_curriculum_home/courses_info': (context) => CoursesInfo(),
          '/establishment': (context) => Establishment(),
          '/gymkhana_homepage': (context) => GymkhanaHomepage(),
          '/gymkhana_homepage/apply': (context) => Apply(),
          '/gymkhana_homepage/polls': (context) => Polls(),
          '/gymkhana_homepage/clubs': (context) => Club(),
          '/gymkhana_homepage/member_records': (context) => Records(),
          '/scholarship_awards': (context) => ScholarshipAwards(ModalRoute.of(context)!.settings.arguments.toString()),
        '/scholarship_awards/browse_award_catalogue': (context) => BrowseAwardCatalogue(),
        '/scholarship_awards/manage_award_catalogue_fac': (context) => ManageAwardCatalogueFaculty(),
        '/scholarship_awards/invite_application': (context) => InviteApplication(),
        '/scholarship_awards/apply_for_awards': (context) => ApplyForAwards(),

          '/library_homepage': (context) => LibraryHomeScreen(),
          '/library_homepage/book_search': (context) => BookSearch(),
          '/library_homepage/issued_items': (context) => IssuedItems(),
          '/library_homepage/dues': (context) => LibraryDues(),
          '/complaint': (context) =>
              Complaint(ModalRoute.of(context)!.settings.arguments.toString()),
          '/complaint/lodge_complaint': (context) => LodgeComplaint(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/complaint/complaint_history': (context) => ComplainHistory(),
          '/complaint/feedback': (context) => ComplaintFeedBack(),
          '/profile': (context) => Profile(),
          '/health_center': (context) => HealthCenterMod(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/health_center/healthcenter': (context) => HealthCenter(),
          '/health_center/feedback': (context) => FeedBack(),
          '/health_center/viewschedule': (context) => ViewSchedule(),
          '/health_center/history': (context) => History(),
          '/placement_cell/placement_cell_home': (context) => PlacementHomePage(ModalRoute.of(context)!.settings.arguments.toString()),
          '/placement_cell/add_placement_record':(context) => AddPlacementRecord(),
          '/placement_cell/past_records':(context) => PastRecords(),
          '/placement_cell/batch_statistics':(context) => BatchStatistics(),
          'placement_cell/add_event':(context) => AddEvent(),

        },
      ),
    );
  }
}
