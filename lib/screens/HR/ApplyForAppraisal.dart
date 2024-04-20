import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/storage_service.dart';
import 'dart:async';
import 'dart:convert';

class ApplyForAppraisal extends StatefulWidget {
  const ApplyForAppraisal();

  @override
  State<ApplyForAppraisal> createState() {
    return _ApplyForAppraisalState();
  }
}

class _ApplyForAppraisalState extends State<ApplyForAppraisal> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _disciplineController = TextEditingController();
  TextEditingController _specificFieldOfKnowledgeController =
      TextEditingController();
  TextEditingController _currentResearchInterestsController =
      TextEditingController();
  TextEditingController _commentsOnPerformanceController =
      TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  List<Map<String, TextEditingController>> _courseRows = [];
  List<Map<String, TextEditingController>> _newCourseRows = [];
  List<Map<String, TextEditingController>> _courseMaterialRows = [];
  List<Map<String, TextEditingController>> _thesisRows = [];
  List<Map<String, TextEditingController>> _projectRows = [];
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service;
  bool _loading1 = true;
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print("hello");
      datap = service.profileData;
      _loading1 = false;
      showData();
    } catch (e) {
      getData();
      showData();
    }
  }

  getData() async {
    try {
      var response = await profileService.getProfile();
      setState(() {
        datap = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void showData() {
    print(datap.user);
    print(datap.profile);
    print((datap.profile)!['id']);
    print(datap.profile!['user_type']);
    setState(() {
      _nameController.text = datap.user!['first_name'];
      _designationController.text = datap.profile!['user_type'];
    });
  }

  void submitForm() async {
    final url = "http://10.0.2.2:8000/hr2/api/appraisal/";
    print("in submit form");

    //  print _courseRows value
    final data = {
      "name": _nameController.text,
      "designation": _designationController.text,
      "disciplineInfo": _disciplineController.text,
      "specificFieldOfKnowledge": _specificFieldOfKnowledgeController.text,
      "currentResearchInterests": _currentResearchInterestsController.text,
      "performanceComments": _commentsOnPerformanceController.text,
      "coursesTaught": _courseRows
          .map((row) => {
                'semester': row['semester']!.text,
                'courseNumber': row['courseNumber']!.text,
                'lecturesHrsPerWeek': row['lecturesHrsPerWeek']!.text,
                'studentsRegistered': row['studentsRegistered']!.text,
              })
          .toList(),
      "newCourses": _newCourseRows
          .map((row) => {
                'courseName&Number': row['courseName&Number']!.text,
                'UG/PG': row['UG/PG']!.text,
                'Year&SemesterOfFirstOffering':
                    row['Year&SemesterOfFirstOffering']!.text,
              })
          .toList(),
      "coursesNewMaterial": _courseMaterialRows
          .map((row) => {
                'courseName&Number': row['courseName&Number']!.text,
                'UG/PG': row['UG/PG']!.text,
                'TypeOfActivity': row['TypeOfActivity']!.text,
                'Web/Public': row['Web/Public']!.text,
              })
          .toList(),
      "thesisResearch": _thesisRows
          .map((row) => {
                'nameOfStudent': row['nameOfStudent']!.text,
                'titleOfThesis': row['titleOfThesis']!.text,
                'year&SemesterOfFirstRegistration':
                    row['year&SemesterOfFirstRegistration']!.text,
                'status': row['status']!.text,
                'coSupervisiors': row['coSupervisiors']!.text
              })
          .toList(),
      "sponsoredReseachProjects": _projectRows
          .map((row) => {
                'title': row['title']!.text,
                'sponsoringAgency': row['sponsoringAgency']!.text,
                'projectFunding': row['projectFunding']!.text,
                'projectDuration': row['projectDuration']!.text,
              })
          .toList(),
      "submissionDate": new DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "created_by": datap.user!['id'].toString()
    };
    final userInfo = {
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": datap.profile!['user_type'],
    };
    final payload = [data, userInfo];
    print(data);
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      encoding: Encoding.getByName('utf-8'),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Submitted Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HRHomePage()));
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to submit")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Personal Information'),
                _buildTextInputField('Name', controller: _nameController),
                _buildTextInputField('Designation',
                    controller: _designationController),
                _buildTextInputField('Discipline',
                    controller: _disciplineController),
                _buildTextInputField('Specific field of Knowledge',
                    controller: _specificFieldOfKnowledgeController),
                _buildTextInputField('Current research interests',
                    controller: _currentResearchInterestsController),
                _buildSectionTitle('Courses Taught at UG/PG Level'),
                _buildCourseTable(),
                _buildSectionTitle(
                    'New Courses/ Laboratory experiments introduced and taught'),
                _buildNewCourseTable(),
                _buildSectionTitle('New course material developed'),
                _buildCourseMaterialTable(),
                _buildSectionTitle('Thesis/Research Supervision'),
                _buildThesisTable(),
                _buildSectionTitle('Sponsored Research Projects'),
                _buildProjectTable(),
                _buildSectionTitle('Comments on Performance'),
                _buildTextInputField(
                    'Your comments on your performance so far and this academic year particularly',
                    controller: _commentsOnPerformanceController),
                _buildTextInputField('Receiver Name',
                    controller: _receiverNameController),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      submitForm();
                    }
                    // Respond to button press
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please fill all the fields correctly')),
                      );
                    }
                    // Respond to button press
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextInputField(String labelText,
      {TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${labelText} correctly.';
        }
        return null;
      },
    );
  }

  Widget _buildTextInputFieldTable(
      String labelText, TextEditingController? controller) {
    return TextFormField(
      controller: controller,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(8),
      ),
      validator: (value) {
        // print(value);
        if (value == null || value.isEmpty) {
          return 'Please enter ${labelText} correctly.';
        }
        return null;
      },
    );
  }

  Widget _buildCourseTable() {
    return Column(
      children: [
        for (int i = 0; i < _courseRows.length; i++) ..._buildCourseRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _courseRows.add({
                'semester': TextEditingController(),
                'courseNumber': TextEditingController(),
                'lecturesHrsPerWeek': TextEditingController(),
                'studentsRegistered': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildCourseRow(int index) {
    return [
      Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Semester', _courseRows[index]['semester']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Course\nNumber', _courseRows[index]['courseNumber']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Lectures\nHrs/week', _courseRows[index]['lecturesHrsPerWeek']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Number of\nstudents\nregistered',
                _courseRows[index]['studentsRegistered']),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _courseRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  Widget _buildNewCourseTable() {
    return Column(
      children: [
        for (int i = 0; i < _newCourseRows.length; i++)
          ..._buildNewCourseRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _newCourseRows.add({
                'courseName&Number': TextEditingController(),
                'UG/PG': TextEditingController(),
                'Year&SemesterOfFirstOffering': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildNewCourseRow(int index) {
    return [
      Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('course\nName\n&\nNumber',
                _newCourseRows[index]['courseName&Number']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'UG/PG', _newCourseRows[index]['UG/PG']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Year\n&\nSemester\nOf\nFirst\nOffering',
                _newCourseRows[index]['Year&SemesterOfFirstOffering']),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _newCourseRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  Widget _buildCourseMaterialTable() {
    return Column(
      children: [
        for (int i = 0; i < _courseMaterialRows.length; i++)
          ..._buildCourseMaterialRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _courseMaterialRows.add({
                'courseName&Number': TextEditingController(),
                'UG/PG': TextEditingController(),
                'TypeOfActivity': TextEditingController(),
                'Web/Public': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildCourseMaterialRow(int index) {
    return [
      Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('course\nName\n&\nNumber',
                _courseMaterialRows[index]['courseName&Number']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'UG/PG', _courseMaterialRows[index]['UG/PG']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Type\nOf\nActivity',
                _courseMaterialRows[index]['TypeOfActivity']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Web/Public', _courseMaterialRows[index]['Web/Public']),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _courseMaterialRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  Widget _buildThesisTable() {
    return Column(
      children: [
        for (int i = 0; i < _thesisRows.length; i++) ..._buildThesisRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _thesisRows.add({
                'nameOfStudent': TextEditingController(),
                'titleOfThesis': TextEditingController(),
                'year&SemesterOfFirstRegistration': TextEditingController(),
                'status': TextEditingController(),
                'coSupervisiors': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildThesisRow(int index) {
    return [
      Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Name\nOf\nStudent', _thesisRows[index]['nameOfStudent']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Title\nOf\nThesis', _thesisRows[index]['titleOfThesis']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Year\n&S\nemester\nOf\nFirst\nRegistration',
                _thesisRows[index]['Year&semesterOfFirstRegistration']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Completed\nSubmitted\nIn\nProgress',
                _thesisRows[index]['status']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Co-Supervisiors\n(if any)',
                _thesisRows[index]['coSupervisiors']),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _thesisRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  Widget _buildProjectTable() {
    return Column(
      children: [
        for (int i = 0; i < _projectRows.length; i++) ..._buildProjectRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _projectRows.add({
                'title': TextEditingController(),
                'sponsoringAgency': TextEditingController(),
                'projectFunding': TextEditingController(),
                'projectDuration': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildProjectRow(int index) {
    return [
      Row(
        children: [
          Text('${index + 1}.'),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Title of\nproject', _projectRows[index]['title']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Sponsoring\nAgency', _projectRows[index]['sponsoringAgency']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Project\nFunding', _projectRows[index]['projectFunding']),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable(
                'Project\nDuration', _projectRows[index]['projectDuration']),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _projectRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }
}
