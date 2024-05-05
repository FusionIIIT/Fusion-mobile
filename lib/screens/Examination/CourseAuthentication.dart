import 'package:flutter/material.dart';
// import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';



import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


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
  bool _fetchedAuthenticator1 = false;
  bool _fetchedAuthenticator2 = false;
  bool _fetchedAuthenticator3 = false;
   var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> _registeredStudents = [];
  final int _displayLimit = 1000;

  void _fetchAndUpdateAuthStatus(int courseId, String year) async {
    try {
      // Call ExaminationService to fetch authentication status
      ExaminationService examService = ExaminationService();
      Map<String, bool> authStatus =
          await examService.getAuthenticatorStatus(courseId, year);

      setState(() {
        _fetchedAuthenticator1 = authStatus['authenticator1'] ?? false;
        _fetchedAuthenticator2 = authStatus['authenticator2'] ?? false;
        _fetchedAuthenticator3 = authStatus['authenticator3'] ?? false;
      });
    } catch (error) {
      print('Error fetching authentication status: $error');
    }
  }

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
          _fetchAndUpdateAuthStatus(
              courseIdFromValue(_courseValue!)!, _yearValue!);
          break;
      }
    });
  }

   bool allAuthenticatorsAuthenticated() {
    return _fetchedAuthenticator1 && _fetchedAuthenticator2 && _fetchedAuthenticator3;
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

  List<String> YearTypeItem = ['2016' , '2017', '2018', '2019', '2020', '2021', '2022', '2023' , '2024'];

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
          title: Text("Authenticator Authenticated"),
          content: Text("Course has been authenticated ."),
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
    	headerTitle: "Course Authentication",
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
              _buildDropdown('Batch', batchTypeItem),
              SizedBox(height: 20),
              // _buildDropdown('Branch', branchTypeItem),
              // SizedBox(height: 20),

              _buildDropdown('Semester', semesterTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Course', courseTypeItem),

              SizedBox(height: 20),

              

              CheckboxListTile(
                title: Text('Authenticator 1'),
                value: authenticator1,
                onChanged: !_fetchedAuthenticator1
                    ? (value) {
                        setState(() {
                          authenticator1 = value!;
                        });
                      }
                    : null, // Disable checkbox if already authenticated
                activeColor:
                    Colors.green, // Set the color when checkbox is checked
              ),

              CheckboxListTile(
                title: Text('Authenticator 2'),
                value: authenticator2,
                onChanged: !_fetchedAuthenticator2
                    ? (value) {
                        setState(() {
                          authenticator2 = value!;
                        });
                      }
                    : null, // Disable checkbox if already authenticated
                activeColor:
                    Colors.green, // Set the color when checkbox is checked
              ),

              CheckboxListTile(
                title: Text('Authenticator 3'),
                value: authenticator3,
                onChanged: !_fetchedAuthenticator3
                    ? (value) {
                        setState(() {
                          authenticator3 = value!;
                        });
                      }
                    : null, // Disable checkbox if already authenticated
                activeColor:
                    Colors.green, // Set the color when checkbox is checked
              ),


              SizedBox(height: 20),
              Text('Authenticator 1: ${_fetchedAuthenticator1 ? 'Authenticated' : 'Not Authenticated'}'),
              SizedBox(height: 20),
              Text('Authenticator 2: ${_fetchedAuthenticator2 ? 'Authenticated' : 'Not Authenticated'}'),
              SizedBox(height: 20),
              Text('Authenticator 3: ${_fetchedAuthenticator3 ? 'Authenticated' : 'Not Authenticated'}'),


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
                    if (authenticator1) {
                      _fetchedAuthenticator1 = false;
                      authenticator1 = false;
                    }
                    if (authenticator2) {
                      _fetchedAuthenticator2 = false;
                      authenticator2 = false;
                    }
                    if (authenticator3) {
                      _fetchedAuthenticator3 = false;
                      authenticator3 = false;
                    }

                  _showSuccessDialog();
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
