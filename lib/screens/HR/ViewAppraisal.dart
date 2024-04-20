import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/RequestsOfAUserList.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewAppraisal extends StatefulWidget {
  const ViewAppraisal({required this.formdata, required this.index});
  final formdata;
  final index;

  @override
  State<ViewAppraisal> createState() {
    return _ViewAppraisalState();
  }
}

class _ViewAppraisalState extends State<ViewAppraisal> {
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  List<dynamic> displayData = [];
  Map<dynamic, dynamic> _formdata = {};
  bool _loading1 = true;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service;
  @override
  void initState() {
    // TODO: implement initState
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print("hello");
      convertString();
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    super.initState();
  }

  convertString() async {
    print("converting");
    int index = widget.index;
    displayData = jsonDecode(widget.formdata);
    _formdata = displayData[index];
    print(_formdata);
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

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        _buildSectionTitle('Personal Information'),
        Text(
          'Name: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['name']),
        SizedBox(height: 10),
        Text(
          'Designation: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['designation']),
        SizedBox(height: 10),
        Text(
          'Discipline: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['disciplineInfo']),
        SizedBox(height: 10),
        Text(
          'Specific field of Knowledge: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['specificFieldOfKnowledge']),
        SizedBox(height: 10),
        Text(
          'Current research interests: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['currentResearchInterests']),
        SizedBox(height: 20),

        _buildSectionTitle('Courses Taught at UG/PG Level'),
        SizedBox(height: 5),
        //  Write a new code to display list of objects
        _formdata['coursesTaught'].isEmpty
            ? Text('No courses Taught')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['coursesTaught'].length,
                itemBuilder: (context, index) {
                  if (_formdata['coursesTaught'].isEmpty)
                    return Text('No courses Taught');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          '${(index + 1).toString()}. Semester: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['coursesTaught'][index]!['semester']),
                      ]),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Course Number: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['coursesTaught']
                              [index]!['courseNumber'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Lectures Hours Per Week: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['coursesTaught']
                              [index]!['lecturesHrsPerWeek'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Students Registered: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['coursesTaught']
                              [index]!['studentsRegistered'])
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),

        // ********New fields UI written but logic is not completed********

        _buildSectionTitle('New Courses Taught at UG/PG Level'),
        SizedBox(height: 5),
        //  Write a new code to display list of objects
        _formdata['form']['newCourses'].isEmpty
            ? Text('No new courses Taught')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['form']['newCourses'].length,
                itemBuilder: (context, index) {
                  if (_formdata['form']['newCourses'].isEmpty)
                    return Text('No new courses Taught');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          '${(index + 1).toString()}. Course Name & Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['newCourses']
                            [index]!['courseName&Number']),
                      ]),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'UG/PG: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['newCourses'][index]!['UG/PG'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Year & Semester Of First Offering: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['newCourses']
                              [index]!['Year&SemesterOfFirstOffering'])
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
        _buildSectionTitle('New Course Material Developed'),
        SizedBox(height: 5),
        //  Write a new code to display list of objects
        _formdata['form']['coursesNewMaterial'].isEmpty
            ? Text('No new courses material developed')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['form']['coursesNewMaterial'].length,
                itemBuilder: (context, index) {
                  if (_formdata['form']['coursesNewMaterial'].isEmpty)
                    return Text('No new courses material developed ');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          '${(index + 1).toString()}. Course Name and Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['coursesNewMaterial']
                            [index]!['courseName&Number']),
                      ]),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'UG/PG : ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['coursesNewMaterial']
                              [index]!['UG/PG'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Type of Activity :  ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['coursesNewMaterial']
                              [index]!['TypeOfActivity'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Web/Public: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['coursesNewMaterial']
                              [index]!['Web/Public'])
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
        _buildSectionTitle('Thesis/Research Supervision'),
        SizedBox(height: 5),
        //  Write a new code to display list of objects
        _formdata['form']['thesisResearch'].isEmpty
            ? Text('No Thesis/Research Supervision')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['form']['thesisResearch'].length,
                itemBuilder: (context, index) {
                  if (_formdata['form']['thesisResearch'].isEmpty)
                    return Text('No Thesis/Research Supervision');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          '${(index + 1).toString()}. Name of Student: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['thesisResearch']
                            [index]!['nameOfStudent']),
                      ]),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Title of Thesis: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['thesisResearch']
                              [index]!['titleOfThesis'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Year & Semester of first Registration: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['thesisResearch']
                              [index]!['year&SemesterOfFirstRegistration'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['thesisResearch']
                              [index]!['status'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Co-supervisiors: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['form']['thesisResearch']
                              [index]!['coSupervisiors'])
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),

        _buildSectionTitle('Sponsored Research Projects'),
        SizedBox(height: 5),
        //  Write a new code to display list of objects
        _formdata['sponsoredReseachProjects'].isEmpty
            ? Text("No Research Projects")
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['sponsoredReseachProjects'].length,
                itemBuilder: (context, index) {
                  if (_formdata['sponsoredReseachProjects'].isEmpty) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('No Research Projects')]);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${(index + 1).toString()}. Title: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['sponsoredReseachProjects']
                              [index]!['title'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Sponsoring Agency: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['sponsoredReseachProjects']
                              [index]!['sponsoringAgency'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Project Funding: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['sponsoredReseachProjects']
                              [index]!['projectFunding'])
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Project Duration: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['sponsoredReseachProjects']
                              [index]!['projectDuration'])
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _remarksController,
          maxLength: 50,
          enabled: false,
          decoration: const InputDecoration(
            label: Text('Remarks '),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some remark or NA if not applicable.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _receiverNameController,
          maxLength: 50,
          enabled: false,
          decoration: const InputDecoration(
            label: Text('Receiver\'s Name '),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter receiver name correctly or NA if not applicable.';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _formdata["approved"] == 'true'
                ? Text("Application Approved by ${_formdata['approved_by']}",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold))
                : Container(),
            _formdata["approved"] == 'false'
                ? Text("Application Declined",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
                : Container(),
            _formdata["approved"] == 'null' || _formdata["approved"] == null
                ? Text("Application Pending...",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
                : Container()
          ],
        ),
      ],
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Icon(
        icon,
        size: 48.0, // Adjust the size of the icon as needed
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0, // Adjust the size of the title as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formdata["notFetched"] == true
                    ? _loading1
                        ? CircularProgressIndicator()
                        : Center(child: Text("Failed to Fetch Application"))
                    : Column(
                        children: [
                          _buildForm(),
                        ],
                      )
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
}
