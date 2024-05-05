import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ForwardFilePage extends StatefulWidget {
  final Map<String, dynamic> fileDetails;

  const ForwardFilePage({Key? key, required this.fileDetails}) : super(key: key);

  @override
  _ForwardFilePageState createState() => _ForwardFilePageState();
}

class _ForwardFilePageState extends State<ForwardFilePage> {
  String receiver = ''; // Receiver username
  String receiverDesignation = ''; // Receiver designation
  String remarks = ''; // Remarks entered by the user
  bool forwarded = false; // Track if the file has been forwarded
  List<String> designations = []; // List to hold designations
  String? _selectedDesignation; // Variable to hold the selected designation

  @override
  void initState() {
    super.initState();
    _getDesignations();
  }

  Future<void> _getDesignations() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }
      var response = await http.get(
        Uri.http(kserverLink, '/filetracking/api/designations/$receiver/'),
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

  Future<void> forwardFile({
    required String receiver,
    required String receiverDesignation,
    required String remarks,
    required BuildContext context,
  }) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      final data = jsonEncode({
        'receiver': receiver,
        'receiver_designation': receiverDesignation,
        'remarks': remarks,
      });

      final file_id = widget.fileDetails['id'];

      final client = http.Client();
      final response = await client.post(
        Uri.http(kserverLink, '/filetracking/api/forwardfile/$file_id/'),
        headers: headers,
        body: data,
      );

      if (response.statusCode == 201) {
        print('File forwarded successfully');

        // Show a green prompt indicating that the file has been forwarded
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('File forwarded successfully to $receiver'),
          ),
        );

        setState(() {
          forwarded = true; // Update the forwarded status
        });

        // Pop out of the page
        Navigator.pop(context);
      } else {
        print('Error forwarding file: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to forward file. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              subtitle: Text(widget.fileDetails['subject']),
            ),
            ListTile(
              title: Text(
                'Uploader',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.fileDetails['uploader']),
            ),
            ListTile(
              title: Text(
                'Sent By',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.fileDetails['sent_by_user']),
            ),
            SizedBox(height: 16),
            TextField(
              enabled: !forwarded, // Disable text field if file has been forwarded
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
              enabled: !forwarded, // Disable text field if file has been forwarded
              decoration: InputDecoration(
                labelText: 'Receiver Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  receiver = value;
                  _getDesignations(); // Call _getDesignations() when receiver changes
                });
              },
            ),
            SizedBox(height: 16),
            // Receiver Designation dropdown
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
                labelText: 'Receiver Designation',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: !forwarded
                  ? () {
                      forwardFile(
                        receiver: receiver,
                        receiverDesignation: _selectedDesignation ?? '',
                        remarks: remarks,
                        context: context,
                      );
                    }
                  : null, // Disable button if file has been forwarded
              child: Text('Forward'),
            ),
          ],
        ),
      ),
    );
  }
}
