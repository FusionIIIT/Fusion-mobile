import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/HR/RequestsOfAUserList.dart';
import 'package:fusion/api.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForwardAppraisal extends StatefulWidget {
  const ForwardAppraisal({required this.formdata, this.isArchived});
  final formdata;
  final isArchived;

  @override
  State<ForwardAppraisal> createState() {
    return _ForwardAppraisalState();
  }
}

class _ForwardAppraisalState extends State<ForwardAppraisal> {
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _receiverDesignationController =
      TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formdata = {"notFetched": true};
  late Map<String, dynamic> _trackingdata = {"notFetched": true};
  bool _loading1 = true;
  late List<dynamic> designationsOfReceiver = [];
  bool isCreator = false;
  bool isOwner = false;
  bool fetchedDesignationsOfReceiver = false;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  @override
  void initState() {
    // TODO: implement initState
    _profileController = StreamController();
    profileService = ProfileService();

    try {
      print("hello");
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    fetchForm();
    trackStatus();
    super.initState();
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

  void trackStatus() async {
    final String host = kserverLink;
    final String path = "/hr2/api/tracking/";
    final queryParameters = {
      'id': widget.formdata['id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      setState(() {
        _trackingdata = jsonDecode(response.body);
      });
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to Fetch Tracking Data")));
    }
    print(_trackingdata);
  }

  void archiveForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/appraisal/";
    final queryParameters = {'id': widget.formdata['id']};
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.delete(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application successfully archived!")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to archive application.")));
    }
  }

  void fetchForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/formFetch/";
    // print(widget.formdata);
    final queryParameters = {
      'file_id': widget.formdata['id'],
      'id': widget.formdata['src_object_id'],
      'type': widget.formdata['file_extra_JSON']
          .substring(7, widget.formdata['file_extra_JSON'].length - 1)
    };

    Uri uri = (Uri.http(host, path, queryParameters));
    // print(queryParameters);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var client = http.Client();
    var response = await client.get(uri, headers: headers);
    // print(response.body);

    if (response.statusCode == 200) {
      // ignore: avoid_print
      setState(() {
        _formdata = jsonDecode(response.body);
        _loading1 = false;
      });
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to Fetch Application")));
      setState(() {
        _loading1 = false;
      });
    }
    // print(_formdata);
    isOwner = _formdata['current_owner'] == datap.user!["username"];
    isOwner = _formdata['form']['approved'] == null ? isOwner : true;
    isCreator = _formdata['creator'] == datap.user!['username'];
    isCreator = widget.isArchived ? false : isCreator;
  }

  // Prefilled data for the fields
  void forwardForm() async {
    // Respond to button press
    final String host = kserverLink;
    final String path = "/hr2/api/appraisal/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };

    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_name": _receiverNameController.text,
        "receiver_designation": _receiverDesignationController.text,
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Forwarded Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Forward")));
    }
  }

  void approveForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/appraisal/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_name": _formdata['creator'],
        "receiver_designation": _receiverDesignationController.text,
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    _formdata['form']['approved'] = true;
    _formdata['form']['approved_by'] = datap.user!["id"];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Approved Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Approve")));
    }
  }

  void declineForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/appraisal/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['approved'] = false;
    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_name": _formdata['creator'],
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Declined Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Decline")));
    }
  }

  Widget _buildForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildSectionTitle("Tracking Details"),
      _trackingdata['notFetched'] != null
          ? Text("Failed to Fetch Tracking History")
          : _trackingdata['status'].isEmpty
              ? Text("No Tracking History")
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _trackingdata['status'].length,
                  itemBuilder: (context, index) {
                    if (_trackingdata['status'].isEmpty) {
                      return Text("No Tracking History");
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${index + 1}. Forwarded By: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_trackingdata['status'][index]['current_id']),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Forwarded on : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_trackingdata['status'][index]['forward_date']
                                .substring(0, 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Remarks : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Text(_trackingdata['status'][index]
                                          ['remarks'] ==
                                      ''
                                  ? 'No Remarks'
                                  : _trackingdata['status'][index]['remarks']),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  }),
      SizedBox(height: 10),
      _buildSectionTitle('Personal Information'),
      Text(
        'Name: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['name']),
      SizedBox(height: 10),
      Text(
        'Designation: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['designation']),
      SizedBox(height: 10),
      Text(
        'Discipline: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['disciplineInfo']),
      SizedBox(height: 10),
      Text(
        'Specific field of Knowledge: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['specificFieldOfKnowledge']),
      SizedBox(height: 10),
      Text(
        'Current research interests: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['currentResearchInterests']),
      SizedBox(height: 20),

      _buildSectionTitle('Courses Taught at UG/PG Level'),
      SizedBox(height: 5),
      //  Write a new code to display list of objects
      _formdata['form']['coursesTaught'].isEmpty
          ? Text('No courses Taught')
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _formdata['form']['coursesTaught'].length,
              itemBuilder: (context, index) {
                if (_formdata['form']['coursesTaught'].isEmpty)
                  return Text('No courses Taught');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        '${(index + 1).toString()}. Semester: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_formdata['form']['coursesTaught']
                          [index]!['semester']),
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Course Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['coursesTaught']
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
                        Text(_formdata['form']['coursesTaught']
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
                        Text(_formdata['form']['coursesTaught']
                            [index]!['studentsRegistered'])
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),

      // New fields UI written but logic is not completed
      _buildSectionTitle('New Courses Taught at UG/PG Level'),
      SizedBox(height: 5),
      //  Write a new code to display list of objects
      _formdata['form']['newCoursesIntroduced'].isEmpty
          ? Text('No new courses Taught')
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _formdata['form']['newCoursesIntroduced'].length,
              itemBuilder: (context, index) {
                if (_formdata['form']['newCoursesIntroduced'].isEmpty)
                  return Text('No new courses Taught');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        '${(index + 1).toString()}. Course Name & Number: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_formdata['form']['newCoursesIntroduced']
                          [index]!['courseName&Number']),
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'UG/PG: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['newCoursesIntroduced']
                            [index]!['UG/PG'])
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Year & Semester Of First Offering: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['newCoursesIntroduced']
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
      _formdata['form']['newCoursesDeveloped'].isEmpty
          ? Text('No new courses material developed')
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _formdata['form']['newCoursesDeveloped'].length,
              itemBuilder: (context, index) {
                if (_formdata['form']['newCoursesDeveloped'].isEmpty)
                  return Text('No new courses material developed ');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        '${(index + 1).toString()}. Course Name and Number: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_formdata['form']['newCoursesDeveloped']
                          [index]!['courseName&Number']),
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'UG/PG : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['newCoursesDeveloped']
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
                        Text(_formdata['form']['newCoursesDeveloped']
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
                        Text(_formdata['form']['newCoursesDeveloped']
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
      _formdata['form']['thesisSupervision'].isEmpty
          ? Text('No Thesis/Research Supervision')
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _formdata['form']['thesisSupervision'].length,
              itemBuilder: (context, index) {
                if (_formdata['form']['thesisSupervision'].isEmpty)
                  return Text('No Thesis/Research Supervision');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        '${(index + 1).toString()}. Name of Student: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_formdata['form']['thesisSupervision']
                          [index]!['nameOfStudent']),
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Title of Thesis: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_formdata['form']['thesisSupervision']
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
                        Text(_formdata['form']['thesisSupervision']
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
                        Text(_formdata['form']['thesisSupervision']
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
                        Text(_formdata['form']['thesisSupervision']
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
      _formdata['form']['sponsoredReseachProjects'].isEmpty
          ? Text("No Research Projects")
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _formdata['form']['sponsoredReseachProjects'].length,
              itemBuilder: (context, index) {
                if (_formdata['form']['sponsoredReseachProjects'].isEmpty) {
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
                        Text(_formdata['form']['sponsoredReseachProjects']
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
                        Text(_formdata['form']['sponsoredReseachProjects']
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
                        Text(_formdata['form']['sponsoredReseachProjects']
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
                        Text(_formdata['form']['sponsoredReseachProjects']
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
      Text(
        'Other Research Elements: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['otherResearchElement']),
      SizedBox(height: 10),
      Text(
        'Publications: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['publication']),
      SizedBox(height: 10),
      Text(
        'Referred Conference: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['referredConference']),
      SizedBox(height: 10),
      Text(
        'Conference Organised: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['conferenceOrganised']),
      SizedBox(height: 10),
      Text(
        'Membership: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['membership']),
      SizedBox(height: 10),
      Text(
        'Honours: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['honours']),
      SizedBox(height: 10),
      Text(
        'Editor of Publications: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['editorOfPublications']),
      SizedBox(height: 10),
      Text(
        'Expert Lecture Delivered: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['expertLectureDelivered']),
      SizedBox(height: 10),
      Text(
        'Membership of BOS: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['membershipOfBOS']),
      SizedBox(height: 10),
      Text(
        'Other Extension Tasks: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['otherExtensionTasks']),
      SizedBox(height: 10),
      Text(
        'Administrative Assignment: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['administrativeAssignment']),
      SizedBox(height: 10),
      Text(
        'Service to Institute: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['serviceToInstitute']),
      SizedBox(height: 10),
      Text(
        'Other Contribution: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['otherContribution']),
      SizedBox(height: 10),
      Text(
        'Other Instructional Tasks: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['otherInstructionalTasks']),
      Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _remarksController,
                maxLength: 50,
                enabled: _formdata["form"]["approved"] == null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                enabled: _formdata["form"]["approved"] == null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
            ],
          )),
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
                _receiverDesignationController.text = value.toString();
              })
          : Container(),
      SizedBox(height: 20),
      isOwner
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _formdata["form"]["approved"] == null
                    ? ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //   // If the form is valid, display a snackbar. In the real world,
                            //   // you'd often call a server or save the information in a database.

                            forwardForm();
                          }
                          // Respond to button press
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fill all the fields correctly')),
                            );
                          }
                          // Respond to approve button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 202, 122, 69),
                        ),
                        child: Text(
                          'Forward',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                _formdata["form"]["approved"] == null
                    ? ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //   // If the form is valid, display a snackbar. In the real world,
                            //   // you'd often call a server or save the information in a database.
                            print("pohoch");
                            declineForm();
                          }
                          // Respond to button press
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fill all the fields correctly')),
                            );
                          }
                          // Respond to decline button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 162, 201),
                        ),
                        child: Text(
                          'Decline',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                _formdata["form"]["approved"] == null
                    ? ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Approve Application"),
                                  content: Text(
                                      "Are you sure you want to approve this application?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () {
                                          approveForm();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Approve"))
                                  ],
                                );
                              });
                          // Respond to decline button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 162, 201),
                        ),
                        child: Text(
                          'Approve',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                _formdata["form"]["approved"] == true
                    ? Text(
                        "Application Approved by ${_formdata['form']['approved_by']}",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold))
                    : Container(),
                _formdata["form"]["approved"] == false
                    ? Text("Application Declined",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold))
                    : Container(),
              ],
            )
          : Container(
              child: Text(
                  "You are not the owner of this form. You have already forwarded this form."),
            ),
      SizedBox(height: 20),
      isCreator
          ? ElevatedButton(
              onPressed: () {
                //  show alert dialog box
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Archive Application"),
                        content: Text(
                            "Are you sure you want to archive this application? This action cannot be undone!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                archiveForm();
                                Navigator.of(context).pop();
                              },
                              child: Text("Archive this form"))
                        ],
                      );
                    });
                // approveForm();
                // Respond to decline button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 64, 162, 201),
              ),
              child: Text(
                'Archive this form.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      widget.isArchived
          ? Text("This form has been archived.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))
          : Container(),
      SizedBox(
        height: 10,
      )
    ]);
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
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "View Appraisal Form",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formdata["notFetched"] == true
                    ? _loading1
                        ? CircularProgressIndicator()
                        : Center(child: Text("Failed to Fetch Application"))
                    : Column(
                        children: [
                          _buildListTile(
                            context,
                            Icons.assignment,
                            'View Previous ${widget.formdata['file_extra_JSON'].substring(7, widget.formdata['file_extra_JSON'].length - 1)} Requests by ${_formdata['form']['name']}',
                            RequestsOfAUserListPage({
                              // id of the creator of this file,
                              'id': _formdata['creator'],
                              'type': widget.formdata['file_extra_JSON']
                                  .substring(
                                      7,
                                      widget.formdata['file_extra_JSON']
                                              .length -
                                          1)
                            }),
                          ),
                          SizedBox(height: 20),
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
