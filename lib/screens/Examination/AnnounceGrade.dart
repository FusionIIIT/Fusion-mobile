import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';

class AnnounceGrade extends StatefulWidget {
  const AnnounceGrade({Key? key}) : super(key: key);

  @override
  State<AnnounceGrade> createState() => _AnnounceGradeState();
}

class _AnnounceGradeState extends State<AnnounceGrade> {
  String? _curriculumValue;
  String? _batchValue;
  String? _departmentValue;
  String? _semesterValue;
  bool isVerified = false;
  String? _programmeValue;
  TextEditingController messageController = TextEditingController();

  void _handleDropdownChange(String dropdownName, String? value) {
    setState(() {
      switch (dropdownName) {
        case 'Curriculum':
          _curriculumValue = value;
          break;
        case 'Batch':
          _batchValue = value;
          break;
        case 'Department':
          _departmentValue = value;
          break;
        case 'Semester':
          _semesterValue = value;
          break;
        case 'Programme':
          _programmeValue = value;
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
      case 'Curriculum':
        return _curriculumValue;
      case 'Batch':
        return _batchValue;
      case 'Department':
        return _departmentValue;
      case 'Semester':
        return _semesterValue;
      case 'Programme':
        return _programmeValue;
      default:
        return null;
    }
  }

  List<String> curriculumTypeItem = [
    'B Tech',
    'B Des',
    'M Tech',
    'M Des',
    'PHD',
  ];

  List<String> batchTypeItem = [
    '2020',
    '2021',
    '2022',
    '2023',
  ];

  List<String> departmentTypeItem = [
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

  @override
  void initState() {
    super.initState();
    _announceGrade();
  }

  void _announceGrade() async {
    ExaminationService examService = ExaminationService();
    
    bool allAuthenticated = await examService.checkAllAuthenticators(69, "2024");
    setState(() {
      isVerified = allAuthenticated;
    });
  }

  void _showAnnouncementResultDialog(bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Announced' : 'Not Announced'),
          content: success
              ? Text('Grade announced successfully.')
              : Text('Failed to announce grade.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (success) {
                  // Clear input fields after successful announcement
                  setState(() {
                    _curriculumValue = null;
                    _batchValue = null;
                    _departmentValue = null;
                    _semesterValue = null;
                    _programmeValue = null;
                    messageController.clear();
                  });
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Announce Grade").buildAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown('Batch', batchTypeItem),
            SizedBox(height: 20),

            _buildDropdown('Curriculum', curriculumTypeItem),
            SizedBox(height: 20),

            _buildDropdown('Department', departmentTypeItem),
            SizedBox(height: 20),

            Text(
              'Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
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
              buttonText: 'Announce',
              onPressed: () {
                // Simulating the announcement process with a delay
                
                Future.delayed(Duration(seconds: 2), () {
                  bool success = true; // Change to false if announcement fails
                  _showAnnouncementResultDialog(success);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
