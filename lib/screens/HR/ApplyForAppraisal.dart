import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/models/profile.dart';
import 'package:fusion/api.dart';
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
  TextEditingController _otherInstructionalTasksController =
      TextEditingController();
  TextEditingController _otherResearchElementController =
      TextEditingController();
  TextEditingController _publicationController = TextEditingController();
  TextEditingController _referredConferenceController = TextEditingController();
  TextEditingController _conferenceOrganisedController =
      TextEditingController();
  TextEditingController _membershipController = TextEditingController();
  TextEditingController _honoursController = TextEditingController();
  TextEditingController _editorOfPublicationsController =
      TextEditingController();
  TextEditingController _expertLectureDeliveredController =
      TextEditingController();
  TextEditingController _membershipOfBOSController = TextEditingController();
  TextEditingController _otherExtensionTasksController =
      TextEditingController();
  TextEditingController _administrativeAssignmentController =
      TextEditingController();
  TextEditingController _serviceToInstituteController = TextEditingController();
  TextEditingController _otherContributionController = TextEditingController();

  List<Map<String, TextEditingController>> _courseRows = [];
  List<Map<String, TextEditingController>> _newCourseRows = [];
  List<Map<String, TextEditingController>> _courseMaterialRows = [];
  List<Map<String, TextEditingController>> _thesisRows = [];
  List<Map<String, TextEditingController>> _projectRows = [];
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  late List<dynamic> designationsOfReceiver = [];
  TextEditingController _receiverDesignationController =
      TextEditingController();
  bool fetchedDesignationsOfReceiver = false;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool _loading1 = true;
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
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
      _designationController.text = curr_desig;
    });
  }

  getDesignations() async {
    final String host = kserverLink;
    final String path = "/hr2/api/getDesignations/";
    final queryParameters = {
      'username': _receiverNameController.text,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final d = await jsonDecode(response.body);
      setState(() {
        fetchedDesignationsOfReceiver = true;
        designationsOfReceiver = d;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please check the entered username.")));
    }
  }

  void submitForm() async {
    final url = "http://${kserverLink}/hr2/api/appraisal/";

    //  print _courseRows value
    final data = {
      "name": _nameController.text,
      "employeeId": (datap.user)!['id'],
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
      "newCoursesIntroduced": _newCourseRows
          .map((row) => {
                'courseName&Number': row['courseName&Number']!.text,
                'UG/PG': row['UG/PG']!.text,
                'Year&SemesterOfFirstOffering':
                    row['Year&SemesterOfFirstOffering']!.text,
              })
          .toList(),
      "newCoursesDeveloped": _courseMaterialRows
          .map((row) => {
                'courseName&Number': row['courseName&Number']!.text,
                'UG/PG': row['UG/PG']!.text,
                'TypeOfActivity': row['TypeOfActivity']!.text,
                'Web/Public': row['Web/Public']!.text,
              })
          .toList(),
      "otherInstructionalTasks": _otherInstructionalTasksController.text,
      "thesisSupervision": _thesisRows
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
      "otherResearchElement": _otherResearchElementController.text,
      "publication": _publicationController.text,
      "referredConference": _referredConferenceController.text,
      "conferenceOrganised": _conferenceOrganisedController.text,
      "membership": _membershipController.text,
      "honours": _honoursController.text,
      "editorOfPublications": _editorOfPublicationsController.text,
      "expertLectureDelivered": _expertLectureDeliveredController.text,
      "membershipOfBOS": _membershipOfBOSController.text,
      "otherExtensionTasks": _otherExtensionTasksController.text,
      "administrativeAssignment": _administrativeAssignmentController.text,
      "serviceToInstitute": _serviceToInstituteController.text,
      "otherContribution": _otherContributionController.text,
      "submissionDate": new DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "created_by": datap.user!['id'].toString()
    };
    final userInfo = {
      "receiver_designation": _receiverDesignationController.text,
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": curr_desig,
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
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to submit")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Apply For Appraisal",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
            _designationController.text = curr_desig;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                _buildSectionTitle('Other Research Elements'),
                _buildTextInputField('Other Research Elements',
                    controller: _otherResearchElementController),
                _buildSectionTitle('Publications'),
                _buildTextInputField('Publications',
                    controller: _publicationController),
                _buildSectionTitle('Referred Conference'),
                _buildTextInputField('Referred Conference',
                    controller: _referredConferenceController),
                _buildSectionTitle('Conference Organised'),
                _buildTextInputField('Conference Organised',
                    controller: _conferenceOrganisedController),
                _buildSectionTitle('Membership'),
                _buildTextInputField('Membership',
                    controller: _membershipController),
                _buildSectionTitle('Honours'),
                _buildTextInputField('Honours', controller: _honoursController),
                _buildSectionTitle('Editor of Publications'),
                _buildTextInputField('Editor of Publications',
                    controller: _editorOfPublicationsController),
                _buildSectionTitle('Expert Lecture Delivered'),
                _buildTextInputField('Expert Lecture Delivered',
                    controller: _expertLectureDeliveredController),
                _buildSectionTitle('Membership of BOS'),
                _buildTextInputField('Membership of BOS',
                    controller: _membershipOfBOSController),
                _buildSectionTitle('Other Extension Tasks'),
                _buildTextInputField('Other Extension Tasks',
                    controller: _otherExtensionTasksController),
                _buildSectionTitle('Administrative Assignment'),
                _buildTextInputField('Administrative Assignment',
                    controller: _administrativeAssignmentController),
                _buildSectionTitle('Service to Institute'),
                _buildTextInputField('Service to Institute',
                    controller: _serviceToInstituteController),
                _buildSectionTitle('Other Contribution'),
                _buildTextInputField('Other Contribution',
                    controller: _otherContributionController),
                _buildSectionTitle('Other Instructional Tasks'),
                _buildTextInputField('Other Instructional Tasks',
                    controller: _otherInstructionalTasksController),
                _buildSectionTitle('Comments on Performance'),
                _buildTextInputField(
                    'Your comments on your performance so far and this academic year particularly',
                    controller: _commentsOnPerformanceController),
                _buildTextInputField('Receiver Name',
                    controller: _receiverNameController),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      getDesignations();
                    },
                    child: Text("Show Designations of user")),
                SizedBox(height: 20),
                fetchedDesignationsOfReceiver
                    ? DropdownButtonFormField(
                        items: designationsOfReceiver
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          _receiverDesignationController.text =
                              value.toString();
                        })
                    : Container(),
                SizedBox(height: 20),
                SizedBox(
                  height: 20,
                ),
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
