import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Request_list.dart';

class ForwardAppraisalDirector extends StatefulWidget {
  @override
  _ForwardAppraisalDirectorState createState() =>
      _ForwardAppraisalDirectorState();
}

class _ForwardAppraisalDirectorState extends State<ForwardAppraisalDirector> {
  // Prefilled data for the fields
  void submitForm() {
    // Respond to button press
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RequestListPage()));
  }

  final Map<String, String> prefilledData = {
    'Name': 'John Doe',
    'Designation': 'Assistant Professor',
    'Discipline': 'Computer Science',
    'Specific field of Knowledge': 'Machine Learning',
    'Current research interests': 'Natural Language Processing',
    'Comments by HOD': 'Good performance so far.',
    // 'Comments by Director': 'Awaiting director\'s comments...',
  };

  // Prefilled data for Courses Taught at UG/PG Level
  final List<Map<String, String>> prefilledCourses = [
    {
      'semester': 'Fall 2023',
      'courseNumber': 'CS101',
      'lecturesHrsPerWeek': '3',
      'studentsRegistered': '50',
    },
    {
      'semester': 'Spring 2024',
      'courseNumber': 'CS202',
      'lecturesHrsPerWeek': '2',
      'studentsRegistered': '40',
    },
  ];

  // Prefilled data for Sponsored Research Projects
  final List<Map<String, String>> prefilledProjects = [
    {
      'title': 'Project A',
      'sponsoringAgency': 'XYZ Foundation',
      'projectFunding': '50000',
      'projectDuration': '12 months',
    },
    {
      'title': 'Project B',
      'sponsoringAgency': 'ABC Corporation',
      'projectFunding': '75000',
      'projectDuration': '18 months',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Personal Information'),
                ..._buildPrefilledFields(),
                _buildSectionTitle('Courses Taught at UG/PG Level'),
                ..._buildCourseRows(),
                _buildSectionTitle('Sponsored Research Projects'),
                ..._buildProjectRows(),
                // _buildSectionTitle('Comments by HOD'),
                // _buildSectionTitle('Comments by Director'),
                _buildTextInputField('Comments by Director'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        submitForm();
                        // Respond to approve button press
                      },
                      child: const Text('Approve'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Respond to decline button press
                      },
                      child: const Text('Decline'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _buildPrefilledFields() {
    return prefilledData.entries.map((entry) {
      return _buildTextInputField(entry.key, initialValue: entry.value);
    }).toList();
  }

  List<Widget> _buildCourseRows() {
    return prefilledCourses.map((course) {
      return _buildCourseRow(course);
    }).toList();
  }

  Widget _buildCourseRow(Map<String, String> course) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(child: _buildPrefilledField(course['semester']!)),
            SizedBox(width: 10),
            Expanded(child: _buildPrefilledField(course['courseNumber']!)),
            SizedBox(width: 10),
            Expanded(
              child: _buildPrefilledField(course['lecturesHrsPerWeek']!),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildPrefilledField(course['studentsRegistered']!),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildProjectRows() {
    return prefilledProjects.map((project) {
      return _buildProjectRow(project);
    }).toList();
  }

  Widget _buildProjectRow(Map<String, String> project) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(child: _buildPrefilledField(project['title']!)),
            SizedBox(width: 10),
            Expanded(
              child: _buildPrefilledField(project['sponsoringAgency']!),
            ),
            SizedBox(width: 10),
            Expanded(child: _buildPrefilledField(project['projectFunding']!)),
            SizedBox(width: 10),
            Expanded(
              child: _buildPrefilledField(project['projectDuration']!),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPrefilledField(String value) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }

  Widget _buildTextInputField(String labelText, {String initialValue = ''}) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        return 'Demo...';
      },
    );
  }
}
