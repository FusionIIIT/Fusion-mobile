import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/screens/Complaint/complaint.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


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
  late var curr_desig=service.getFromDisk("Current_designation");
  String? _selectedDesignation;
  String? _selectedReceiverDesignation;
  File? _attachedFile;

  List<String> designations = [];
  List<String> receiverDesignations = [];

  String receiverUsername = ''; // Define receiver username here

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

      if (receiverUsername.isNotEmpty) {
        var response1 = await http.get(
          Uri.http(kserverLink, '/filetracking/api/designations/$receiverUsername/'),
          headers: {
            'Authorization': 'Token ${storageService.userInDB?.token}',
            'Content-Type': 'application/json'
          },
        );

        if (response1.statusCode == HttpStatus.ok) {
          var data1 = jsonDecode(response1.body);
          setState(() {
            receiverDesignations = List<String>.from(data1['designations']);
            _selectedReceiverDesignation = receiverDesignations.isNotEmpty ? receiverDesignations.first : null;
          });
        } else {
          throw Exception('Failed to load receiver designations');
        }
      }
    } catch (e) {
      print('An error occurred while fetching designations: $e');
    }
  }

  Future<void> _submitForm() async {
    try {
      if (_titleController.text.isEmpty ||
          _descriptionController.text.isEmpty) {
        throw Exception('Title and description are required.');
      }

      if (_selectedDesignation == 'student') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Students are not allowed to create files."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.http(kserverLink, '/filetracking/api/file/'),
      );

      request.fields['subject'] = _titleController.text;
      request.fields['designation'] = _selectedDesignation!;
      request.fields['receiver_username'] = _forwardToController.text;
      request.fields['receiver_designation'] = _selectedReceiverDesignation!;
      request.fields['description'] = _descriptionController.text;

      if (_attachedFile != null) {
        var filePart = await http.MultipartFile.fromPath(
          'file',
          _attachedFile!.path,
        );
        request.files.add(filePart);
      }

      request.headers['Authorization'] =
          'Token ${storageService.userInDB?.token}';
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
      if (_titleController.text.isEmpty) {
        throw Exception('Title is required.');
      }

      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ${storageService.userInDB?.token}',
        'Content-Type': 'application/json'
      };

      final data = jsonEncode({
        'file_extra_JSON': {'subject': _titleController.text, 'description': _descriptionController.text},
        'uploader': widget.username,
        'uploader_designation': _selectedDesignation!,
        'src_module': 'filetracking'
      });

      final response = await http.post(
        Uri.http(kserverLink, '/filetracking/api/createdraft/'),
        headers: headers,
        body: data,
      );

      if (response.statusCode == HttpStatus.created) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Draft saved'),
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
     appBar: CustomAppBar(
    	curr_desig: curr_desig,
    	headerTitle: "Compose File",
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
            Divider(thickness: 1.0, color: Colors.grey[300]),
            Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title*',
                    errorText: _titleController.text.isEmpty
                        ? 'Required'
                        : null,
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
                            _attachedFile =
                                File(result.files.single.path ?? '');
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
                    labelText: 'Send as',
                  ),
                ),
                if (_selectedDesignation == 'student')
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Students are not allowed to create files.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                TextField(
                  controller: _forwardToController,
                  decoration: InputDecoration(
                    labelText: 'Receiver Username*',
                  ),
                  onChanged: (receiverUsername) {
                    setState(() {
                      this.receiverUsername = receiverUsername;
                      _getDesignations();
                      _selectedReceiverDesignation = null; // Reset the selected designation
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedReceiverDesignation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedReceiverDesignation = newValue;
                    });
                  },
                  items: receiverDesignations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Receiver's Designation",
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
