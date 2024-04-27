import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:fusion/services/updateevent.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class EditRequestFormB extends StatefulWidget {
  final int eventID;
  final String oldVenue;
  final List<String> venueOptions;
  final DateTime selectedDate;
  final String inCharge;
  final String event;
  final String details;

  EditRequestFormB({
    required this.eventID,
    required this.oldVenue,
    required this.venueOptions,
    required this.selectedDate,
    required this.inCharge,
    required this.event,
    required this.details,
  });

  @override
  _EditRequestFormBState createState() => _EditRequestFormBState();
}

class _EditRequestFormBState extends State<EditRequestFormB> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  late String _selectedVenue;
  late DateTime _selectedDate;
  // late TimeOfDay _selectedStartTime;
  late String _inCharge;
  late String _posterPath;
  late String _event;
  late String _details;

  @override
  void initState() {
    super.initState();
    _selectedVenue = widget.oldVenue;
    _selectedDate = widget.selectedDate;
    //_selectedStartTime = widget.oldStartTime;
    _inCharge = widget.inCharge;
    _event = widget.event;
    _details = widget.details;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'Edit Event details', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
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
                            'Event',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            // controller: _eventController, // Add a controller for the text field
                            decoration: InputDecoration(
                              hintText: 'Enter Event', // Placeholder text
                              border: OutlineInputBorder(), // Add border
                            ),
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
                            'In Charge',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            // controller: _inChargeController, // Add a controller for the text field
                            decoration: InputDecoration(
                              hintText: 'Enter In Charge', // Placeholder text
                              border: OutlineInputBorder(), // Add border
                            ),
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
              // Text(_fileName.isEmpty ? 'No file selected' : _fileName),
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
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call the function to update session details
                  print(widget.eventID);
                  print(_selectedDate);
                  print(_selectedVenue);
                  print(_inCharge);
                  print(_details);
                  print(_event);

                  UpdateEventService()
                      .updateEvent(
                    id: widget.eventID,
                    venue: _selectedVenue,
                    date: _selectedDate,
                    details: _details,
                    eventName: _event,
                    incharge: _inCharge,
                  )
                      .then((_) {
                    // Show a success message or navigate to another screen upon successful update
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Event updated successfully')),
                    );
                    // You can navigate back to the previous screen if needed
                    Navigator.pop(context);
                  }).catchError((error) {
                    // Handle any errors that occur during the update process
                    print('Error updating event: $error');
                    // Show an error message to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update event')),
                    );
                  });
                },
                child: Text('Update Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
