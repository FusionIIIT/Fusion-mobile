import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Forward_Appraisal_Hod.dart';

class ApplyForAppraisal extends StatefulWidget {
  const ApplyForAppraisal();

  @override
  State<ApplyForAppraisal> createState() {
    return _ApplyForAppraisalState();
  }
}

class _ApplyForAppraisalState extends State<ApplyForAppraisal> {
  List<Map<String, TextEditingController>> _courseRows = [];
  List<Map<String, TextEditingController>> _projectRows = [];

  void submitForm() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForwardAppraisalHod()));
  }

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
                _buildTextInputField('Name'),
                _buildTextInputField('Designation'),
                _buildTextInputField('Discipline'),
                _buildTextInputField('Specific field of Knowledge'),
                _buildTextInputField('Current research interests'),
                _buildSectionTitle('Courses Taught at UG/PG Level'),
                _buildCourseTable(),
                _buildSectionTitle('Sponsored Research Projects'),
                _buildProjectTable(),
                _buildSectionTitle('Comments on Performance'),
                _buildTextInputField(
                    'Your comments on your performance so far and this academic year particularly'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    submitForm();
                    // Respond to button press
                  },
                  child: const Text('Submit'),
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

  Widget _buildTextInputField(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        return 'Demo...';
      },
    );
  }

  Widget _buildTextInputFieldTable(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(8),
      ),
      validator: (value) {
        return 'Demo...';
      },
    );
  }

  Widget _buildCourseTable() {
    return Column(
      children: [
        for (int i = 0; i < _courseRows.length; i++) ..._buildCourseRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _courseRows.add({
                'semester': TextEditingController(),
                'courseNumber': TextEditingController(),
                'lecturesHrsPerWeek': TextEditingController(),
                'studentsRegistered': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildCourseRow(int index) {
    return [
      Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Semester'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Course\nNumber'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Lectures\nHrs/week'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Number of\nstudents\nregistered'),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _courseRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  Widget _buildProjectTable() {
    return Column(
      children: [
        for (int i = 0; i < _projectRows.length; i++) ..._buildProjectRow(i),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _projectRows.add({
                'title': TextEditingController(),
                'sponsoringAgency': TextEditingController(),
                'projectFunding': TextEditingController(),
                'projectDuration': TextEditingController(),
              });
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildProjectRow(int index) {
    return [
      Row(
        children: [
          Text('${index + 1}.'),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Title of\nproject'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Sponsoring\nAgency'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Project\nFunding'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildTextInputFieldTable('Project\nDuration'),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _projectRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }
}
