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


  List<dynamic> _registeredStudents = [{
    'id': 1,
    'grade': 'A',
    'marks': '90',
    'working_year': '2023',
  },
  {
    'id': 2,
    'grade': 'B',
    'marks': '80',
    'working_year': '2022',
  },
  {
    'id': 3,
    'grade': 'C',
    'marks': '70',
    'working_year': '2024',
  },];
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
      default:
        return null;
    }
  }

  List<String> YearTypeItem = ['2020', '2021', '2022', '2023', '2024'];

  List<String> batchTypeItem = ['2020', '2021', '2022', '2023'];

  List<String> branchTypeItem = [
    'CSE',
    'ECE',
    'ME',
    'SM',
    'DS',
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
  
  List<String> courseTypeItem = []; 
    // Method to fetch course items from backend
void _fetchCourseItems() async {
  try {
    // Call your backend service method to fetch course items
    courses = await ExaminationService().getCourseItems();
    
    setState(() {
      // Update courseTypeItem with fetched courses' names
      courseTypeItem = courses.map<String>((course) => course['name']).toList();
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
              _buildDropdown('Batch', batchTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Semester', semesterTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Course', courseTypeItem),
      
              SizedBox(height: 20),
              createButton(
                buttonText: 'Search',
                onPressed: () async {
                  int? _courseId = courseIdFromValue(_courseValue!);
                  if (_courseId != null) {
                    try {
                      ExaminationService examService = ExaminationService();


                      List<dynamic> registeredStudents =
                          await examService.getRegisteredStudents(_courseId, _semesterValue!, _batchValue!);

                      setState(() {
                        _registeredStudents = registeredStudents;
                      });
                    } catch (e) {
                      print('Error fetching registered students: $e');
                    }
                  }
                },
                showSearchIcon: true,
              ),
              SizedBox(height: 20),
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
                      DataColumn(label: Text('Grade')),
                      DataColumn(label: Text('Marks')),
                      DataColumn(label: Text('Year')),
                    ],
                    rows: _registeredStudents
                        .take(_displayLimit)
                        .map((student) {
                      TextEditingController gradeController =
                          TextEditingController(text: student['grade']);
                      TextEditingController marksController =
                          TextEditingController(text: student['marks']);
                      return DataRow(cells: [
                        DataCell(Text(student['id'].toString())),
                        DataCell(TextField(
                          controller: gradeController,
                          onChanged: (value) {
                            student['grade'] = value;
                          },
                        )),
                        DataCell(TextField(
                          controller: marksController,
                          onChanged: (value) {
                            student['marks'] = value;
                          },
                        )),
                        DataCell(Text(student['working_year'] ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(height: 20),
              createButton(buttonText: 'Save' ,onPressed: () => {

              })

            ],
          ),
        ),
      ),
    );
  }
}
