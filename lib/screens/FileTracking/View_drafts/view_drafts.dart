import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import '../../Complaint/complaint.dart';
import '../View_File/view_draftfile.dart';
import 'package:fusion/api.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class DraftFileData {
  final String id;

  DraftFileData({
    required this.id,
  });
}

class DraftsPage extends StatefulWidget {
  final String username;

  DraftsPage({required this.username});

  @override
  _DraftsPageState createState() => _DraftsPageState();
}

class _DraftsPageState extends State<DraftsPage> {
  final TextEditingController _designationController = TextEditingController();
  late var curr_desig=service.getFromDisk("Current_designation");
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;
  String? _selectedDesignation;
  List<String> designations = []; // Add this line to declare 'designations'

  @override
  void initState() {
    super.initState();
    _getDesignations();
  }

  @override
  void dispose() {
    _designationController.dispose();
    super.dispose();
  }

  Future<void> _fetchDrafts() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      final Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      final queryParams = {
        'username': widget.username,
        'designation': _selectedDesignation ?? "",
        'src_module': 'filetracking',
      };

      final Uri url = Uri.http(kserverLink, '/filetracking/api/draft/', queryParams);

      final client = http.Client();
      final response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        print(response.body);
        // Extract file IDs
        List<String> fileIDs = jsonData.map((data) => data['id'].toString()).toList();

        // Update the UI with file IDs
        setState(() {
          fileIDsList = fileIDs;
          errorMessage = null;
        });
      } else {
        setState(() {
          errorMessage = 'Error fetching draft files: ${response.reasonPhrase}';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred: $error';
      });
    }
  }

  void _deleteDraftAndUpdateList(String id) async {
    // Call the function to delete the draft
    await _deleteDraft(id);
    // Fetch the drafts again to update the list
    await _fetchDrafts();
  }

  Future<void> _deleteDraft(String id) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      final Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      final Uri url = Uri.http(kserverLink, '/filetracking/api/file/$id/');

      final client = http.Client();
      final response = await client.delete(url, headers: headers);

      if (response.statusCode == 204) {
        // Draft file deleted successfully, refresh the list
        await _fetchDrafts();
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Draft file deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        throw Exception('Failed to delete draft file: ${response.reasonPhrase}');
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred while deleting draft file: $error';
      });
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
    	headerTitle: "Draft",
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
                // Designation field
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
                        await _fetchDrafts();
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
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              print(jsonData[fileIDsList.indexOf(fileID)]);
                              // Handle view button pressed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewDraftFilePage(
                                    draftDetails: jsonData[fileIDsList.indexOf(fileID)],
                                    onDelete: _deleteDraftAndUpdateList,
                                    selectedDesignation: _selectedDesignation, // Pass selected designation
                                  ),
                                ),
                              );
                            },
                            child: Text('View'),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              // Handle delete button pressed
                              _deleteDraft(fileID);
                            },
                            child: Text('Delete'),
                          ),
                        ],
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
