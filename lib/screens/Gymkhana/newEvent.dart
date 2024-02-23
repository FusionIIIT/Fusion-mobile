//-----------------------this code has slecet poster button, without backend integration------------------

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:file_picker/file_picker.dart';

// class NewEventPage extends StatefulWidget {
//   @override
//   _NewEventPageState createState() => _NewEventPageState();
// }

// class _NewEventPageState extends State<NewEventPage> {
//   String _eventName = '';
//   String _inCharge = '';
//   String _selectedFileName = '';
//   String _venue = 'Venue 1';
//   DateTime _selectedDate = DateTime.now();
//   TimeOfDay _startTime = TimeOfDay.now();
//   TimeOfDay _endTime = TimeOfDay.now();
//   String _description = '';
//   String _posterPath = '';
//   bool _fileChosen = false;
//   final _formKey = GlobalKey<FormState>();
//   List<String> _venues = ['Venue 1', 'Venue 2', 'Venue 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'New Event',
//           style: TextStyle(color: Colors.deepOrangeAccent),
//         ),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               _buildTextField('Event Name', _eventName),
//               SizedBox(height: 20.0), // Increased space between components
//               _buildTextField('In Charge', _inCharge),
//               SizedBox(height: 20.0), // Increased space between components
//               _buildDropdown('Venue', _venue),
//               SizedBox(height: 20.0), // Increased space between components
//               _buildDateTimeRow(
//                   'Date',
//                   DateFormat('yyyy-MM-dd').format(_selectedDate),
//                   () => _selectDate(context)),
//               SizedBox(height: 20.0), // Increased space between components
//               _buildDateTimeRow('Start Time', _startTime.format(context),
//                   () => _selectTime(context, true)),
//               SizedBox(height: 20.0), // Increased space between components
//               _buildDateTimeRow('End Time', _endTime.format(context),
//                   () => _selectTime(context, false)),
//               SizedBox(height: 20.0), // Increased space between components
//               ElevatedButton(
//                 onPressed: _selectPoster,
//                 child: Text('Select Poster (if any)'),
//                 // child: Text(_posterPath.isEmpty ? 'No file selected' : _posterPath ?? 'No file selected'),
//               ),
//               Text(_selectedFileName.isEmpty ? 'No file selected' : _selectedFileName),
//               SizedBox(height: 20.0), // Increased space between components

//               _buildTextField('Description', _description, maxLines: 3),
//               SizedBox(height: 20.0), // Increased space between components
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String value, {int maxLines = 1}) {
//     return TextFormField(
//       style: TextStyle(color: Colors.black),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.black),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.deepOrangeAccent,
//                 width: 2.0)), // Increased border width
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.deepOrangeAccent,
//                 width: 2.0)), // Increased border width
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter the $label';
//         }
//         return null;
//       },
//       onChanged: (value) {
//         setState(() {
//           if (label == 'Event Name') {
//             _eventName = value;
//           } else if (label == 'In Charge') {
//             _inCharge = value;
//           } else if (label == 'Description') {
//             _description = value;
//           }
//         });
//       },
//       maxLines: maxLines,
//     );
//   }

//   Widget _buildDropdown(String label, String value) {
//     return DropdownButtonFormField(
//       value: value,
//       items: _venues.map((String venue) {
//         return DropdownMenuItem(
//           value: venue,
//           child: Text(venue),
//         );
//       }).toList(),
//       onChanged: (value) {
//         setState(() {
//           _venue = value.toString();
//         });
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.black),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.deepOrangeAccent,
//                 width: 2.0)), // Increased border width
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.deepOrangeAccent,
//                 width: 2.0)), // Increased border width
//       ),
//     );
//   }

//   Widget _buildDateTimeRow(String label, String value, Function() onPressed) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextButton(
//             onPressed: onPressed,
//             child: Text(
//               '$label: $value',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       print('Event Name: $_eventName');
//       print('In Charge: $_inCharge');
//       print('Venue: $_venue');
//       print('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}');
//       print('Start Time: ${_startTime.format(context)}');
//       print('End Time: ${_endTime.format(context)}');
//       print('Description: $_description');
//       print('Poster Path: $_posterPath');
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _selectedDate)
//       setState(() {
//         _selectedDate = picked;
//       });
//   }

//   Future<void> _selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStartTime ? _startTime : _endTime,
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartTime) {
//           _startTime = picked;
//         } else {
//           _endTime = picked;
//         }
//       });
//     }
//   }

//   Future<void> _selectPoster() async {
//     FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
//     );
//     if (resultFile != null) {
//             setState(() {
//         // _posterPath = result.files.single.path!;
//         _fileChosen = true;
//          PlatformFile file = resultFile.files.first;
//       _fileChosen = true;
//       _selectedFileName = file.name;
//       print(_selectedFileName);
//       });

//     } else {
//       throw Exception('No files picked or file picker was canceled');
//     }
//   }

// // Inside your build method, where you want to display the selected file path

//   void main() {
//     runApp(MaterialApp(
//       title: 'New Event Page',
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         hintColor: Colors.deepOrangeAccent,
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: TextTheme(
//           bodyText1: TextStyle(color: Colors.black),
//           bodyText2: TextStyle(color: Colors.black),
//         ),
//       ),
//       home: NewEventPage(),
//     ));
//   }
// }






















import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/services/neweventcreate.dart'; // Import the NewEventCreate class
import 'package:http/http.dart' as http;

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  String _eventName = '';
  String _inCharge = '';
  String _selectedFileName = '';
  String _venue = 'CR101';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  String _description = '';
  final _formKey = GlobalKey<FormState>();
  List<String> _venues = ['CR101', 'CR102', 'L101', 'L102'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Event',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
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

  Widget _buildDropdown(String label, String value) {
    return DropdownButtonFormField(
      value: value,
      items: _venues.map((String venue) {
        return DropdownMenuItem(
          value: venue,
          child: Text(venue),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _venue = value.toString();
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

  Widget _buildDateTimeRow(String label, String value, Function() onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              '$label: $value',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Call the createNewEvent method from NewEventCreate class
      NewEventCreate().createNewEvent(
        eventName: _eventName,
        inCharge: _inCharge,
        date: DateFormat('yyyy-MM-dd').format(_selectedDate),
        venue: _venue,
        startTime: _startTime.format(context),
        endTime: _endTime.format(context),
        details: _description,
      ).then((_) {
        // Handle success if needed
      }).catchError((error) {
        // Handle error if needed
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
