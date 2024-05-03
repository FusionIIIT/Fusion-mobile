import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import '../View_File/view_draftfile.dart';

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
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;

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
        'designation': _designationController.text,
        'src_module': 'filetracking',
      };

      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/draft/', queryParams);

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

    final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/file/$id/');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draft'),
      ),
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
                TextField(
                  controller: _designationController,
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
                              // Handle view button pressed
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewDraftFilePage(
                                  draftDetails: jsonData[fileIDsList.indexOf(fileID)],
                                  onDelete: _deleteDraftAndUpdateList,
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
