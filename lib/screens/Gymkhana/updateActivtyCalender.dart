// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class UpdateActivityCalendarPage extends StatefulWidget {
//   @override
//   _UpdateActivityCalendarPageState createState() =>
//       _UpdateActivityCalendarPageState();
// }

// class _UpdateActivityCalendarPageState
//     extends State<UpdateActivityCalendarPage> {
//   String _selectedClub = 'Club 1';
//   String _filePath = 'No file chosen';

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   Future<void> _openFileExplorer() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc', 'png'],
//     );

//     if (result != null) {
//       setState(() {
//         _filePath = result.files.single.path!;
//       });
//     }
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Perform submission logic here
//       print('Selected Club: $_selectedClub');
//       print('File Path: $_filePath');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Update Activity Calendar',
//           style: TextStyle(color: Colors.deepOrangeAccent),
//         ),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Club:',
//                 style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
//               ),
//               DropdownButton<String>(
//                 value: _selectedClub,
//                 items: <String>['Club 1', 'Club 2', 'Club 3', 'Club 4']
//                     .map<DropdownMenuItem<String>>(
//                       (String value) => DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     )
//                     .toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedClub = newValue!;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Activity Calendar',
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 8, 8, 8), fontSize: 20.0),
//                   ),
//                   SizedBox(width: 20.0),
//                   ElevatedButton.icon(
//                     onPressed: _openFileExplorer,
//                     icon: Icon(Icons.attach_file),
//                     label: Text('Choose File'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 '$_filePath',
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.orange,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: UpdateActivityCalendarPage(),
//     theme: ThemeData(
//       primaryColor: Colors.black,
//       accentColor: Colors.orange,
//     ),
//   ));
// }


import 'package:fusion/services/viewclubdetails.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityCalendar extends StatefulWidget {
  @override
  _ActivityCalendarState createState() => _ActivityCalendarState();
}

class _ActivityCalendarState extends State<ActivityCalendar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedClub = '';
  String _fileName = '';
  bool _fileChosen = false;
  List<String> _clubNames = [];

  Future<void> fetchClubNames() async {
  try {
    final List<dynamic> response = await ViewClubDetails().getClubDetails();
    print('Response from API: $response'); // Add this line to check the response
    setState(() {
      _clubNames = response.map((club) => club['club_name'] as String).toList();
      _selectedClub = _clubNames.isNotEmpty ? _clubNames.first : '';
    });
  } catch (e) {
    print('Error fetching club names: $e'); // Add this line to check for errors
  }
}


  Future<void> _openFileExplorer() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'png'],
    );

    if (resultFile != null) {
      setState(() {
        PlatformFile file = resultFile.files.first;
        _fileChosen = true;
        _fileName = file.name;
        print(_fileName);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchClubNames();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Update Activity Calendar',
        style: TextStyle(color: Colors.deepOrangeAccent),
      ),
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
    ),
    body: Container(
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder(
        future: fetchClubNames(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedClub,
                      items: _clubNames.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedClub = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: Text(
                      'Activity Calendar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  // Rest of your UI code
                ],
              ),
            );
          }
        },
      ),
    ),
  );
}

}

void main() {
  runApp(MaterialApp(
    home: ActivityCalendar(),
    theme: ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.deepOrangeAccent,
    ),
  ));
}


