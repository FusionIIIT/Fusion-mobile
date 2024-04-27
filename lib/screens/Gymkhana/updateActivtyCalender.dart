import 'package:fusion/services/viewclubdetails.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class ActivityCalendar extends StatefulWidget {
  @override
  _ActivityCalendarState createState() => _ActivityCalendarState();
}

class _ActivityCalendarState extends State<ActivityCalendar> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

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
   
     appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'Update Activity Calender', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
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





