import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:fusion/services/updatesession.dart';

class EditRequestForm extends StatefulWidget {
  final int sessionId;
  final String oldVenue;
  final List<String> venueOptions;
  final selectedDate;
  final TimeOfDay oldStartTime;
  final TimeOfDay oldEndTime;
  final String details;


  EditRequestForm({
    required this.sessionId,
    required this.oldVenue,
    required this.venueOptions,
    required this.selectedDate,
    required this.oldStartTime,
    required this.oldEndTime,
    required this.details,

  });

  @override
  _EditRequestFormState createState() => _EditRequestFormState();
}

class _EditRequestFormState extends State<EditRequestForm> {
  late String _selectedVenue;
  late DateTime _selectedDate;
  late TimeOfDay _selectedStartTime;
  late TimeOfDay _selectedEndTime;
  late String _posterPath;
  late String _details;
  

  @override
  void initState() {
    super.initState();
    _selectedVenue = widget.oldVenue;
    _selectedDate = widget.selectedDate;
    _selectedStartTime = widget.oldStartTime;
    _selectedEndTime = widget.oldEndTime;
    _posterPath = '';
    _details = widget.details;
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

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedStartTime,
    );
    if (picked != null && picked != _selectedStartTime)
      setState(() {
        _selectedStartTime = picked;
      });
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
    );
    if (picked != null && picked != _selectedEndTime)
      setState(() {
        _selectedEndTime = picked;
      });
  }

  // Future<void> _selectPoster() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
  //   );

  //   if (result != null && result.files.isNotEmpty) {
  //     setState(() {
  //       _posterPath = result.files.single.path!;
  //     });
  //   }
  // }

  String _fileName = '';
  bool _fileChosen = false;

  Future<void> _selectPoster() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'png'],
    );

    if (resultFile != null) {
      setState(() {
        // _filePath = result.files.single.path!;
        _fileChosen = true;
        PlatformFile file = resultFile.files.first;
        _fileChosen = true;
        _fileName = file.name;
        print(_fileName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Session Request',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venue',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      value: _selectedVenue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedVenue = newValue!;
                        });
                      },
                      items: widget.venueOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select Date'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrangeAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Start Time',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(_selectedStartTime.format(context)),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _selectStartTime(context),
                                child: Text('Select Start Time'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrangeAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New End Time',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(_selectedEndTime.format(context)),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _selectEndTime(context),
                                child: Text('Select End Time'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectPoster,
                child: Text('Select Poster (if any)'),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _details = value;
                    });
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Details and Description',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call the function to update session details
                  print(widget.sessionId);
                  print(_selectedDate);
                  print(_selectedStartTime);
                  print(_selectedEndTime);
                  UpdateSessionService()
                      .updateSession(
                    id: widget.sessionId,
                    venue: _selectedVenue,
                    date: _selectedDate,
                    startTime: _selectedStartTime,
                    endTime: _selectedEndTime,
                    details: _details,
                   
                  )
                      .then((_) {
                    // Show a success message or navigate to another screen upon successful update
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Session updated successfully')),
                    );
                    // You can navigate back to the previous screen if needed
                    Navigator.pop(context);
                  }).catchError((error) {
                    // Handle any errors that occur during the update process
                    print('Error updating session: $error');
                    // Show an error message to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update session')),
                    );
                  });
                },
                child: Text('Update Session'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
