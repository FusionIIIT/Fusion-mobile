import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class CreateFilePage extends StatefulWidget {
  final String username;
  CreateFilePage({required this.username});

  @override
  _CreateFilePageState createState() => _CreateFilePageState();
}

class _CreateFilePageState extends State<CreateFilePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _sendAsController = TextEditingController();
  final _forwardToController = TextEditingController();
  final _designationController = TextEditingController();

  File? _attachedFile;

  Future<void> _submitForm() async {
    try {
      if (_titleController.text?.isEmpty == true ||
          _descriptionController.text?.isEmpty == true) {
        throw Exception('Title and description are required.');
      }
        var storageService = locator<StorageService>();
        if (storageService.userInDB?.token == null) {
          throw Exception('Token Error');
        }

        Map<String, String> headers = {
          'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
          'Content-Type': 'application/json'
        };


        var request = http.MultipartRequest(
          'POST',
          Uri.http(
            '10.0.2.2:8000', '/filetracking/api/file/'
          ),
        );

        request.fields['subject'] = _titleController.text;
        request.fields['designation'] = _sendAsController.text;
        request.fields['receiver_username'] = _forwardToController.text;
        request.fields['receiver_designation'] = _designationController.text;
        request.fields['description'] = _descriptionController.text;

        if(_attachedFile != null) {
          var filePart = http.MultipartFile(
            'file',
            _attachedFile!.readAsBytes().asStream(),
            _attachedFile!.lengthSync(),
            filename: _attachedFile!.path.split('/').last,
          );
          request.files.add(filePart);
        }

        request.headers['Authorization'] = 'Token ' + (storageService.userInDB?.token ?? "");
        request.headers['Content-Type'] = 'application/json';

        var response = await http.Response.fromStream(await request.send());

        print(response.statusCode);
        if (response.statusCode == HttpStatus.created) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('File sent'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        } else {
          final errorMessage = await _parseErrorMessage(response);
          print('Error: $errorMessage');
        }
    } catch (e) {
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
      'description': _descriptionController.text,
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
      Navigator.pop(context);
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
            Divider(thickness: 1.0, color: Colors.grey[300]),
            Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title*',
                    errorText:
                        _titleController.text.isEmpty ? 'Required' : null,
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description*',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Attach File'),
                    SizedBox(width: 16.0),
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
                    SizedBox(width: 10),
                    Text(_attachedFile?.path.split('/').last ?? ''),
                  ],
                ),
                TextField(
                  controller: _sendAsController,
                  decoration: InputDecoration(
                    labelText: 'Send as',
                  ),
                ),
                TextField(
                  controller: _forwardToController,
                  decoration: InputDecoration(
                    labelText: 'Forward To',
                  ),
                ),
                TextField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Receiver\'s Designation',
                  ),
                ),
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
