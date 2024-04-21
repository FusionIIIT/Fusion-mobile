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
  DateTime? _startDate;
  DateTime? _endDate;
  String? _responseText;
  String? _semesterNumber;
  String? _selectedBatch;
  late String _selectedBranch;
  late String _selectedProgramme;
  late AcademicService academicService;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    academicService = AcademicService();
    _selectedBranch = 'CSE'; // Initial value for branch
    _selectedProgramme = 'B.Tech'; // Initial value for programme
    _selectedBatch = '2021'; // Initial value for batch
    _semesterNumber = '1'; // Initial value for semester
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (
        _semesterNumber == null ||
        _selectedBatch == null ||
        _selectedBranch.isEmpty ||
        _selectedProgramme.isEmpty) {
      return;
    }
    // If the form is valid, proceed with API call
    final startDate = _startDate!.toString().substring(0, 10);
    final endDate = _endDate!.toString().substring(0, 10);
    int semester = int.parse(_semesterNumber!);

    Response response = await academicService.configurePreRegistration(
        startDate, endDate, semester);
    setState(() {
      _responseText = (jsonDecode(response.body))["message"];
    });
  }

  void _addCourse() {
    if (_addDropFormKey.currentState!.validate()) {
      // If the form is valid, add the course
      // Add your logic to add the course here
      // You can access the entered values using the controllers
      // Clear the form after adding the course
      _addDropFormKey.currentState!.reset();
      // Show success modal
      _showSuccessModal('Course added successfully');
    }
  }

  void _removeCourse() {
    // Add your logic to remove the course here
    // You can access the entered values using the controllers
    // Show success modal
    _showSuccessModal('Course removed successfully');
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
                        items: ["2021", "2022", "2023", "2024"]
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
                      DropdownButtonFormField<String>(
                        value: _semesterNumber,
                        decoration: InputDecoration(
                          labelText: 'Semester Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter semester number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _semesterNumber = value!;
                          });
                        },
                        items: List.generate(8, (index) => (index + 1).toString())
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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
                        items: ['B.Tech', 'M.Tech', 'PhD']
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
                          backgroundColor: Colors.orange[900], // background color
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Submit',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white),
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
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _addCourse,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[900], // background color
                            ),
                            child: Text('Add'),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: _removeCourse,
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
