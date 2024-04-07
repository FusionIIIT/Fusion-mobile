import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';

class VerifyResult extends StatefulWidget {
  @override
  _VerifyResultState createState() => _VerifyResultState();
}

class _VerifyResultState extends State<VerifyResult> {
  String? _yearValue;
  String? _batchValue;
  String? _branchValue;
  String? _semesterValue;
  int? _courseId; // Course ID variable
  String? _courseName;
  bool isVerified = false;
  bool authenticator1 = false;
  bool authenticator2 = false;
  bool authenticator3 = false;

  TextEditingController _courseIdController = TextEditingController();
  TextEditingController _courseController = TextEditingController();

  List<dynamic> _registeredStudents = [];
  final int _displayLimit = 10;

  void _handleDropdownChange(String dropdownName, String? value) {
    setState(() {
      switch (dropdownName) {
        case 'Year':
          _yearValue = value;
          break;
        case 'Batch':
          _batchValue = value;
          break;
        case 'Branch':
          _branchValue = value;
          break;
        case 'Semester':
          _semesterValue = value;
          break;
      }
    });
  }

  Widget _buildDropdown(String name, List<String> items) {
    List<DropdownMenuItem<String>> dropdownItems = items.map((valueItem) {
      return DropdownMenuItem(
        value: valueItem,
        child: Text(valueItem),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          elevation: 16,
          value: _getValueByName(name),
          isExpanded: true,
          hint: Text("-SELECT ITEM-"),
          items: dropdownItems,
          onChanged: (value) {
            _handleDropdownChange(name, value);
          },
        ),
      ],
    );
  }

  Widget createButton(
      {required String buttonText,
      Function()? onPressed,
      bool showSearchIcon = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Colors.blue), // Update color according to your design
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30.0)),
            ),
            child: Row(
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                if (showSearchIcon) SizedBox(width: 10),
                if (showSearchIcon) Icon(Icons.search, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _updateAuthenticators() async {
  try {
    // Create an instance of ExaminationService
    ExaminationService examService = ExaminationService();

    // Make API call to update authenticators based on checkbox state
    // You need to pass the checked state of each authenticator
    int _year = int.parse(_yearValue!);
    print('Course Name: $_courseName, Year: $_year, Authenticator 1: $authenticator1, Authenticator 2: $authenticator2, Authenticator 3: $authenticator3');

    if (authenticator1) {
      await examService.updateAuthenticator(_courseName!, _year, 1);
    }
    if (authenticator2) {
      await examService.updateAuthenticator(_courseName!, _year, 2);
    }
    if (authenticator3) {
      await examService.updateAuthenticator(_courseName!, _year, 3);
    }

    // Handle success
    print('Authenticators updated successfully');
  } catch (e) {
    // Handle error
    print('Error updating authenticators: $e');
  }
}


  String? _getValueByName(String name) {
    switch (name) {
      case 'Year':
        return _yearValue;
      case 'Batch':
        return _batchValue;
      case 'Branch':
        return _branchValue;
      case 'Semester':
        return _semesterValue;
      default:
        return null;
    }
  }

  List<String> YearTypeItem = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
  ];

  List<String> batchTypeItem = [
    '2020',
    '2021',
    '2022',
    '2023',
  ];

  List<String> branchTypeItem = [
    'Branch CSE',
    'Branch ECE',
    'Branch ME',
    'Branch SM',
    'Branch DS',
  ];

  List<String> semesterTypeItem = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Verify Result").buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown('Year', YearTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Batch', batchTypeItem),
              SizedBox(height: 20),
              // _buildDropdown('Branch', branchTypeItem),
              // SizedBox(height: 20),
              
              _buildDropdown('Semester', semesterTypeItem),
              SizedBox(height: 20),
              Text('Course Id',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                controller: _courseIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Course Id',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              createButton(
                buttonText: 'Search',
                onPressed: () async {
                  // Parse Course Id to integer
                  _courseId = int.tryParse(_courseIdController.text);
                  print((_courseId != null ? _courseId.toString() : ""));

                  if (_courseId != null) {
                    try {
                      // Create an instance of ExaminationService
                      ExaminationService examService = ExaminationService();

                      bool allAuthenticated = await examService.checkAllAuthenticators(69, 2024);

                      print(allAuthenticated);
                      // Call getRegisteredStudents to fetch student details
                      List<dynamic> registeredStudents =
                          await examService.getRegisteredStudents(_courseId!);

                      // Do something with the registered students data
                      setState(() {
                        _registeredStudents = registeredStudents;
                        isVerified = allAuthenticated;
                      });
                    } catch (e) {
                      print('Error fetching registered students: $e');
                    }
                  }
                },
                showSearchIcon: true,
              ),

              // Display registered students data in a table
              SizedBox(height: 20),
              Text('Registered Students',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Working Year')),
                      DataColumn(label: Text('Student ID')),
                      DataColumn(label: Text('Semester ID')),
                      DataColumn(label: Text('Course ID')),
                      DataColumn(label: Text('Course Slot ID')),
                    ],
                    rows: _registeredStudents
                        .take(_displayLimit)
                        .map((student) => DataRow(
                              cells: [
                                DataCell(Text(student['id'].toString())),
                                DataCell(Text(student['working_year'] ?? '')),
                                DataCell(Text(student['student_id'])),
                                DataCell(
                                    Text(student['semester_id'].toString())),
                                DataCell(Text(student['course_id'].toString())),
                                DataCell(Text(student['course_slot_id'] ?? '')),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),

              SizedBox(height: 10),
              TextField(
                controller: _courseController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Course',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: isVerified
                    ? Text("Result is verified")
                    : Text("Result is not yet verified"),
              ),
               SizedBox(height: 20),
              createButton(
                buttonText: 'Verify',
                onPressed: () {
                  _courseName = _courseController.text;
                  // Handle verification process here
                  if (authenticator1 || authenticator2 || authenticator3) {
                    // At least one authenticator checked, proceed with verification
                    _updateAuthenticators(); // Call function to update authenticators
                    print("Verification successful");
                  } else {
                    // No authenticator checked
                    print("Please check at least one authenticator");
                  }
                },
              ),

              // Add checkboxes for authenticators
              CheckboxListTile(
                title: Text('Authenticator 1'),
                value: authenticator1,
                onChanged: (value) {
                  setState(() {
                    authenticator1 = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: Text('Authenticator 2'),
                value: authenticator2,
                onChanged: (value) {
                  setState(() {
                    authenticator2 = value!;
                  });
                },
              ),


               CheckboxListTile(
                title: Text('Authenticator 3'),
                value: authenticator3,
                onChanged: (value) {
                  setState(() {
                    authenticator3 = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
