import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/screens/LoginandDashboard/dashboard.dart';
import 'package:fusion/services/help.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fusion/services/newsessioncreate.dart';
import 'package:fusion/services/viewclubdetails.dart';

class NewSessionPage extends StatefulWidget {
  @override
  _NewSessionPageState createState() => _NewSessionPageState();
}

class _NewSessionPageState extends State<NewSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final _venueController = TextEditingController();
  final _detailsController = TextEditingController();

  String? _selectedVenue;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  File? _file;
  String selectedFiles = '';
  String? selectedClub;
  late String yy = "";
  List<String> clubNames = [];
  List<String> venues = ['CR101', 'CR102', 'L101', 'L102'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String formattedDate =
          "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}";
      String formattedStartTime = "${_startTime.hour}:${_startTime.minute}";
      String formattedEndTime = "${_endTime.hour}:${_endTime.minute}";

      NewSessionCreate sessionCreator = NewSessionCreate();

      sessionCreator
          .createNewSession(
        clubName: selectedClub!,
        venue: _selectedVenue!,
        date: formattedDate,
        startTime: formattedStartTime,
        endTime: formattedEndTime,
        details: _detailsController.text,
      )
          .then((_) {
        // Show success SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Session created successfully'),
            backgroundColor: Colors.green,
          ),
        );
        // Optionally, you can reset the form after successful submission
        _formKey.currentState!.reset();
      }).catchError((error) {
        // Show error SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $error'),
            backgroundColor: Colors.red,
          ),
        );
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
  void initState() {
    super.initState();
    _initializeClubName();
    // fetchClubNames();
  }

  Future<void> _initializeClubName() async {
    yy = await DataFetcher().getClub(context);
    print(yy);
    clubNames = [yy];
    setState(() {}); // Update the UI after getting the club name
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
                    labelText: 'Club Name',
                    border: InputBorder.none,
                  ),
                  value: selectedClub,
                  onChanged: (value) {
                    setState(() {
                      selectedClub = value;
                    });
                  },
                  items:
                      clubNames.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a club name';
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
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Venue',
                    border: InputBorder.none,
                  ),
                  value: _selectedVenue,
                  onChanged: (value) {
                    setState(() {
                      _selectedVenue = value;
                    });
                    if (value == 'Other') {
                      _showVenueDialog(context);
                    }
                  },
                  items: venues.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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

  Future<void> _showVenueDialog(BuildContext context) async {
    TextEditingController customVenueController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Custom Venue'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: customVenueController,
                  decoration: InputDecoration(
                    hintText: 'Custom Venue',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new venue';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _selectedVenue = customVenueController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void main() {
    runApp(MaterialApp(
      home: NewSessionPage(),
    ));
  }
}
