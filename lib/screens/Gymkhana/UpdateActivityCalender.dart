
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/viewclubdetails.dart';

import '../../services/help.dart';
import '../LoginandDashboard/dashboard.dart'; // Import your service file
import 'package:fusion/services/update_activity_calender.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';



class ActivityCalendar extends StatefulWidget {
  @override
  _ActivityCalendarState createState() => _ActivityCalendarState();
}

class _ActivityCalendarState extends State<ActivityCalendar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedClub = ''; // Initially empty
  String _fileName = '';
  bool _fileChosen = false;
  List<String> _clubs = []; // Empty list initially
  final ViewClubDetails _clubDetailsService =
      ViewClubDetails(); // Instance of club details service
  final UpdateActivityCalendarService _activityCalendarService =
      UpdateActivityCalendarService(); // Initialize the service // Instance of club details service
      http.MultipartFile? _file;
  late String xx = "";
  @override
  void initState() {
    super.initState();
    _fetchClubs();
  }

  Future<void> _fetchClubs() async {
    xx = await DataFetcher().getClub(context);
    print(xx);
    setState(() {});
    try {
      List<dynamic> clubDetails = await _clubDetailsService.getClubDetails();
      List<String> fetchedClubs =
          clubDetails.map((club) => club['club_name'] as String).toList();
      List<String> pp = [];
      for (var it in fetchedClubs) {
        //rprint(it + " ");
        print(xx + " ");
        if (it == xx) pp.add(it);
      }
      fetchedClubs = pp;
      setState(() {
        _clubs = fetchedClubs.isNotEmpty ? fetchedClubs : ['No Clubs Found'];
        if (_clubs.isNotEmpty) {
          _selectedClub =
              _clubs[0]; // Set the selected club to the first club fetched
        }
      });
    } catch (e) {
      print('Error fetching clubs: $e');
      setState(() {
        _clubs = ['Error Fetching Clubs'];
      });
    }
  }

   Future<void> _openFileExplorer() async {
  FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'png'],
  );

  if (resultFile != null) {
    setState(() {
      _fileChosen = true;
      PlatformFile file = resultFile.files.first;
      _fileName = file.name;
      
      // Read file bytes
      List<int>? fileBytes = file.bytes;
      
      if (fileBytes != null) {
        // Create http.MultipartFile object
        _file = http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: _fileName,
          contentType: MediaType.parse('application/octet-stream'),
        );
      }
    });
  }
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
                child: DropdownButtonFormField<String>(
                  value: _selectedClub,
                  items: _clubs.map((String value) {
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
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20.0),
                  ElevatedButton.icon(
                    onPressed: _openFileExplorer,
                    icon: Icon(Icons.attach_file),
                    label: Text(
                      'Choose File',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                    ),
                  ),
                  Text(_fileName.isEmpty ? 'No file selected' : _fileName),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      // Call the service method to update the activity calendar
                      await _activityCalendarService.updateActivityCalendar(
                        clubName: _selectedClub,
                        activityCalendar: _file!,
                      );
                      // Notify the user about the success
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Activity calendar updated successfully'),
                        ),
                      );
                    } catch (e) {
                      // Handle any errors that occur during the update process
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Failed to update activity calendar: $e'),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
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
    home: ActivityCalendar(),
    theme: ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.deepOrangeAccent,
    ),
  ));
}
