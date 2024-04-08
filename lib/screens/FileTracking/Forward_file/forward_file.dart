import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;


class ForwardFilePage extends StatelessWidget {
  final Map<String, dynamic> fileDetails;

  const ForwardFilePage({Key? key, required this.fileDetails}) : super(key: key);

  Future<void> forwardFile({
    required String receiver,
    required String receiverDesignation,
    required String remarks,
  }) async {
    try{
    // Your API endpoint for forwarding the file
    var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };
    // Prepare the request body
    final data = jsonEncode({ 
      'receiver': receiver,
      'receiver_designation': receiverDesignation,
      'remarks': remarks,
    });
    final file_id=fileDetails['id'];
    // Make the POST request
    print(data);
    final client = http.Client();
    client.post(
      Uri.http('10.0.2.2:8000', '/filetracking/api/forwardfile/$file_id/'),
      headers: headers,
      body: data,
    ).then((response) {
      print(response.statusCode);
    }).catchError((error) {
      print(error);
    });
      // Check if the request was successful
    } catch (error) {
      // Handle network errors
      print('Failed to forward file. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String receiver = ''; // Receiver username
    String receiverDesignation = ''; // Receiver designation
    String remarks = ''; // Remarks entered by the user

    return Scaffold(
      appBar: AppBar(
        title: Text('Forward File'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'File Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(fileDetails['subject']),
            ),
            ListTile(
              title: Text(
                'Uploader',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(fileDetails['uploader']),
            ),
            ListTile(
              title: Text(
                'Sent By',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(fileDetails['sent_by_user']),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Remark',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                remarks = value;
              },
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                forwardFile(
                  receiver: receiver,
                  receiverDesignation: receiverDesignation,
                  remarks: remarks,
                );
              },
              child: Text('Forward'),
            ),
          ],
        ),
      ),
    );
  }
}