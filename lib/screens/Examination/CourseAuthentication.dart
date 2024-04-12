import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';

class CourseAuthentication extends StatefulWidget {
  @override
  _CourseAuthenticationState createState() => _CourseAuthenticationState();
}

class _CourseAuthenticationState extends State<CourseAuthentication> {
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
  String? _courseValue;
  TextEditingController _courseIdController = TextEditingController();
  TextEditingController _courseController = TextEditingController();
  List<Map<String, dynamic>> courses = [];

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
    int? _courseId = courseIdFromValue(_courseValue!);
    

    if (authenticator1) {
      await examService.updateAuthenticator(_courseId!, _yearValue!, 1);
    }
    if (authenticator2) {
      await examService.updateAuthenticator(_courseId!, _yearValue!, 2);
    }
    if (authenticator3) {
      await examService.updateAuthenticator(_courseId!, _yearValue!, 3);
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
      case 'Course':
        return _courseValue;
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
      appBar: CustomAppBar(titleText: "Course Authentication").buildAppBar(),
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
              _buildDropdown('Course', courseTypeItem),
              
              SizedBox(height: 20),
              
              

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: isVerified
                    ? Text("Result is verified")
                    : Text("Result is not yet verified"),
              ),
               SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
