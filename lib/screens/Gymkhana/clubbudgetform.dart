import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../services/help.dart';
import '../../services/viewclubdetails.dart'; // Import the service to fetch club details
import '../../services/clubbudgetservices.dart';
import '../LoginandDashboard/dashboard.dart';

class ClubBudgetForm extends StatefulWidget {
  @override
  _ClubBudgetFormState createState() => _ClubBudgetFormState();
}

class _ClubBudgetFormState extends State<ClubBudgetForm> {
  String _club = '';
  String _budgetFor = '';
  int _budgetAmount = 0; // Changed to integer type
  String _attachment = '';
  String _detailsDescription = '';
  String _status = 'open'; // Add status field with default value 'open'

  final _formKey = GlobalKey<FormState>();

  List<String> _clubsList = [];
  String? _selectedClub; // Selected club from dropdown
  late String xx = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchClubs(); // Fetch clubs when the widget initializes
  }

  Future<void> _fetchClubs() async {
    xx = await DataFetcher().getClub(context);
    print(xx);
    setState(() {});
    try {
      // Instantiate the service to fetch club details
      ViewClubDetails viewClubDetails = ViewClubDetails();
      // Fetch club details from backend
      List<dynamic> clubDetails = await viewClubDetails.getClubDetails();
      // Extract club names from club details and cast to String
      List<String> clubs =
          clubDetails.map((club) => club['club_name'] as String).toList();
      setState(() {
        print(xx);
        _clubsList = [xx];
        for (int i = 0; i < 1; i++) print(_clubsList[i]);
      });
    } catch (e) {
      print('Error fetching clubs: $e');
    }
  }

  // Widget to build the dropdown list
  Widget _buildClubDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedClub,
      decoration: InputDecoration(
        labelText: 'Club',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
      items: _clubsList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedClub = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a club';
        }
        return null;
      },
    );
  }

  // Widget for the budget for field
  Widget _buildBudgetForField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Budget For',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter budget for';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _budgetFor = value ?? '';
        });
      },
    );
  }

  // Widget for the budget amount field
  Widget _buildBudgetAmountField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Budget Amount',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter budget amount';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _budgetAmount = int.tryParse(value) ?? 0; // Parse to integer
        });
      },
      keyboardType: TextInputType.number,
    );
  }

  // Widget for the file selection button
  Widget _buildFileSelectionButton() {
    return ElevatedButton(
      onPressed: _selectFile,
      child: Text(
        'Select File',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrangeAccent,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
    );
  }

  // Widget for the details and description field
  Widget _buildDetailsDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Details & Description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter details & description';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _detailsDescription = value ?? '';
        });
      },
      maxLines: null,
    );
  }

  // Widget to show loading indicator or error message
  Widget _buildSubmitIndicator() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else {
      return ElevatedButton(
        onPressed: _submitForm,
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (_selectedClub == null) {
          throw Exception('Please select a club');
        }

        setState(() {
          _isLoading = true;
        });
        // Make a call to your ClubBudgetServices class to create a club budget
        await ClubBudgetServices().createClubBudget(
          club: _selectedClub!, // Use selected club instead of _club
          budgetFor: _budgetFor,
          budgetAmt: _budgetAmount, // Passing integer value directly
          budgetFile: _attachment,
          status: _status,
          description: _detailsDescription,
        );
        // Reset the form after successful submission
        _formKey.currentState!.reset();
        // Clear attachment field after successful submission
        setState(() {
          _attachment = '';
        });
        // Show confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Budget created successfully')),
        );
      } catch (e) {
        print('Error while submitting form: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _selectFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (resultFile != null) {
      setState(() {
        PlatformFile fileName = resultFile.files.first;
        _attachment = fileName.name;
      });

      // Show a SnackBar to notify the user that the file has been selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File $_attachment has been selected'),
        ),
      );
    } else {
      throw Exception('No files picked or file picker was canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Budget Form',
            style: TextStyle(color: Colors.deepOrangeAccent)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildClubDropdown(), // Dropdown widget for selecting club
              SizedBox(height: 20),
              _buildBudgetForField(), // Budget For field
              SizedBox(height: 20),
              _buildBudgetAmountField(), // Budget Amount field
              SizedBox(height: 20),
              _buildFileSelectionButton(), // File Selection button
              SizedBox(height: 20),
              _buildDetailsDescriptionField(), // Details & Description field
              SizedBox(height: 20),
              _buildSubmitIndicator(), // Widget to show loading indicator or submit button
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Club Budget Form',
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      accentColor: Colors.deepOrangeAccent,
    ),
    home: ClubBudgetForm(),
  ));
}
