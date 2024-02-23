









import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fusion/services/newsessioncreate.dart';

class NewSessionPage extends StatefulWidget {
  @override
  _NewSessionPageState createState() => _NewSessionPageState();
}

class _NewSessionPageState extends State<NewSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final _venueController = TextEditingController();
  final _detailsController = TextEditingController();

  String? _venue;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  File? _file;
  String selectedFiles = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Format date as YYYY-MM-DD
      String formattedDate =
          "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}";

      // Format start time as hh:mm:ss
      String formattedStartTime = "${_startTime.hour}:${_startTime.minute}";

      // Format end time as hh:mm:ss
      String formattedEndTime = "${_endTime.hour}:${_endTime.minute}";

      // Initialize NewSessionCreate class
      NewSessionCreate sessionCreator = NewSessionCreate();

      // Call the createNewSession method with formatted data
      sessionCreator.createNewSession(
        venue: _venue!,
        date: formattedDate,
        startTime: formattedStartTime,
        endTime: formattedEndTime,
        details: _detailsController.text,
      ).then((_) {
        // Handle success (optional)
        print('Session created successfully');
        // You can navigate to another page or show a success dialog here
      }).catchError((error) {
        // Handle error (optional)
        print('Failed to create session: $error');
        // You can show an error dialog here
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null)
      setState(() {
        _startTime = picked;
      });
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null)
      setState(() {
        _endTime = picked;
      });
  }

  Future<void> _selectFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (resultFile != null) {
      setState(() {
        PlatformFile fileName = resultFile.files.first;
        selectedFiles = fileName.name;
        print(selectedFiles);
      });
    } else {
      throw Exception('No files picked or file picker was canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Session',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Venue',
                    border: InputBorder.none,
                  ),
                  value: _venue,
                  onChanged: (value) {
                    setState(() {
                      _venue = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'CR101',
                      child: Text('CR101'),
                    ),
                    DropdownMenuItem(
                      value: 'CR102',
                      child: Text('CR102'),
                    ),
                    DropdownMenuItem(
                      value: 'L101',
                      child: Text('L101'),
                    ),
                    DropdownMenuItem(
                      value: 'L102',
                      child: Text('L102'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a venue';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Date:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Start Time:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectStartTime(context),
                      child: Text(
                        '${_startTime.hour}:${_startTime.minute}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'End Time:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectEndTime(context),
                      child: Text(
                        '${_endTime.hour}:${_endTime.minute}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // Text(selectedFiles.isEmpty ? 'No file selected' : selectedFiles),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                    labelText: 'Details & Description',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter details and description';
                    }
                    return null;
                  },
                  maxLines: null,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  onPrimary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewSessionPage(),
  ));
}
