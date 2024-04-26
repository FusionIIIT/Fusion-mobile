import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';

class PlacementRecord extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<PlacementRecord> {
  final _formKey = GlobalKey<FormState>();
  String _rollNumber = "";
  String _studentName = "";
  String _placementType = "";
  double _cpi = 0;
  int _ctc = 0;
  int _year = 0;
  String _organizationName = "";
  final List<Map<String, dynamic>> _studentList = [];

  void _previewStudentDetails() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Student Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Roll Number: $_rollNumber'),
                Text('Student Name: $_studentName'),
                Text('Placement Type: $_placementType'),
                Text('CPI: $_cpi'),
                Text('CTC: $_ctc'),
                Text('Year: $_year'),
                Text('Organization Name: $_organizationName'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  _studentList.add({
                    'rollNumber': _rollNumber,
                    'studentName': _studentName,
                    'placementType': _placementType,
                    'CPI': _cpi,
                    'CTC': _ctc,
                    'year': _year,
                    'organizationName': _organizationName,
                  });
                  _formKey.currentState!.reset();
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Roll Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the roll number of the student';
                      }
                      return null;
                    },
                    onSaved: (value) => _rollNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Student Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the student name';
                      }
                      return null;
                    },
                    onSaved: (value) => _studentName = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Placement Type'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter whether its a job or higher studies or PBI';
                      }
                      return null;
                    },
                    onSaved: (value) => _placementType = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'CPI'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CPI';
                      }
                      if (double.tryParse(value) == null) {
                        return 'CTC must be a valid integer';
                      }
                      return null;
                    },
                    onSaved: (value) => _cpi = double.parse(value!),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'CTC'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CTC';
                      }
                      if (int.tryParse(value) == null) {
                        return 'CTC must be a valid integer';
                      }
                      return null;
                    },
                    onSaved: (value) => _ctc = int.parse(value!),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Year'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter year';
                      }
                      if (int.tryParse(value) == null) {
                        return 'CTC must be a valid integer';
                      }
                      return null;
                    },
                    onSaved: (value) => _year = int.parse(value!),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Organization Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter organization name';
                      }
                      return null;
                    },
                    onSaved: (value) => _organizationName = value!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _studentList.length,
                itemBuilder: (context, index) {
                  final student = _studentList[index];
                  return Dismissible(
                    key: Key(student['rollNumber']),
                    onDismissed: (direction) {
                      setState(() {
                        _studentList.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(student['studentName']),
                      subtitle: Text(student['rollNumber']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDetailsPage(
                              student: student,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _previewStudentDetails,
              child: Text('Preview'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _studentList.add({
              'rollNumber': _rollNumber,
              'studentName': _studentName,
              'placementType': _placementType,
              'CPI': _cpi,
              'CTC': _ctc,
              'year': _year,
              'organizationName': _organizationName,
            });
            _formKey.currentState!.reset();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class StudentDetailsPage extends StatelessWidget {
  final Map<String, dynamic> student;

  StudentDetailsPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student['rollNumber']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Placement Type: ${student['placementType']}'),
            SizedBox(height: 8),
            Text('Student Name: ${student['studentName']}'),
            SizedBox(height: 8),
            Text('CTC: ${student['ctc']}'),
            SizedBox(height: 8),
            Text('CPI: ${student['cpi']}'),
            SizedBox(height: 8),
            Text('Year: ${student['year']}'),
            SizedBox(height: 8),
            Text('Organization Name: ${student['organizationName']}'),
            SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
