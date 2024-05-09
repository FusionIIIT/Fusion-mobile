import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/services/neweventcreate.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart'; // Import the NewEventCreate class

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  String _eventName = '';
  String _inCharge = '';
  String _selectedFileName = '';
  String _venue = 'CR101';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  String _description = '';
  final _formKey = GlobalKey<FormState>();
  List<String> _venues = [
    'CR101',
    'CR102',
    'L101',
    'L102',
    
  ]; // Add 'Other' option to the dropdown list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
       appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'New Event', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Event Name', _eventName),
              SizedBox(height: 20.0),
              _buildTextField('In Charge', _inCharge),
              SizedBox(height: 20.0),
              _buildDropdown('Venue', _venue),
              SizedBox(height: 20.0),
              _buildDateTimeRow(
                  'Date',
                  DateFormat('yyyy-MM-dd').format(_selectedDate),
                  () => _selectDate(context)),
              SizedBox(height: 20.0),
              _buildDateTimeRow('Start Time', _startTime.format(context),
                  () => _selectTime(context, true)),
              SizedBox(height: 20.0),
              _buildDateTimeRow('End Time', _endTime.format(context),
                  () => _selectTime(context, false)),
              SizedBox(height: 20.0),
              _buildTextField('Description', _description, maxLines: 3),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
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

  Widget _buildTextField(String label, String value, {int maxLines = 1}) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $label';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          if (label == 'Event Name') {
            _eventName = value;
          } else if (label == 'In Charge') {
            _inCharge = value;
          } else if (label == 'Description') {
            _description = value;
          }
        });
      },
      maxLines: maxLines,
    );
  }

  Widget _buildDateTimeRow(String label, String value, Function() onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String value) {
    return DropdownButtonFormField(
      value: value,
      items: _venues.map((String venue) {
        return DropdownMenuItem(
          value: venue,
          child: Text(venue),
        );
      }).toList(),
      onChanged: (selectedVenue) {
        setState(() {
          _venue = selectedVenue.toString();
          if (_venue == 'Other') {
            _showOtherVenueDialog(); // Show dialog for custom venue input
          }
        });
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  void _showOtherVenueDialog() {
    String enteredValue = _venue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Other Venue'),
          content: Form(
            child: TextFormField(
              onSaved: (value) {
                enteredValue = value ?? '';
              },
              decoration: InputDecoration(
                hintText: 'Enter Venue',
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _venue = enteredValue.isNotEmpty ? enteredValue : 'Other';
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    NewEventCreate()
        .createNewEvent(
      eventName: _eventName,
      inCharge: _inCharge,
      date: DateFormat('yyyy-MM-dd').format(_selectedDate),
      venue: _venue,
      startTime: _startTime.format(context),
      endTime: _endTime.format(context),
      details: _description,
    )
        .then((_) {
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New Event created successfully'),
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
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    title: 'New Event Page',
    theme: ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.deepOrangeAccent,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    ),
    home: NewEventPage(),
  ));
}
