import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ViewDraftFilePage extends StatelessWidget {
  final Map<String, dynamic> draftDetails;
  final Function(String) onDelete;

  const ViewDraftFilePage({Key? key, required this.draftDetails, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String receiver = ''; // Receiver username
    String receiverDesignation = ''; // Receiver designation

    void _submitForm(BuildContext context, String receiver, String receiverDesignation) async {
      try {
        // Validate receiver and receiver designation
        if (receiver.isEmpty || receiverDesignation.isEmpty) {
          throw Exception('Receiver username and designation are required.');
        }

        var storageService = locator<StorageService>();
        if (storageService.userInDB?.token == null) {
          throw Exception('Token Error');
        }

        Map<String, String> headers = {
          'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
          'Content-Type': 'application/json'
        };

        // Prepare request body
        final data = jsonEncode({
        'subject': draftDetails['subject'],
        'designation': 'student',
        'receiver_username': receiver,
        'receiver_designation': receiverDesignation,
        'description': draftDetails['description'],
      });
        // Make HTTP POST request to send the draft
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
              content: Text('Draft sent successfully to $receiver'),
              backgroundColor: Colors.green,
            ),
          );

          // Close current page and go back to the previous screen
          Navigator.pop(context);
        } else {
          // Show error message with server response
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send draft: ${response.body}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send draft: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Draft File Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Draft Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(draftDetails['id'].toString()),
            ),
            ListTile(
              title: Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(draftDetails['subject'] ?? 'No subject available'),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(draftDetails['description'] ?? 'No description available'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Receiver Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                receiver = value;
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Receiver Designation',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                receiverDesignation = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm(context, receiver, receiverDesignation);
                onDelete(draftDetails['id'].toString());
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
