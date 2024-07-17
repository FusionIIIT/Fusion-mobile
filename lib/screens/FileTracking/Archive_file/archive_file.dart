import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:fusion/screens/Complaint/complaint.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../View_File/view_archive.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


class ArchivePage extends StatefulWidget {
  final String username;
  ArchivePage({required this.username});
  
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final TextEditingController _designationController = TextEditingController();
  late var curr_desig=service.getFromDisk("Current_designation");
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;
  String? _selectedDesignation; // Variable to hold the selected designation
  List<String> designations = []; // List to hold designations

  Future<void> _submitForm() async {
    try {
      if (_selectedDesignation == null || _selectedDesignation!.isEmpty) {
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

      final queryParams = {
        'username': widget.username,
        'designation': _selectedDesignation ?? "",
        'src_module': 'filetracking',
      };

      final Uri url = Uri.http(kserverLink, '/filetracking/api/archive/', queryParams);

      final client = http.Client();

      final response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        List<String> fileIDs = jsonData.map((data) => data['id'].toString()).toList();

        setState(() {
          fileIDsList = fileIDs;
          errorMessage=null;
        });
      } else {
        print('Error fetching archive data: ${response.statusCode}');
        setState(() {
          errorMessage = 'Invalid designation';
        });
      }
    } catch (e) {
      print('An error occurred: $e');
    }
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
    } catch (e) {
      print('An error occurred while fetching designations: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getDesignations(); // Fetch designations on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
    	curr_desig: curr_desig,
    	headerTitle: "Archived",
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
                // Designation dropdown
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
                    labelText: 'View As',
                  ),
                ),
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
                          )
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
