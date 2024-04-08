import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CreateFilePage extends StatefulWidget {
  final String username;
  CreateFilePage({required this.username});
  @override
  _CreateFilePageState createState() => _CreateFilePageState();
}

class _CreateFilePageState extends State<CreateFilePage> {
  // Form controllers
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _sendAsController = TextEditingController();
  final _forwardToController = TextEditingController();
  final _designationController = TextEditingController();

  Future<void> _submitForm() async {
    try {
      // Validate required fields
      if (_titleController.text?.isEmpty == true ||
          _descriptionController.text?.isEmpty == true) {
        throw Exception('Title and description are required.');
      }

      // Prepare headers
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      // Prepare request body
      final data = jsonEncode({
        'subject': _titleController.text,
        'designation': _sendAsController.text,
        'receiver_username': _forwardToController.text,
        'receiver_designation': _designationController.text,
        'description': _descriptionController.text,
      });

      // Make POST request
      final response = await http.post(
        Uri.http('10.0.2.2:8000', '/filetracking/api/file/'),
        headers: headers,
        body: data,
      );

      // Handle response
      if (response.statusCode == HttpStatus.created) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File sent'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Handle other status codes (e.g., show error message)
        final errorMessage = await _parseErrorMessage(response);
        print('Error: $errorMessage');
      }
    } catch (e) {
      // Handle other exceptions
      print('An error occurred: $e');
    }
  }

  Future<void> _draftForm() async {
  try {
    // Validate required fields
    if (_titleController.text?.isEmpty == true) {
      throw Exception('Title is required.');
    }

    // Prepare headers
    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) {
      throw Exception('Token Error');
    }

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
      'Content-Type': 'application/json'
    };

    // Prepare request body
    print(_titleController.text);
    final data = jsonEncode({
      'subject': _titleController.text,
      'uploader': widget.username,
      'uploader_designation': _sendAsController.text,
      'src_module': 'filetracking'
    });
    // Make POST request
    final response = await http.post(
      Uri.http('10.0.2.2:8000', '/filetracking/api/createdraft/'),
      headers: headers,
      body: data,
    );

    // Handle response
    if (response.statusCode == HttpStatus.created) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Draft saved'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Handle other status codes (e.g., show error message)
      final errorMessage = await _parseErrorMessage(response);
      print('Error: $errorMessage');
    }
  } catch (e) {
    // Handle other exceptions
    print('An error occurred: $e');
  }
}


  Future<String> _parseErrorMessage(http.Response response) async {
    // Implement your error parsing logic here (e.g., from JSON response body)
    try {
      final decodedResponse = jsonDecode(response.body);
      return decodedResponse['message'] ?? 'Unknown error';
    } catch (error) {
      return 'Failed to parse error message';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create File'),
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
                // Title field (required)
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title*',
                    errorText:
                        _titleController.text.isEmpty ? 'Required' : null,
                  ),
                ),

                // Description field (required)
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description*',
                  ),
                ),

                // Attach field
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text 'Attach File'
                    Text('Attach File'),
                    SizedBox(width: 16.0), // Add spacing between text and button

                    // ElevatedButton with informative text
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('File Attachment'),
                            content: Text(
                                'File attachment is not currently supported in this web app.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Browse'), // Changed text to "Browse"
                    ),
                  ],
                ),

                // Remarks field
                TextField(
                  controller: _sendAsController,
                  decoration: InputDecoration(
                    labelText: 'Send as',
                  ),
                ),

                // Forward to field
                TextField(
                  controller: _forwardToController,
                  decoration: InputDecoration(
                    labelText: 'Forward To',
                  ),
                ),

                // Designation field
                TextField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Receiver\'s Designation',
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
                      child: Text('Send'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _draftForm();
                      },
                      child: Text('Draft'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
