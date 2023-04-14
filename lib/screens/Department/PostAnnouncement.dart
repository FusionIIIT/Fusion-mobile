import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/announcement_service.dart';

class PostAnnouncement extends StatefulWidget {
  @override
  _PostAnnouncementState createState() => _PostAnnouncementState();
}

class _PostAnnouncementState extends State<PostAnnouncement> {
  List<String> _programmeTypes = [
    'B.Tech',
    "B.Des",
    'M.Tech',
    'M.Des',
    'PhD',
  ];
  late String _selectedProgrammeType = _programmeTypes[0];

  List<String> _batches = ["2018", "2019", "2020", "2021", "2022"];
  late String _selectedBatch = _batches[0];

  List<String> _departments = ["CSE", "ME", "ECE", "SM", "DS"];
  late String _selectedDepartment = _departments[0];
  late AnnouncementService announcementService;
  String _announcementDetails = '';
  String? _uploadedFileUrl;
  @override
  void initState() {
    super.initState();
    // calling profile service to get user's data
    announcementService = AnnouncementService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Programme Type:'),
              DropdownButton<String>(
                value: _selectedProgrammeType,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedProgrammeType = newValue!;
                  });
                },
                items: _programmeTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Text('Batch:'),
              DropdownButton<String>(
                value: _selectedBatch,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBatch = newValue!;
                  });
                },
                items: _batches.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Text('Department:'),
              DropdownButton<String>(
                value: _selectedDepartment,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDepartment = newValue!;
                  });
                },
                items: _departments.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Text('Announcement Details:'),
              TextFormField(
                onChanged: (value) {
                  _announcementDetails = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter announcement details',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Upload File:'),
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    setState(() {
                      _uploadedFileUrl = result.files.single.path;
                    });
                  } else {
                    print("file not picked");
                  }
                },
                child: Text('Choose File'),
              ),
              SizedBox(height: 16.0),
              _uploadedFileUrl != null
                  ? Text('File uploaded successfully!')
                  : Container(),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _publishAnnouncement();
                },
                child: Text('Publish'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _publishAnnouncement() {
    announcementService.addNewAnnouncement(
        _selectedBatch,
        _selectedProgrammeType,
        _selectedDepartment,
        _announcementDetails,
        _uploadedFileUrl);
    // print("tried");
  }
}
