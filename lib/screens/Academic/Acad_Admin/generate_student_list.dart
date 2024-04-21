import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GenerateStudentList extends StatefulWidget {
  @override
  _GenerateStudentListState createState() => _GenerateStudentListState();
}

class _GenerateStudentListState extends State<GenerateStudentList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _batchController;
  late TextEditingController _courseController;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool _loading1 = true;
  late AcademicService academicService;
  List<dynamic> courseOptions = [];
  // List<dynamic> coursebhai = [];

  List<dynamic> _studentList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _batchController = TextEditingController();
    _courseController = TextEditingController();
    academicService = AcademicService();
    getAllCourses();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _batchController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  getAllCourses() async {
    try {
      Response response = await academicService.getAllCourses();
      setState(() {
        courseOptions = jsonDecode(response.body);
        // sort course options on the basis of course_name
        courseOptions.sort((a, b) => a['name'].compareTo(b['name']));
        // print(courseOptions);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  getRollList(String batch, String course) async {
    try {
      _loading1 = true;
      Response response = await academicService.generateRollList(batch,  course);
      setState(() {
        _studentList = jsonDecode(response.body)["students"];
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Generate Roll List",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // This Semester tab
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _batchController,
                    decoration: InputDecoration(labelText: 'Batch'),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Adjust; the width as needed
                        height: 100,
                    child: DropdownButtonFormField(
                      items: courseOptions.map((course) {
                        return DropdownMenuItem(
                          value: course['id'],
                          child: Container(
                            // Wrap the DropdownMenuItem with Container
                            width: 300, // Set the width of the Container to fill available space
                            
                            child: Text(
                              // Wrap the Text widget inside the Container
                              course['name'],
                              overflow: TextOverflow
                                  .ellipsis, // Set overflow to ellipsis
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _courseController.text = value.toString();
                      },
                      decoration: InputDecoration(
                        labelText: 'Course',
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_batchController.text.isNotEmpty &&
                          _courseController.text.isNotEmpty) {
                        getRollList(_batchController.text.toString(), _courseController.text.toString());
                      } else {
                        // Show a snackbar indicating that batch and course are required
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Batch and Course are required')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .orange[900], // Set background color to orange[900]
                      foregroundColor: Colors.white, // Set text color to white
                    ),
                    child: Text('Generate Student List'),
                  ),
                  SizedBox(height: 16.0),
                  if (_studentList.isNotEmpty) _buildStudentList(),
                ],
              ),
            ),
          ),
          // Pre-Registration Report tab
          Center(
            child: Text('Pre-Registration Report'),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Roll No')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Branch')),
        ],
        rows: _studentList
            .map(
              (student) => DataRow(
                cells: [
                  DataCell(Text(student['rollno'])),
                  DataCell(Text(student['name'])),
                  DataCell(Text(student['department'])),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GenerateStudentList(),
  ));
}
