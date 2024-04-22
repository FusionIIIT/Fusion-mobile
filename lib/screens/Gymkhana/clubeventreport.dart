import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';


class ClubEventReportPage extends StatefulWidget {
  @override
  _ClubEventReportPageState createState() => _ClubEventReportPageState();
}

class _ClubEventReportPageState extends State<ClubEventReportPage> {
  String _club = '';
  String _eventName = '';
  String _studentInCharge = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _description = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Event Report', style: TextStyle(color: Colors.deepOrangeAccent)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Club',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter club name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _club = value ?? '';
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _eventName = value ?? '';
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Student In Charge',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student in charge';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _studentInCharge = value ?? '';
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                          ),
                        ),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(_selectedDate),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                          ),
                        ),
                        child: Text(
                          _selectedTime.format(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
  onPressed: () async {
    // Open file picker
    final result = await FilePicker.platform.pickFiles();

    // Check if a file is picked
    if (result != null) {
      // Get the file
      final file = result.files.single;

      // Do something with the picked file
      print('File picked: ${file.name}');
    } else {
      // User canceled the picker
      print('File picking canceled.');
    }
  },
  child: Text(
    'Report',
    style: TextStyle(color: Colors.black),
  ),
  style: ElevatedButton.styleFrom(
    primary: Colors.deepOrangeAccent,
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  ),
),

              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Details & Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter details & description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _description = value ?? '';
                  });
                },
                maxLines: null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit form logic goes here
                    // You can access form fields using _club, _eventName, _studentInCharge, _selectedDate, _selectedTime, and _description variables
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null)
      setState(() {
        _selectedTime = picked;
      });
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Club Event Report Page',
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      accentColor: Colors.deepOrangeAccent,
    ),
    home: ClubEventReportPage(),
  ));
}