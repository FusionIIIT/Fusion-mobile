import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/create_club.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/newclubmember.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class NewClubRequest extends StatefulWidget {
  @override
  _NewClubRequestState createState() => _NewClubRequestState();
}

class _NewClubRequestState extends State<NewClubRequest> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  String? _selectedCategory;
  late TextEditingController _clubNameController;
  late TextEditingController _coordinatorController;
  late TextEditingController _coCoordinatorController;
  late TextEditingController _facultyInchargeController;
  late TextEditingController _descriptionController;
  DateTime _headChangedOn = DateTime.now();
  DateTime _createdOn = DateTime.now();
  late String _status;
  String _clubFile = '';
  final _formKey = GlobalKey<FormState>();

  final CreateClubService _createClubService = CreateClubService();

  @override
  void initState() {
    super.initState();
    _clubNameController = TextEditingController();
    _coordinatorController = TextEditingController();
    _coCoordinatorController = TextEditingController();
    _facultyInchargeController = TextEditingController();
    _descriptionController = TextEditingController();
    _headChangedOn = DateTime.now(); // Set default value to '2024-04-21'
    _createdOn = DateTime.now(); // Set default value to '2024-04-21'
    _status = 'open';
  }

  @override
  void dispose() {
    _clubNameController.dispose();
    _coordinatorController.dispose();
    _coCoordinatorController.dispose();
    _facultyInchargeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        print(
            'Head Changed On Date: ${_headChangedOn.toIso8601String().substring(0, 10)}');
        print(
            'Created On Date: ${_createdOn.toIso8601String().substring(0, 10)}');
        String formattedDate =
            "${_headChangedOn.year}-${_headChangedOn.month.toString().padLeft(2, '0')}-${_headChangedOn.day.toString().padLeft(2, '0')}";

        String formattedDate2 =
            "${_createdOn.year}-${_createdOn.month.toString().padLeft(2, '0')}-${_createdOn.day.toString().padLeft(2, '0')}";

        await _createClubService.createClub(
          clubName: _clubNameController.text,
          category: _selectedCategory!,
          coordinator: _coordinatorController.text,
          coCoordinator: _coCoordinatorController.text,
          facultyIncharge: _facultyInchargeController.text,
          clubFile: _clubFile,
          description: _descriptionController.text,
          status: _status,
          headChangedOn: formattedDate, // Format date as 'YYYY-MM-DD'
          createdOn: formattedDate2, // Format date as 'YYYY-MM-DD'
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('New Club request sent successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create club: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    try {
      await NewClubMember().createNewClubMember(
        member: _coordinatorController.text,
        club: _clubNameController.text,
        description: "co-ordinator",
        status: "confirmed",
        remarks: "co-ordinator",
      );
      print(true); // Submission successful
    } catch (e) {
      print('Error submitting form: $e');
      print(false); // Submission failed
    }
    try {
      await NewClubMember().createNewClubMember(
        member: _coCoordinatorController.text,
        club: _clubNameController.text,
        description: "co-coordinator",
        status: "confirmed",
        remarks: "co-coordinator",
      );
      print(true); // Submission successful
    } catch (e) {
      print('Error submitting form: $e');
      print(false); // Submission failed
    }
  }

  String? formvalidate(value) {
    if (value.isEmpty) {
      return "Error";
    } else {
      return null;
    }
  }

  Future<File?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _headChangedOn,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _headChangedOn = picked;
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _createdOn,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _createdOn = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: 'New Club Request', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _clubNameController,
                decoration: InputDecoration(
                  labelText: 'Club Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a club name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                hint: Text('Select Category'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: <String>['Cultural', 'Technical', 'Sports']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _coordinatorController,
                decoration: InputDecoration(
                  labelText: 'Coordinator (in Capital)',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter coordinator name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _coCoordinatorController,
                decoration: InputDecoration(
                  labelText: 'Co-Coordinator (in Capital)',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter co-coordinator name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _facultyInchargeController,
                decoration: InputDecoration(
                  labelText: 'Faculty Incharge',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter faculty incharge name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  File? pickedFile = await _pickFile();
                  if (pickedFile != null) {
                    setState(() {
                      _clubFile = pickedFile.path;
                    });
                  }
                },
                child: Text(
                    'Select Club File: ${_clubFile.isNotEmpty ? _clubFile : "No file selected"}'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
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
    title: 'New Club Request',
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      accentColor: Colors.deepOrangeAccent,
    ),
    home: NewClubRequest(),
  ));
}
