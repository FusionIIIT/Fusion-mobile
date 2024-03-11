import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Coursesupdate extends StatefulWidget {
  @override
  _Courseupdate createState() => _Courseupdate();
}

class _Courseupdate extends State<Coursesupdate> {
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

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
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
      int pratical_hours,
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
      int percent_lab_evaluation) async {
    var url =
        'https://script.google.com/macros/s/AKfycbzYHOnBC4Wfyj2usAKlnJjnq8eOk0JmRk6vFAo4tecdlKJrqJoFrrfxTvxlJ62E536wEA/exec';

    var url1 =
        'https://script.google.com/macros/s/AKfycbyEK8qhhtHYnGVmTW7DRHx8jn5U0qJvy94qKezkH4qpy3LU7nWIyZQm7Gln1AN5RImSzw/exec';

    var body = {'code': code, 'name': name, 'credit': credit};

    var body1 = {
      'code': code,
      'name': name,
      'credit': credit,
      'lecture_hours': lecture_hours,
      'tutorial_hours': tutorial_hours,
      'pratical_hours': pratical_hours,
      'discussion_hours': discussion_hours,
      'project_hours': project_hours,
      'pre_requisits': pre_requisits,
      'syllabus': syllabus,
      'ref_books': ref_books,
      'percent_course_attendance': percent_course_attendance,
      'percent_endsem': percent_endsem,
      'percent_midsem': percent_midsem,
      'percent_project': percent_project,
      'percent_quiz_1': percent_quiz_1,
      'percent_quiz_2': percent_quiz_2,
      'percent_lab_evaluation': percent_lab_evaluation
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
      _showSnackbar(context, 'Batch Updated successfully');
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight = 0.8 * screenHeight;
    print(
        "Right now Update form    BWFHVWKVBKABWKJBVJAJBVJ,SBJBVJMHWAVRJUSBVKSVJMSBMBSJHJMH");
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    print(arguments['e'][0][1]);

    courseCodeController.text = arguments['e'][0][1];
    courseNameController.text = arguments['e'][1][1];
    creditController.text = arguments['e'][2][1].toString();
    lectureHoursController.text = arguments['e'][3][1].toString();
    tutorialHoursController.text = arguments['e'][4][1].toString();
    practicalHoursController.text = arguments['e'][5][1].toString();
    discussionHoursController.text = arguments['e'][6][1].toString();
    projectHoursController.text = arguments['e'][7][1].toString();
    preRequisitesController.text = arguments['e'][8][1].toString();
    syllabusController.text = arguments['e'][9][1].toString();
    referenceBooksController.text = arguments['e'][10][1].toString();
    percentCourseAttendanceController.text = arguments['e'][11][1].toString();
    percentEndSemController.text = arguments['e'][12][1].toString();
    percentMidSemController.text = arguments['e'][13][1].toString();
    percentProjectController.text = arguments['e'][14][1].toString();
    percentQuiz1Controller.text = arguments['e'][15][1].toString();
    percentQuiz2Controller.text = arguments['e'][16][1].toString();
    percentLabEvaluationController.text = arguments['e'][17][1].toString();
    // courseCodeController..readOnly = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "FUSION",
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
        height: targetHeight,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Update Course',
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
                      readOnly: true,
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
                                percentLabEvaluation);
                            _showSnackbar(
                                context, 'Course Updated successfully');

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
                            // Show Snackbar when form is submitted successfully
                            // _showSnackbar(context);
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
