import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';

class ViewDraftFilePage extends StatefulWidget {
  final Map<String, dynamic> draftDetails;
  final Function(String) onDelete;

  const ViewDraftFilePage({Key? key, required this.draftDetails, required this.onDelete}) : super(key: key);

  @override
  _ViewDraftFilePageState createState() => _ViewDraftFilePageState();
}

class _ViewDraftFilePageState extends State<ViewDraftFilePage> {
  String receiver = ''; // Receiver username
  String receiverDesignation = ''; // Receiver designation
  File? _attachedFile;
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
      var request = http.MultipartRequest(
        'POST',
        Uri.http(
          kserverLink, '/filetracking/api/file/'
        ),
      );

      request.fields['subject'] = widget.draftDetails['subject'].toString();
      request.fields['designation'] = 'student';
      request.fields['receiver_username'] = receiver;
      request.fields['receiver_designation'] = receiverDesignation;
      request.fields['description'] = widget.draftDetails['description'].toString();
      
      // Prepare request body
      if(_attachedFile != null) {
        var filePart = await http.MultipartFile.fromPath(
          'file',
          _attachedFile!.path,
        );
        request.files.add(filePart);
      }

      request.headers['Authorization'] = 'Token ' + (storageService.userInDB?.token ?? "");
      request.headers['Content-Type'] = 'application/json';

      var response = await http.Response.fromStream(await request.send());

      print(response.statusCode);
      // Handle response
      if (response.statusCode == HttpStatus.created) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Draft sent successfully to $receiver'),
            backgroundColor: Colors.green,
          ),
        );

        // Delete the current draft
        widget.onDelete(widget.draftDetails['id'].toString());

        // Close current page and go back to the previous screen
        Navigator.pop(context); // Pop out the current page
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

  @override
  Widget build(BuildContext context) {
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
              subtitle: Text(widget.draftDetails['id'].toString()),
            ),
            ListTile(
              title: Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.draftDetails['file_extra_JSON']['subject'] ?? 'No subject available'),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.draftDetails['file_extra_JSON']['description'] ?? 'No description available'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  setState(() {
                    _attachedFile = File(result.files.single.path ?? '');
                  });
                } else {
                  // User canceled the file picking
                }
              },
              child: Text('Browse'),
            ),
            SizedBox(height: 16),
            _attachedFile != null
                ? Text(_attachedFile!.path)
                : Container(), // Display selected file path
            SizedBox(height: 16),
            TextField(
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
              onPressed: () {
                _submitForm(context, receiver, receiverDesignation);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
