import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class CourseListHome extends StatefulWidget {
  @override
  _CourseListHome createState() => _CourseListHome();
}

class _CourseListHome extends State<CourseListHome> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _selectedProgram = programs.first;
  late String _selectedBranch = branches.first;
  late String _selectedBatch = batches.first;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  final List<String> programs = ['B.Tech', 'Ph.D', 'M.Tech', 'B.Des', 'M.Des'];
  final List<String> branches = ['CSE', 'ECE', 'ME', 'SM'];
  final List<String> batches = ['2018', '2019', '2020', '2021', '2022'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: "Course List",
          onDesignationChanged: (newValue) {
            setState(() {
              curr_desig = newValue;
            });
          },
        ), // This is default app bar used in all modules
        drawer: SideDrawer(curr_desig: curr_desig),
        bottomNavigationBar:
            MyBottomNavigationBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DropdownButtonFormField(
                    value: _selectedProgram,
                    hint: Text('Select Program'),
                    onChanged: (value) {
                      setState(() {
                        _selectedProgram = value as String;
                      });
                    },
                    items: programs.map((program) {
                      return DropdownMenuItem(
                        value: program,
                        child: Text(program),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a program';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField(
                    value: _selectedBranch,
                    hint: Text('Select Branch'),
                    onChanged: (value) {
                      setState(() {
                        _selectedBranch = value as String;
                      });
                    },
                    items: branches.map((branch) {
                      return DropdownMenuItem(
                        value: branch,
                        child: Text(branch),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a branch';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField(
                    value: _selectedBatch,
                    hint: Text('Select Batch'),
                    onChanged: (value) {
                      setState(() {
                        _selectedBatch = value as String;
                      });
                    },
                    items: batches.map((batch) {
                      return DropdownMenuItem(
                        value: batch,
                        child: Text(batch),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a batch';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        // Submit logic here
                        print('Program: $_selectedProgram');
                        print('Branch: $_selectedBranch');
                        print('Batch: $_selectedBatch');
                        Navigator.pushNamed(context, "/course_list",
                            arguments: {
                              'programme': _selectedProgram,
                              'branch': _selectedBranch,
                              'batch': _selectedBatch
                            });
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[800],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
