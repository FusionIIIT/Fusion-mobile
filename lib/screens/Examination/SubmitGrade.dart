import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';

class SubmitGrade extends StatefulWidget {
  @override
  _SubmitGradeState createState() => _SubmitGradeState();
}

class _SubmitGradeState extends State<SubmitGrade> {
  String? _yearValue;
  String? _batchValue;
  String? _branchValue;
  String? _semesterValue;
  int? _courseId;
  TextEditingController _courseIdController = TextEditingController();
  String? _courseValue;
  List<Map<String, dynamic>> courses = [];
  String? _specializationValue;
  String? _programmeValue;

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
        case 'Course':
          _courseValue = value;
          break;
        case 'Programme':
          _programmeValue = value;
          break;
        case 'Specialization':
          _specializationValue = value;
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
      case 'Course':
        return _courseValue;
      case 'Programme': // Added
        return _programmeValue;
      case 'Specialization': // Added
        return _specializationValue;
      default:
        return null;
    }
  }

  List<String> YearTypeItem = ['2019' , '2020', '2021', '2022', '2023', '2024'];

  List<String> batchTypeItem = ['2020', '2021', '2022', '2023'];

  List<String> curriculumTypeItem = [
    'B.Tech',
    'B.Des',
    'M.Tech',
    'M.Des',
    'PHD',
  ];

  List<String> branchTypeItem = [
    'CSE',
    'ECE',
    'ME',
    'SM',
    'DS',
    ''
  ];

  List<String> semesterTypeItem = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  List<String> courseTypeItem = [];
  // Method to fetch course items from backend
  void _fetchCourseItems() async {
    try {
      // Call your backend service method to fetch course items
      courses = await ExaminationService().getCourseItems();

      setState(() {
        // Update courseTypeItem with fetched courses' names
        courseTypeItem =
            courses.map<String>((course) => course['name']).toList();
      });
    } catch (e) {
      print('Error fetching course items: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCourseItems(); // Fetch course items when widget initializes
  }

  int? courseIdFromValue(String selectedValue) {
    // Iterate through the courses list

    print(selectedValue);
    for (var course in courses) {
      // Check if the name of the course matches the selected value
      if (course['name'] == selectedValue) {
        // If a match is found, return the ID of the course
        print(course['id']);
        return course['id'];
      }
    }
    // If no match is found, return null
    return null;
  }

  void _retrieveCourseId() {
    _courseId = courseIdFromValue(_courseValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Submit Grade").buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown('Year', YearTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Course', courseTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Semester', semesterTypeItem),
              createButton(
                buttonText: 'Search',
                onPressed: () async {
                  int? _courseId = courseIdFromValue(_courseValue!);
                  if (_courseId != null) {
                    try {
                      ExaminationService examService = ExaminationService();

                      // Fetch all data
                      List<dynamic> registeredStudents = await examService
                          .getRegisteredStudentsRollNo(_courseId, _yearValue!);

                      setState(() {
                        _registeredStudents = registeredStudents;

                        // print("DEBUG:$_registeredStudents");
                      });
                    } catch (e) {
                      print('Error fetching registered students: $e');
                    }
                  }
                },
                showSearchIcon: true,
              ),
              SizedBox(height: 20),

              Text(
                'Registered Students',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Grade')),
                      DataColumn(label: Text('Marks')),
                      // Removed the DataColumn for "Year"
                    ],
                    rows:
                        _registeredStudents.take(_displayLimit).map((student) {
                      TextEditingController gradeController =
                          TextEditingController(text: student['grade']);
                      TextEditingController marksController =
                          TextEditingController(text: student['total_marks']);
                      return DataRow(cells: [
                        DataCell(Text(student['roll_no'].toString())),
                        DataCell(TextField(
                          controller: gradeController,
                          onChanged: (value) {
                            student['grade'] = value;
                          },
                        )),
                        DataCell(TextField(
                          controller: marksController,
                          onChanged: (value) {
                            student['total_marks'] = value;
                          },
                        )),
                        // Removed the DataCell for "Year"
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Call _retrieveCourseId before invoking the 'Save' action
              createButton(
                  buttonText: 'Save',
                  onPressed: () async {
                    // Ensure courseId is retrieved before saving
                    _retrieveCourseId();
                    // print(_registeredStudents);
                    try {
                      List<Map<String, dynamic>> updatedStudentsData =
                          _registeredStudents.map((student) {
                        // Ensure _courseId is not null before using it
                          print(student['roll_no']);
                            print( _courseId.toString());
                            print( _semesterValue);
                            print(_yearValue);
                            print(student['grade'] ??'NA');
                            print(student['total_marks']??'0');
                            
                        if (_courseId != null) {
                          return {
                              
                            'roll_no': student['roll_no'],
                            'course_id': _courseId.toString(),
                            'semester_id': _semesterValue,
                            'year': _yearValue,
                            'grade': student['grade']??'NA',
                            'total_marks': student['total_marks']??'0',
                            
                          };
                        } else {
                          // Handle the case where _courseId is null
                          throw Exception("Course ID is null");
                        }
                      }).toList();

                      // Make API call to save updated student data
                      ExaminationService examinationService =
                          ExaminationService();
                      await examinationService
                          .submitGades(updatedStudentsData);

                      // Show success message or perform other actions upon successful save
                    } catch (e) {
                      print('Error saving student grades: $e');
                      // Handle error, show error message, or perform other actions
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
