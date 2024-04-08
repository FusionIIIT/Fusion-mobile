import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/examination_service.dart';
import 'dart:math';

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

  List<String> batchTypeItem = [
    '2020',
    '2021',
    '2022',
    '2023',
  ];

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

  final Random _random = Random();
  String _getGrade() {
    List<String> grades = ['A', 'B', 'C', 'D', 'E', 'F', 'O'];
    return grades[_random.nextInt(grades.length)];
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
          await examService.generateTranscript(_selectedStudentId!);

      // Extract the list of maps containing course data
      List<Map<String, dynamic>> coursesData =
          List<Map<String, dynamic>>.from(transcriptData['courses_grades']);

      // Display the course_id_id from each map
      setState(() {
        // Assuming _transcriptData is a state variable to store the transcript data
        // Assign the received transcript data to the state variable
        // _transcriptData = coursesData;

        // Extract and display course_id_id
        List<int> courseIds = coursesData
            .map<int>((data) => data['course_id_id'] as int)
            .toList();

        // Display the courseIds in a table
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Course IDs'),
              content: SingleChildScrollView(
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(label: Text('Index')),
                    DataColumn(label: Text('Course ID')),
                    DataColumn(label: Text('Grade'))
                  ],
                  rows: courseIds
                      .asMap()
                      .entries
                      .map<DataRow>((entry) => DataRow(
                            cells: [
                              DataCell(Text(entry.key.toString())),
                              DataCell(Text(entry.value.toString())),
                              DataCell(Text(_getGrade()))
                            ],
                          ))
                      .toList(),
                ),
              ),
            );
          },
        );
      });
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error generating transcript: $e');
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
