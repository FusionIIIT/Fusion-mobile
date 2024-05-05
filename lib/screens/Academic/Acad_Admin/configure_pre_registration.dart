import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ConfigurePreRegistration extends StatefulWidget {
  @override
  _ConfigurePreRegistrationState createState() =>
      _ConfigurePreRegistrationState();
}

class _ConfigurePreRegistrationState extends State<ConfigurePreRegistration>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addDropFormKey = GlobalKey<FormState>();
  late TextEditingController _slotController;
  late TextEditingController _courseController;
  bool _loading1 = false;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _responseText;
  int _semesterNumber = 1;
  String? _selectedBatch;
  late String _selectedBranch;
  late String _selectedProgramme;
  late AcademicService academicService;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  String? _removeResponseText;
  String? _addResponseText;
  List<dynamic> _courseList = [];
  List<dynamic> courseTable = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    academicService = AcademicService();
    _selectedBranch = 'CSE'; // Initial value for branch
    _selectedProgramme = 'B.Tech'; // Initial value for programme
    _selectedBatch = '2021'; // Initial value for batch
    _semesterNumber = 1; // Initial value for semester
    _slotController = TextEditingController();
    _courseController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _slotController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_selectedBatch == null ||
        _selectedBranch.isEmpty ||
        _selectedProgramme.isEmpty) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      try {
        _loading1 = true;
        Response response = await academicService.getNextSemCourses(
            _semesterNumber,
            _selectedBranch,
            _selectedProgramme,
            _selectedBatch.toString());
        setState(() {
          courseTable = jsonDecode(response.body);
          _courseList = courseTable
              .map((entry) => {
                    "name": entry["fields"]["name"],
                    "type": entry["fields"]["type"],
                    "semester": entry["fields"]["semester"],
                    "credit": entry["courses"][0]["credit"],
                    "courses": entry["courses"]
                        .map((course) => course["code"] + "-" + course["name"])
                        .toList()
                  })
              .toList();
          print(_courseList);
        });
        // _showSuccessModal(_responseText.toString());
        _loading1 = false;
      } catch (e) {
        print(e);
        _showErrorModal(e.toString());
      }
    }
  }

  Future<void> addCourse(String course, String slot) async {
    if (_addDropFormKey.currentState!.validate()) {
      try {
        _loading1 = true;
        Response response = await academicService.addCourseToSlot(course, slot);
        setState(() {
          _addResponseText = (jsonDecode(response.body))["message"];
        });
        _showSuccessModal(_addResponseText.toString());
        _loading1 = false;
      } catch (e) {
        print(e);
        _showErrorModal(e.toString());
      }
    }
  }

  Future<void> removeCourse(String course, String slot) async {
    try {
      _loading1 = true;
      Response response =
          await academicService.removeCourseFromSlot(course, slot);
      setState(() {
        _removeResponseText = (jsonDecode(response.body))["message"];
      });
      _showSuccessModal(_removeResponseText.toString());
      _loading1 = false;
    } catch (e) {
      _showErrorModal(e.toString());
      print(e);
    }
  }

  void _showSuccessModal(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorModal(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Configure Pre-Registration",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'View Courses'),
              Tab(text: 'Add/Drop Courses'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // View Courses Tab
                Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedBatch,
                        decoration: InputDecoration(
                          labelText: 'Batch',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a batch';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedBatch = value!;
                          });
                        },
                        items: ["2020", "2021", "2022", "2023"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedBranch,
                        decoration: InputDecoration(
                          labelText: 'Branch',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a branch';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedBranch = value!;
                          });
                        },
                        items: ['CSE', 'ECE', 'Mech', 'Civil']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<int>(
                        value: _semesterNumber,
                        decoration: InputDecoration(
                          labelText: 'Semester Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isNaN) {
                            return 'Please enter semester number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _semesterNumber = value!;
                            print(_semesterNumber);
                          });
                        },
                        items: List.generate(8, (index) => (index + 1))
                            .map<DropdownMenuItem<int>>((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedProgramme,
                        decoration: InputDecoration(
                          labelText: 'Programme',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a programme';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedProgramme = value!;
                          });
                        },
                        items: ['B.Tech', 'M.Tech', 'PhD', 'B.Des']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange[900], // background color
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      _responseText == null
                          ? Container()
                          : Text(
                              _responseText!,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                      SizedBox(height: 20),
                      _courseList.length == 0
                          ? SizedBox(height: 0)
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text("Slot Name"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Slot Type"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Semester"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Credit"),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Courses"),
                                    numeric: false,
                                  ),
                                ],
                                rows: _courseList.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['name'].toString())),
                                    DataCell(Text(data['type'].toString())),
                                    DataCell(Text(data['semester'].toString())),
                                    DataCell(Text(data['credit'].toString())),
                                    DataCell(
                                      DropdownButton<dynamic>(
                                        value: data['courses'][0],
                                        onChanged: _loading1
                                            ? null
                                            : (dynamic? newValue) {
                                                setState(() {
                                                  data['courses'][0] =
                                                      newValue!;
                                                });
                                              },
                                        items: data['courses']
                                            .map<DropdownMenuItem<dynamic>>(
                                                (dynamic course) {
                                          return DropdownMenuItem<dynamic>(
                                            value: course,
                                            child: Text(course),
                                            enabled: false,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                    ],
                  ),
                ),

                // Add/Drop Courses Tab
                Form(
                  key: _addDropFormKey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Slot Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter slot name';
                          }
                          return null;
                        },
                        controller: _slotController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Course Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter course name';
                          }
                          return null;
                        },
                        controller: _courseController,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addCourse(
                                  _courseController.text, _slotController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.orange[900], // background color
                            ),
                            child: Text('Add'),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              removeCourse(
                                  _courseController.text, _slotController.text);
                            },
                            child: Text('Remove'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
