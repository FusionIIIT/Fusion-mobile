import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import '../../Complaint/complaint.dart';
import '../View_File/view_inboxfile.dart';
import '../Forward_file/forward_file.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class InboxMessage {
  final String sender;
  final String subject;
  final String snippet;
  final DateTime timestamp;

  InboxMessage({
    required this.sender,
    required this.subject,
    required this.snippet,
    required this.timestamp,
  });
}

class InboxPage extends StatefulWidget {
  late var curr_desig=service.getFromDisk("Current_designation");
  final String username;
  InboxPage({required this.username});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final TextEditingController _designationController = TextEditingController();
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;
  String? _selectedDesignation;
  List<String> designations = []; // List to hold designations

  @override
  void initState() {
    super.initState();
    _getDesignations(); // Fetch designations on init
  }

  @override
  void dispose() {
    _designationController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    try {
      if (_selectedDesignation == null || _selectedDesignation!.isEmpty) {
        throw Exception('Designation required.');
      }

      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      // Prepare query parameters
      final queryParams = {
        'username': widget.username,
        'designation': _selectedDesignation ?? "",
        'src_module': 'filetracking',
      };

      // Construct URL with encoded query parameters
      final Uri url = Uri.http(kserverLink, '/filetracking/api/inbox/', queryParams);

      final client = http.Client();

      // Make GET request
      final response = await client.get(url, headers: headers);
      // Handle response
      if (response.statusCode == 200) {
        // Parse the JSON response
        jsonData = json.decode(response.body);
        // Extract file IDs
        List<String> fileIDs = jsonData.map((data) => data['id'].toString()).toList();

        // Update the UI with file IDs
        setState(() {
          fileIDsList = fileIDs;
          errorMessage=null;
        });
      } else {
        // Handle error (e.g., print error message)
        print('Error fetching inbox data: ${response.statusCode}');
         setState(() {
           errorMessage = 'Invalid designation';
         });
      }
    } catch (e) {
      // Handle other exceptions (e.g., network errors, token errors)
      print('An error occurred: $e');
    }
  }

  Future<void> _getDesignations() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      var response = await http.get(
        Uri.http(kserverLink, '/filetracking/api/designations/${widget.username}/'),
        headers: {
          'Authorization': 'Token ${storageService.userInDB?.token}',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        var data = jsonDecode(response.body);
        setState(() {
          designations = List<String>.from(data['designations']);
          _selectedDesignation = designations.isNotEmpty ? designations.first : null;
        });
      } else {
        throw Exception('Failed to load designations');
      }
    } catch (e) {
      print('An error occurred while fetching designations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
    	curr_desig: curr_desig,
    	headerTitle: "Inbox",
    	onDesignationChanged: (newValue) {
      	setState(() {
        	curr_desig = newValue;
      	});
    	},
  	), // This is default app bar used in all modules
  	drawer: SideDrawer(curr_desig: curr_desig),
  	bottomNavigationBar:
  	MyBottomNavigationBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Divider
            Divider(thickness: 1.0, color: Colors.grey[300]),

            // Form content
            Column(
              children: [
                // Designation dropdown
                DropdownButtonFormField<String>(
                  value: _selectedDesignation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDesignation = newValue;
                    });
                  },
                  items: designations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'View As',
                  ),
                ),

                // Send button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await _submitForm();
                      },
                      child: Text('View'),
                    ),
                  ],
                ),
              ],
            ),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),

            // Display file IDs and buttons
            Column(
              children: fileIDsList.map((fileID) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('File ID: $fileID'),
                      TextButton(
                        onPressed: () {
                          // Handle view button pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessageDetailPage(
                                messageDetails: jsonData[fileIDsList.indexOf(fileID)],
                                username: widget.username,
                              ),
                            ),
                          );
                        },
                        child: Text('View'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
