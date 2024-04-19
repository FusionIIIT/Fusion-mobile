import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class GenerateStudentList extends StatefulWidget {
  @override
  _GenerateStudentListState createState() => _GenerateStudentListState();
}

class _GenerateStudentListState extends State<GenerateStudentList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _batchController;
  late TextEditingController _courseController;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  List<Map<String, dynamic>> _studentList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _batchController = TextEditingController();
    _courseController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _batchController.dispose();
    _courseController.dispose();
    super.dispose();
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
        bottomNavigationBar:
            MyBottomNavigationBar(),
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
                  TextField(
                    controller: _courseController,
                    decoration: InputDecoration(labelText: 'This Semester Course'),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_batchController.text.isNotEmpty && _courseController.text.isNotEmpty) {
                        // Dummy data for demonstration
                        setState(() {
                          _studentList = [
                            {'rollNo': '21BCS038', 'name': 'John Doe', 'branch': 'CSE'},
                            {'rollNo': '21BCS073', 'name': 'Jane Smith', 'branch': 'CSE'},
                            {'rollNo': '21BEC097', 'name': 'Alice Johnson', 'branch': 'CSE'},
                          ];
                        });
                      } else {
                        // Show a snackbar indicating that batch and course are required
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Batch and Course are required')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[900], // Set background color to orange[900]
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
        rows: _studentList.map(
          (student) => DataRow(
            cells: [
              DataCell(Text(student['rollNo'])),
              DataCell(Text(student['name'])),
              DataCell(Text(student['branch'])),
            ],
          ),
        ).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GenerateStudentList(),
  ));
}
