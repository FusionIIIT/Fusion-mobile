import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../View_File/view_outboxfile.dart';

// Assuming you have a model class for message or file data
class OutboxMessage {
  final String recipient;
  final String subject;
  final String snippet;
  final DateTime sentDate;
  final String? messageType; // Optional for message type (e.g., email, chat)

  OutboxMessage({
    required this.recipient,
    required this.subject,
    required this.snippet,
    required this.sentDate,
    this.messageType,
  });
}

class OutboxPage extends StatefulWidget {
  final String username;
  OutboxPage({required this.username});
  @override
  _OutboxPageState createState() => _OutboxPageState();
}

class _OutboxPageState extends State<OutboxPage> {
  final _designationController = TextEditingController();
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String ?errorMessage;

  Future<void> _submitForm() async {
    try {
      // Validate required fields
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
      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/outbox/', queryParams);

      final client = http.Client();

      // Make GET request
      final response = await client.get(url, headers: headers);

      // Handle response
      if (response.statusCode == 200) {
        // Parse the JSON response
        jsonData = json.decode(response.body);
        print(response.body);
        // Extract file IDs
        List<String> fileIDs = jsonData.map((data) => data['id'].toString()).toList();

        // Update the UI with file IDs
        setState(() {
          fileIDsList = fileIDs;
          errorMessage=null;
        });
      } else {
        // Handle error (e.g., print error message)
        print('Error fetching outbox data: ${response.statusCode}');
        setState(() {
         errorMessage = 'Invalid designation';});
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
        title: Text('Outbox'),
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
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle view button pressed
                              Navigator.push( context,
                                MaterialPageRoute(
                                  builder: (context) => MessageDetailPage(messageDetails: jsonData[fileIDsList.indexOf(fileID)]),
                                ),
                              );
                            },
                            child: Text('View'),
                          ),
                          SizedBox(width: 8),
                          
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
