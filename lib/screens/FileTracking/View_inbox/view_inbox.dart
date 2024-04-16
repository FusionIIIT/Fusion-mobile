import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import '../View_File/view_inboxfile.dart';
import '../Forward_file/forward_file.dart';


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
  final String username;
  InboxPage({required this.username});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final _designationController = TextEditingController();
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitForm() async {
    try {
      if (_designationController.text?.isEmpty == true) {
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
        'designation': _designationController.text,
        'src_module': 'filetracking',
      };

      // Construct URL with encoded query parameters
      
      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/inbox/', queryParams);

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

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Inbox'),
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
                        print(jsonData[fileIDsList.indexOf(fileID)]);
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