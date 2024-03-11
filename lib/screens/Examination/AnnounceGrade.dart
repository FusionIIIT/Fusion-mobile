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
  String? _branchValue;
  String? _semesterValue;
  bool isVerified = false;

  void _handleDropdownChange(String dropdownName, String? value) {
    setState(() {
      switch (dropdownName) {
        case 'Curriculum':
          _curriculumValue = value;
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

  String? _getValueByName(String name) {
    switch (name) {
      case 'Curriculum':
        return _curriculumValue;
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
  void initState() {
    super.initState();
    _announceGrade(); 
  }

  void _announceGrade() async {
    ExaminationService examService = ExaminationService();
    bool allAuthenticated = await examService.checkAllAuthenticators(69, 2024);
    setState(() {
      isVerified = allAuthenticated;
    });
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
            _buildDropdown('Curriculum', curriculumTypeItem),
            SizedBox(height: 20),

            _buildDropdown('Batch', batchTypeItem),
            SizedBox(height: 20),

            _buildDropdown('Branch', branchTypeItem),
            SizedBox(height: 20),

            _buildDropdown('Semester', semesterTypeItem),
            SizedBox(height: 20),
            

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: isVerified
                  ? Text("Result is verified")
                  : Text("Result is not yet verified"),
            ),

            SizedBox(height: 20),
            createButton(buttonText: 'Announce', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
