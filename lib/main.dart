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
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/news.dart';
import 'package:fusion/screens/LoginandDashboard/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/notify.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/announcement.dart';
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
import 'package:fusion/screens/Programme_Curriculum/Batches/batches.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses/courses.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses_Info/courses_info.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/curriculums.dart';
import 'package:fusion/screens/Programme_Curriculum/Discipline/discipline.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/programme_home_page.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/programme_info.dart';
import 'package:fusion/screens/Programme_Curriculum/programme_curriculum_home.dart';
import 'package:fusion/screens/PurchaseStore/Indenter_View.dart';
import 'package:fusion/screens/landing_page.dart';
import 'package:fusion/screens/Healthcenter/healthcentermodule.dart';
import 'package:fusion/screens/Healthcenter/feedback.dart';
import 'package:fusion/screens/Healthcenter/viewschedule.dart';
import 'package:fusion/screens/Healthcenter/history.dart';
import 'package:fusion/screens/Healthcenter/HealthCenter.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/screens/PurchaseStore/purchase_store_homepage.dart';
import 'package:fusion/screens/PurchaseStore/Approved_Request.dart';
import 'package:fusion/screens/PurchaseStore/Audit_Bill.dart';
import 'package:fusion/screens/PurchaseStore/Global_STOCK.dart';
// import 'package:fusion/screens/PurchaseStore/Indent_form.dart';
import 'package:fusion/screens/PurchaseStore/Process_Bill.dart';
import 'package:fusion/screens/PurchaseStore/Rejected_Request.dart';
import 'package:fusion/screens/PurchaseStore/Saved_indent.dart';
import 'package:fusion/screens/PurchaseStore/Transfer_Funds.dart';
import 'package:fusion/screens/PurchaseStore/filed_Indent.dart';
import 'package:fusion/screens/PurchaseStore/inbox.dart';
import 'package:fusion/screens/PurchaseStore/new_request.dart';
import 'package:fusion/screens/PurchaseStore/pending.dart';
import 'package:fusion/screens/PurchaseStore/admin_homepage.dart';
import 'package:fusion/screens/PurchaseStore/ps_admin.dart';
import 'package:fusion/screens/PurchaseStore/head_homepage.dart';
import 'package:fusion/screens/PurchaseStore/indent_form.dart';
import 'package:fusion/screens/PurchaseStore/pending.dart';
import 'package:fusion/screens/PurchaseStore/flow_chart.dart';


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
        MediaQueryData.fromView(WidgetsBinding.instance.window);
    windowData = windowData.copyWith(
      textScaler: TextScaler.linear(1),
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
          '/notification': (context) => Notify(),
          '/news': (context) => News(),
          '/announcement': (context) => Announcement(),
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
          '/purchase_store_homepage': (context) => FlowChartPage(),
          // '/purchase_store/indent_form': (context) => IndentForm(),
          '/purchase_store/indent_form': (context) => IndentForm(),

          '/purchase_store/inbox': (context) => Inbox(),
          '/purchase_store/saved_indent': (context) => SavedIndent(),
          '/purchase_store/filed_indent': (context) => FiledIndent(),
          '/purchase_store/': (context) => PurchaseStoreHomePage(),
          '/purchase_store/new_request': (context) => NewRequest(),
          '/purchase_store/pending': (context) => Pending(),
          '/purchase_store/approved': (context) => ApprovedRequest(),
          '/purchase_store/rejected': (context) => RejectedRequest(),
          '/purchase_store/audit': (context) => AuditBill(),
          '/purchase_store/process_bill': (context) => ProcessBill(),
          '/purchase_store/global_stock': (context) => GlobalStock(),
          '/purchase_store/transfer_funds': (context) => TransferFunds(),
          '/purchase_store/employee': (context) => PurchaseStoreHomePage(),
          '/purchase_store/admin': (context) => adminHomePage(),
          '/purchase_store/psadmin': (context) => psadminPage(),
          '/purchase_store/head': (context) => headHomePage(),
          '/purchase_store/indent_view': (context) => IndentView(),
          '/purchase_store/transfer': (context) => TransferFunds(),
          '/purchase_store/stocks':(context)=>GlobalStock()


        },
      ),
    );
  }
}
