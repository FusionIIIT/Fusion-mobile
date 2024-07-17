import 'package:flutter/material.dart';
// import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';



import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


class ModerateGrade extends StatefulWidget {
  @override
  _ModerateGradeState createState() => _ModerateGradeState();
}

class _ModerateGradeState extends State<ModerateGrade> {
  String? _yearValue;
  String? _batchValue;
  String? _branchValue;
  String? _semesterValue;
  int? _courseId;
  String? _courseValue;
  TextEditingController _courseIdController = TextEditingController();
  List<Map<String, dynamic>> courses = [];

  List<dynamic> _registeredStudents = [];
  final int _displayLimit = 1000;
   var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");

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

  List<String> YearTypeItem = ['2016' , '2017', '2018', '2019', '2020', '2021', '2022', '2023' , '2024'];

  List<String> batchTypeItem = [ '2016' , '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

  List<String> branchTypeItem = [
    'Branch CSE',
    'Branch ECE',
    'Branch ME',
    'Branch SM',
    'Branch DS',
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

      // Method to show dialog box for successful submission
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Grades Moderated"),
          content: Text("Grades have been moderated successfully."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
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
    	headerTitle: "Moderate Grade",
    	onDesignationChanged: (newValue) {
      	setState(() {
        	curr_desig = newValue;
      	});
 
    	},
  	),
       	drawer: SideDrawer(curr_desig: curr_desig),
  	bottomNavigationBar:
  	MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown('Year', YearTypeItem),
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
                          await examService.getRegisteredStudents(
                              _courseId, _semesterValue!, _yearValue!);

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
                        DataColumn(label: Text('Roll No')),
                        DataColumn(label: Text('Marks')),
                        DataColumn(label: Text('Grade')),
                        // DataColumn(label: Text('Year')),
                      ],
                      rows: _registeredStudents
                          .take(_displayLimit)
                          .map((student) {
                        TextEditingController gradeController =
                            TextEditingController(text: student['grade'] ?? '');
                        TextEditingController marksController =
                            TextEditingController(
                                text: student['total_marks'] ?? '');
                        return DataRow(cells: [
                          DataCell(Text(student['roll_no'] ?? '')),
                          DataCell(TextField(
                            controller: marksController,
                            onChanged: (value) {
                              student['total_marks'] = value;
                            },
                          )),
                          DataCell(TextField(
                            controller: gradeController,
                            onChanged: (value) {
                              student['grade'] = value;
                            },
                          )),
                          // DataCell(Text(student['year']?.toString() ?? '')),
                        ]);
                      }).toList(),
                    )),
              ),
              SizedBox(height: 20),
              createButton(
                  buttonText: 'Save',
                  onPressed: () async {
                    try {
                      List<Map<String, dynamic>> updatedStudentsData =
                          _registeredStudents.map((student) {
                        print(student);
                        print(_semesterValue!);
                        print(student['course_id_id']);
                        print(student['year']);
                        return {
                          'roll_no': student['roll_no'],
                          'course_id': student['course_id_id'],
                          'semester_id': _semesterValue!,
                          'year': student['year'],
                          'grade': student['grade'],
                          'total_marks': student['total_marks'],
                        };
                      }).toList();
                      // Make API call to save updated student data
                      ExaminationService examinationService =
                          ExaminationService(); // Create an instance
                      await examinationService
                          .updateGrades(updatedStudentsData);

                      _showSuccessDialog();
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
