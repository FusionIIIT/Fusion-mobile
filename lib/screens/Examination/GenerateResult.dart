import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import './TranscriptScreen.dart';

class GenerateResult extends StatefulWidget {
  const GenerateResult({Key? key}) : super(key: key);

  @override
  State<GenerateResult> createState() => _GenerateResultState();
}

class _GenerateResultState extends State<GenerateResult> {
  String? _curriculumValue;
  String? _batchValue;
  String? _branchValue;
  String? _semesterValue;
  String? _programmeValue; // Added
  String? _specializationValue;
  bool isVerified = false;

  List<dynamic> _registeredStudents = [];
  final int _displayLimit = 10;
  String? _selectedStudentId;

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
      case 'Curriculum':
        return _curriculumValue;
      case 'Batch':
        return _batchValue;
      case 'Branch':
        return _branchValue;
      case 'Semester':
        return _semesterValue;
      case 'Programme': // Added
        return _programmeValue; // Added
      case 'Specialization': // Added
        return _specializationValue;
      default:
        return null;
    }
  }

  List<String> curriculumTypeItem = [
    'B.Tech',
    'B.Des',
    'M.Tech',
    'M.Des',
    'PHD',
  ];

  List<String> batchTypeItem = [ '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

  List<String> branchTypeItem = [
    'CSE',
    'ECE',
    'ME',
    'SM',
    'DS',
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

  final Random _random = Random();
  String _getGrade() {
    List<String> grades = ['A', 'B', 'C', 'D', 'E', 'F', 'O'];
    return grades[_random.nextInt(grades.length)];
  }

  void _downloadTranscript(List<String> courseIds, List<String> grades) async {
    // Get the directory for the app's documents
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;

    // Create a new file in the documents directory
    File transcriptFile = File('$appDocumentsPath/transcript.txt');

    // Write transcript data to the file
    String transcriptContent = '';
    for (int i = 0; i < courseIds.length; i++) {
      transcriptContent += 'Course ID: ${courseIds[i]}, Grade: ${grades[i]}\n';
    }
    await transcriptFile.writeAsString(transcriptContent);

    // Show a confirmation message
    print('Transcript downloaded successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Generate Result").buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown('Batch', batchTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Programme', curriculumTypeItem),
              SizedBox(height: 20),
              _buildDropdown('Specialization', branchTypeItem),
              SizedBox(height: 20),

              createButton(
                buttonText: 'Search',
                onPressed: () async {
                  try {
                    // Call the generateTranscriptForm API
                    print('Programme: $_programmeValue');
                    print('Batch: $_batchValue');
                    print('Specialization: $_specializationValue');
                    ExaminationService examService = ExaminationService();
                    List<Map<String, dynamic>> generatedData =
                        await examService.generateTranscriptForm(
                            _programmeValue!,
                            int.parse(_batchValue!),
                            _specializationValue!);

                    // Update the UI with the generated transcript form data
                    setState(() {
                      _registeredStudents = generatedData;
                      // Update any other UI elements as needed
                    });

                    // Print the generated data for debugging
                    print('Generated data: $generatedData');
                    // Success message
                    print('Transcript form generated successfully!');
                  } catch (e) {
                    // Handle API call errors
                    print('Error generating transcript form: $e');
                  }
                },
                showSearchIcon: true,
              ),

              SizedBox(height: 20),

              Text(
                'Registered Students',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // Dropdown to see all _registeredStudents after it is set
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedStudentId,
                hint: Text('Select Student'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedStudentId = value;
                  });
                },
                items: _registeredStudents
                    .map<DropdownMenuItem<String>>((student) {
                  return DropdownMenuItem<String>(
                    value: student['pk'].toString(),
                    child: Text(student['pk'].toString()),
                  );
                }).toList(),
              ),

              SizedBox(height: 20),

              _buildDropdown('Semester', semesterTypeItem),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: isVerified
                    ? Text("Result is verified")
                    : Text("Result is not yet verified"),
              ),
              SizedBox(height: 20),

              createButton(
                buttonText: 'Generate',
                onPressed: () async {
                  try {
                    // Call the API to generate transcript data
                    ExaminationService examService = ExaminationService();
                    Map<String, dynamic> transcriptData =
                        await examService.generateTranscript(
                            _selectedStudentId!, _semesterValue!);

                    // Extract the list of maps containing course data
                    List<Map<String, dynamic>> coursesData =
                        List<Map<String, dynamic>>.from(
                            transcriptData['transcript'] ?? []);

                    // Extract additional student information with default values if null
                    String studentRollNo =
                        transcriptData['student_roll_no'] ?? _selectedStudentId;
                    String semester =
                        transcriptData['semester'] ?? _semesterValue;
                    String spi = transcriptData['spi'] ?? 'N/A';
                    String cpi = coursesData.isNotEmpty
                        ? coursesData[0]['cpi'].toString()
                        : 'N/A';

                    // Navigate to a new screen to display the transcript
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TranscriptScreen(
                          coursesData: coursesData,
                          studentRollNo: studentRollNo,
                          semester: semester,
                          // spi: spi,
                          cpi: cpi,
                        ),
                      ),
                    );
                  } catch (e) {
                    // Handle any errors that occur during the API call
                    print('Error generating transcript: $e');
                    // You can show an error message here
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
