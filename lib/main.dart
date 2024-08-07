import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import 'package:fusion/screens/Academic/Add_Drop_Courses/add_courses.dart';
import 'package:fusion/screens/Academic/Add_Drop_Courses/drop_courses.dart';
import 'package:fusion/screens/Academic/Add_Drop_Courses/replace_courses.dart';
import 'package:fusion/screens/Academic/fill_backlog/backlog.dart';
import 'package:fusion/screens/Academic/ViewRegistration/view_registration.dart';
import 'package:fusion/screens/Academic/Acad_Admin/acadmin_home_page.dart';
import 'package:fusion/screens/Academic/Registration/pre_registration.dart';
import 'package:fusion/screens/Academic/Registration/final_registration.dart';
import 'package:fusion/screens/Academic/Faculty/faculty_home_page.dart';
import 'package:fusion/screens/Complaint/Caretaker/view_caretaker.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/complain_history.dart';
import 'package:fusion/screens/Complaint/Feedback/feedback.dart';
import 'package:fusion/screens/Complaint/Caretaker/unresolved_complaints.dart';
import 'package:fusion/screens/Complaint/Caretaker/resolved_complaints.dart';
import 'package:fusion/screens/Complaint/LodgeComplaint/lodge_complaint.dart';
import 'package:fusion/screens/Establishment/establishment_home_page.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/screens/Examination/AnnounceGrade.dart';
import 'package:fusion/screens/Examination/CourseAuthentication.dart';
import 'package:fusion/screens/Examination/ExaminationHomePage.dart';
import 'package:fusion/screens/Examination/GenerateResult.dart';
import 'package:fusion/screens/Examination/ModerateGrade.dart';
import 'package:fusion/screens/Examination/SubmitGrade.dart';
import 'package:fusion/screens/Examination/VerifyResult.dart';
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
import 'package:fusion/screens/Programme_Curriculum/Forms/Programme_form/programme_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Curriculums_form/curriculums_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Curriculums_form/curriculums_update.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Batches_form/batches_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Courses_form/courses_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Courses_form/courses_update.dart';
import 'package:fusion/screens/Programme_Curriculum/Course_Proposals/course_proposals.dart';
import 'package:fusion/screens/Programme_Curriculum/Course_Proposals_Info/course_proposals_info.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/Discipline_form/discipline_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/CoursesProposal_form/coursesProposal_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/CoursesProposal_form/courseProposalUpdate_form.dart';
import 'package:fusion/screens/Programme_Curriculum/Forms/CoursesProposal_form/courseProposalApprove_form.dart';
import 'package:fusion/screens/landing_page.dart';
import 'package:fusion/screens/Healthcenter/healthcentermodule.dart';
import 'package:fusion/screens/Healthcenter/feedback.dart';
import 'package:fusion/screens/Healthcenter/viewschedule.dart';
import 'package:fusion/screens/Healthcenter/history.dart';
import 'package:fusion/screens/Healthcenter/HealthCenter.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/screens/Academic/Acad_Admin/configure_pre_registration.dart';
import 'package:fusion/screens/Academic/Acad_Admin/configure_final_registration.dart';
import 'package:fusion/screens/Academic/Acad_Admin/course_list_home_page.dart';
import 'package:fusion/screens/Academic/Acad_Admin/course_list.dart';
import 'package:fusion/screens/Academic/Acad_Admin/academic_calendar.dart';
import 'package:fusion/screens/Academic/Acad_Admin/generate_student_list.dart';
import 'package:fusion/screens/Academic/Faculty/view_assigned_courses.dart';
import 'package:fusion/screens/Central_Mess/central_mess_home.dart';
import 'package:fusion/screens/Central_Mess/MessMenu/mess_menu_home.dart';
import 'package:fusion/screens/Central_Mess/Feedback/feedback_menu.dart';
import 'package:fusion/screens/Central_Mess/Rebate/rebate_homepage.dart';
import 'package:fusion/screens/Central_Mess/MessBill/mess_bill_home.dart';
// import 'package:fusion/screens/Central_Mess/Announcement/announcement.dart';
import 'package:fusion/screens/Central_Mess/RequestSpecialFood/special_food_home.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/reg_dereg_homepage.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/manage_registration_homepage.dart';
import 'package:fusion/screens/Central_Mess/Rebate/respondToRebateRequest.dart';
import 'package:fusion/screens/Central_Mess/VacationFood/vacation_food_home.dart';
import 'package:fusion/screens/Central_Mess/Payments/payments_home.dart';
import 'package:fusion/screens/FileTracking/fts/fts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    return username ?? '';
  }
}

void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //runApp(MyApp());
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print("---caught error in zoned---\n");
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {

  Future<String> getUsername() async {
    final userService = UserService();
    final username = await userService.getUsername();
    return username;
  }

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
          '/configure_pre_registration': (context) =>
              ConfigurePreRegistration(),
          '/configure_final_registration': (context) =>
              ConfigureFinalRegistration(),
          '/academic_calendar': (context) => AcademicCalendar(),
          '/generate_student_list': (context) => GenerateStudentList(),
          '/course_list_home_page': (context) => CourseListHome(),
          '/course_list': (context) => CourseList(),
          '/view_assigned_courses': (context) => ViewAssignedCourses(),
          '/academic_home_page': (context) => AcademicHomePage(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/academic_home_page/acadmin':(context) => AcadminHomePage(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/academic_home_page/faculty':(context) => FacultyHomePage(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/academic_home_page/current_semester_home_page': (context) =>
              CurrentSemesterHomePage(),
          '/academic_home_page/registration_home_page': (context) =>
              RegistrationHomePage(),
          '/academic_home_page/pre_registration': (context) =>
              PreRegistration(),
          '/academic_home_page/final_registration': (context) =>
              FinalRegistration(),
          '/academic_home_page/bonafide': (context) => Bonafide(),
          '/academic_home_page/branch_change': (context) => BranchChange(),
          '/academic_home_page/attendance': (context) => Attendance(),
          '/academic_home_page/dues': (context) => Dues(),
          '/academic_home_page/thesis': (context) => ThesisHomePage(),
          '/academic_home_page/performance': (context) => Performance(),
          '/academic_home_page/add_courses': (context) => AddCourses(),
          '/academic_home_page/drop_courses': (context) => DropCourses(),
          '/academic_home_page/replace_courses': (context) => ReplaceCourses(),
          '/academic_home_page/fill_backlog': (context) => FillBacklog(),
          '/academic_home_page/view_registration': (context) => ViewRegistration(),
          '/programme_curriculum_home': (context) => ProgrammeCurriculumHome(),
          '/programme_curriculum_home/programme': (context) => Programme(),
          '/programme_curriculum_home/batches': (context) => Batches(),
          '/programme_curriculum_home/discipline': (context) => Discipline(),
          '/programme_curriculum_home/programme_form': (context) =>
              ProgrammeForm(),
          '/programme_curriculum_home/curriculum_form': (context) =>
              CurriculumForm(),
          '/programme_curriculum_home/curriculum_update': (context) =>
              Curriculumupdate(),
          '/programme_curriculum_home/batches_form': (context) => BatchesForm(),
          '/programme_curriculum_home/courses_form': (context) => CoursesForm(),
          '/programme_curriculum_home/courses_update': (context) =>
              Coursesupdate(),
          '/programme_curriculum_home/course_proposals': (context) =>
              CourseProposals(),
          '/programme_curriculum_home/course_proposals_info': (context) =>
              CoursesProposalInfo(),
          '/programme_curriculum_home/discipline_form': (context) =>
              DisciplineForm(),
          '/programme_curriculum_home/coursesProposal_form': (context) =>
              CoursesProposalForm(),
          '/programme_curriculum_home/coursesProposalUpdate_form': (context) =>
              CoursesProposalupdate(),
          '/programme_curriculum_home/coursesProposalApprove_form': (context) =>
              CoursesProposalApprove(),
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
          '/complaint/caretaker/unresolved_complaints': (context) => UnresolvedComplaints(),
          '/complaint/caretaker/resolved_complaints': (context) => ResolvedComplaints(),
          '/complaint/caretaker/view_caretaker': (context) => ViewCaretaker(),
          '/complaint/feedback': (context) => ComplaintFeedBack(),
          '/profile': (context) => Profile(),
          '/health_center': (context) => HealthCenterMod(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/health_center/healthcenter': (context) => HealthCenter(),
          '/health_center/feedback': (context) => FeedBack(),
          '/health_center/viewschedule': (context) => ViewSchedule(),
          '/health_center/history': (context) => History(),
          '/hr_homepage': (context) => HRHomePage(),

          '/examination': (context) => ExaminationHomePage(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/examination/verify_result': (context) => VerifyResult(),
          '/examination/generate_result': (context) => GenerateResult(),
          '/examination/announce_grade': (context) => AnnounceGrade(),
          '/examination': (context) => ExaminationHomePage(
              ModalRoute.of(context)!.settings.arguments.toString()),
          '/examination/course_authentication': (context) => CourseAuthentication(),
          '/examination/generate_result': (context) => GenerateResult(),
          '/examination/announce_grade': (context) => AnnounceGrade(),
          '/examination/submit_grade':(context)=>SubmitGrade(),
          '/examination/moderate_grade' : (context)=>ModerateGrade(),
          '/central_mess_home': (context) => CentralMessHome(),
          '/central_mess_home/menu':(context)=>MessMenu(),
          '/central_mess_home/feedback':(context)=>FeedbackMenu(),
          '/central_mess_home/rebate':(context)=>RebateMenu(),
          '/central_mess_home/messBill':(context)=>ManageBill(),
          // '/central_mess_home/announcement':(context)=>Announcement(),
          '/central_mess_home/reqSpecialFood':(context)=>SpecialFood(),
          '/central_mess_home/registration' : (context)=>RegDeReg(),
          '/central_mess_home/manageRegistration' : (context)=>ManageRegDeRegHomepage(),
          '/central_mess_home/rebateRequest': (context)=>RespondToRebateRequest(),
          '/central_mess_home/vacationFood' : (context)=>VacationFoodHome(),
          '/central_mess_home/updatePayment' : (context)=>UpdatePaymentHome(),

          '/fts': (context) => RoundedListView(),
          // '/fts/create_file': (context) => CreateFilePage(), 
          // '/fts/view_drafts': (context) => DraftsPage(), 
          // '/fts/view_inbox': (context) => InboxPage(), 
          // '/fts/view_outbox': (context) => OutboxPage(),
          // '/fts/tack_file': (context) => FileTrackingPage(),
        },
      ),
    );
  }
}