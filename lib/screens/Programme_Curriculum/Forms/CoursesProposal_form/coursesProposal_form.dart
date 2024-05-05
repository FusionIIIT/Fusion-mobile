import 'package:flutter/material.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class CoursesProposalForm extends StatefulWidget {
  @override
  _CoursesProposalFormState createState() => _CoursesProposalFormState();
}

class _CoursesProposalFormState extends State<CoursesProposalForm> {
  late String name = "";
  late String studentType = "";
  late String userType = "";
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  bool _loading = true;

  final _formKey = GlobalKey<FormState>();
  var courseCode = "";
  var courseName = "";
  var credit = 0; // Changed to integer
  var lectureHours = 0;
  var tutorialHours = 0;
  var practicalHours = 0;
  var discussionHours = 0;
  var projectHours = 0;
  var preRequisites = "";
  var syllabus = "";
  var referenceBooks = "";
  var percentCourseAttendance = 0;
  var percentEndSem = 0;
  var percentMidSem = 0;
  var percentProject = 0;
  var percentQuiz1 = 0;
  var percentQuiz2 = 0;
  var percentLabEvaluation = 0;
  var proposedby = "";
  var status = "";

  final courseCodeController = TextEditingController();
  final courseNameController = TextEditingController();
  final creditController = TextEditingController();
  final lectureHoursController = TextEditingController();
  final tutorialHoursController = TextEditingController();
  final practicalHoursController = TextEditingController();
  final discussionHoursController = TextEditingController();
  final projectHoursController = TextEditingController();
  final preRequisitesController = TextEditingController();
  final syllabusController = TextEditingController();
  final referenceBooksController = TextEditingController();
  final percentCourseAttendanceController = TextEditingController();
  final percentEndSemController = TextEditingController();
  final percentMidSemController = TextEditingController();
  final percentProjectController = TextEditingController();
  final percentQuiz1Controller = TextEditingController();
  final percentQuiz2Controller = TextEditingController();
  final percentLabEvaluationController = TextEditingController();
  final proposedbyController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
      userType = data2.profile!['user_type'];
      print("this is name: $name");
      print("this is UserType: $userType");
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  // this is one method to create a notification .....
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Course Proposal added successfully'),
        duration: Duration(seconds: 4), // Set the duration of the Snackbar
      ),
    );
  }

  void sendData(
      BuildContext context,
      String code,
      String name,
      int credit,
      int lecture_hours,
      int tutorial_hours,
      int practical_hours,
      int discussion_hours,
      int project_hours,
      String pre_requisits,
      String syllabus,
      String ref_books,
      int percent_course_attendance,
      int percent_endsem,
      int percent_midsem,
      int percent_project,
      int percent_quiz_1,
      int percent_quiz_2,
      int percent_lab_evaluation,
      String proposedby,
      String status) async {
    var url =
        'https://script.google.com/macros/s/AKfycbzp1LzaPD6F_MJYyk-nCUY64GhyhkKjuOOwi5nj6pyt2wqlOWMavmoB-6V0As-RDj-u/exec';

    var url1 =
        'https://script.google.com/macros/s/AKfycbw0oi0VyhdlZ97ENHdUW8iQXNjpZZ4Yb42fl0sIbCFLED3tygO7aRM6VX_02afff6ImNg/exec';

    var body = {'code': code, 'name': name, 'credit': credit};

    var body1 = {
      'code': code,
      'name': name,
      'credit': credit,
      'lecture_hours': lecture_hours,
      'tutorial_hours': tutorial_hours,
      'practical_hours': practical_hours,
      'discussion_hours': discussion_hours,
      'project_hours': project_hours,
      'pre_requisites': pre_requisits,
      'syllabus': syllabus,
      'ref_books': ref_books,
      'percent_course_attendance': percent_course_attendance,
      'percent_endsem': percent_endsem,
      'percent_midsem': percent_midsem,
      'percent_project': percent_project,
      'percent_quiz_1': percent_quiz_1,
      'percent_quiz_2': percent_quiz_2,
      'percent_lab_evaluation': percent_lab_evaluation,
      'proposedby': proposedby,
      'status': status
    };

    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body));

    var response1 = await http.post(Uri.parse(url1),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body1));

    if (response.statusCode == 200 && response1.statusCode == 200) {
      print('Data sent successfully');
      print('Response: ${response.body}');
      // _showSnackbar(context, "Course added successfully");
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }

  @override
  void dispose() {
    courseCodeController.dispose();
    courseNameController.dispose();
    creditController.dispose();
    lectureHoursController.dispose();
    tutorialHoursController.dispose();
    practicalHoursController.dispose();
    discussionHoursController.dispose();
    projectHoursController.dispose();
    preRequisitesController.dispose();
    syllabusController.dispose();
    referenceBooksController.dispose();
    percentCourseAttendanceController.dispose();
    percentEndSemController.dispose();
    percentMidSemController.dispose();
    percentProjectController.dispose();
    percentQuiz1Controller.dispose();
    percentQuiz2Controller.dispose();
    percentLabEvaluationController.dispose();
    proposedbyController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var service = locator<StorageService>();
    late String curr_desig = service.getFromDisk("Current_designation");
    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight = 0.8 * screenHeight; // 80% of screen height

    proposedbyController.text = name;
    statusController.text = "not approved";

    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Programme and Curriculum",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      body: Container(
        height: targetHeight,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Course Proposal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.redAccent, // Orange underline
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Course Code: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: courseCodeController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Course Code';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Course Name: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: courseNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Course Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Credit: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: creditController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Credit';
                        } else if (!isValidCredit(value!)) {
                          return 'Please Enter a Valid Credit (1 - 6)';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Lecture Hours: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: lectureHoursController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for lecture hours
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tutorial Hours: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: tutorialHoursController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for tutorial hours
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Practical Hours: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: practicalHoursController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for practical hours
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Discussion Hours: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: discussionHoursController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for discussion hours
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Project Hours: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: projectHoursController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for project hours
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Pre-requisites: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: preRequisitesController,
                      validator: (value) {
                        // Add validation for pre-requisites
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Syllabus: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: syllabusController,
                      validator: (value) {
                        // Add validation for syllabus
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Reference Books: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: referenceBooksController,
                      validator: (value) {
                        // Add validation for reference books
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Course Attendance: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentCourseAttendanceController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent course attendance
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent End Semester: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentEndSemController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent end semester
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Mid Semester: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentMidSemController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent mid semester
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Project: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentProjectController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent project
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Quiz 1: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentQuiz1Controller,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent quiz 1
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Quiz 2: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentQuiz2Controller,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent quiz 2
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Percent Lab Evaluation: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: percentLabEvaluationController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent lab evaluation
                        return null;
                      },
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Course Proposed By: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: proposedbyController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent lab evaluation
                        return null;
                      },
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Status: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: statusController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        // Add validation for percent lab evaluation
                        return null;
                      },
                    ),
                    SizedBox(
                        height:
                            20), // Add vertical space between form fields and button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() {
                            courseCode = courseCodeController.text;
                            courseName = courseNameController.text;
                            credit = int.parse(
                                creditController.text); // Parse to integer
                            lectureHours =
                                int.parse(lectureHoursController.text);
                            tutorialHours =
                                int.parse(tutorialHoursController.text);
                            practicalHours =
                                int.parse(practicalHoursController.text);
                            discussionHours =
                                int.parse(discussionHoursController.text);
                            projectHours =
                                int.parse(projectHoursController.text);
                            preRequisites = preRequisitesController.text;
                            syllabus = syllabusController.text;
                            referenceBooks = referenceBooksController.text;
                            percentCourseAttendance = int.parse(
                                percentCourseAttendanceController.text);
                            percentEndSem =
                                int.parse(percentEndSemController.text);
                            percentMidSem =
                                int.parse(percentMidSemController.text);
                            percentProject =
                                int.parse(percentProjectController.text);
                            percentQuiz1 =
                                int.parse(percentQuiz1Controller.text);
                            percentQuiz2 =
                                int.parse(percentQuiz2Controller.text);
                            percentLabEvaluation =
                                int.parse(percentLabEvaluationController.text);
                            proposedby = proposedbyController.text;
                            status = statusController.text;

                            sendData(
                                context,
                                courseCode,
                                courseName,
                                credit,
                                lectureHours,
                                tutorialHours,
                                practicalHours,
                                discussionHours,
                                projectHours,
                                preRequisites,
                                syllabus,
                                referenceBooks,
                                percentCourseAttendance,
                                percentEndSem,
                                percentMidSem,
                                percentProject,
                                percentQuiz1,
                                percentQuiz2,
                                percentLabEvaluation,
                                proposedby,
                                status);
                            _showSnackbar(context);

                            // printing values in the terminal .....
                            print("Course Code: $courseCode");
                            print("Course Name: $courseName");
                            print("Credit: $credit");
                            print("Lecture Hours: $lectureHours");
                            print("Tutorial Hours: $tutorialHours");
                            print("Practical Hours: $practicalHours");
                            print("Discussion Hours: $discussionHours");
                            print("Project Hours: $projectHours");
                            print("Pre-requisites: $preRequisites");
                            print("Syllabus: $syllabus");
                            print("Reference Books: $referenceBooks");
                            print(
                                "Percent Course Attendance: $percentCourseAttendance");
                            print("Percent End Semester: $percentEndSem");
                            print("Percent Mid Semester: $percentMidSem");
                            print("Percent Project: $percentProject");
                            print("Percent Quiz 1: $percentQuiz1");
                            print("Percent Quiz 2: $percentQuiz2");
                            print(
                                "Percent Lab Evaluation: $percentLabEvaluation");

                            courseCodeController.clear();
                            courseNameController.clear();
                            creditController.clear();
                            lectureHoursController.clear();
                            tutorialHoursController.clear();
                            practicalHoursController.clear();
                            discussionHoursController.clear();
                            projectHoursController.clear();
                            preRequisitesController.clear();
                            syllabusController.clear();
                            referenceBooksController.clear();
                            percentCourseAttendanceController.clear();
                            percentEndSemController.clear();
                            percentMidSemController.clear();
                            percentProjectController.clear();
                            percentQuiz1Controller.clear();
                            percentQuiz2Controller.clear();
                            percentLabEvaluationController.clear();
                            proposedbyController.clear();
                            statusController.clear();
                            // Show Snackbar when form is submitted successfully
                            _showSnackbar(context);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .redAccent, // Set background color to redAccent
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Set text to bold
                          fontSize: 18, // Set text size
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      20), // Add vertical space between button and below text
              Text(
                'Recently added data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Course Code: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$courseCode',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Course Name: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$courseName',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Credit: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$credit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidCredit(String value) {
    try {
      int credit = int.parse(value);
      return credit >= 1 && credit <= 6;
    } catch (e) {
      return false;
    }
  }
}
