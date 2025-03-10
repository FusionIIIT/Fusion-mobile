import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import '../View_File/view_archive.dart';

class ArchivePage extends StatefulWidget {
  final String username;
  ArchivePage({required this.username});
  
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final _designationController = TextEditingController();
  List<String> fileIDsList = [];
  List<dynamic> jsonData = [];
  String? errorMessage;

  Future<void> _submitForm() async {
    try {
      if (_designationController.text.isEmpty == true) {
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
        'designation': _designationController.text,
        'src_module': 'filetracking',
      };

      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/archive/', queryParams);

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
        print('Error fetching outbox data: ${response.statusCode}');
        setState(() {
          errorMessage = 'Invalid designation';
        });
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Divider(thickness: 1.0, color: Colors.grey[300]),
            Column(
              children: [
                TextField(
                  controller: _designationController,
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
                                  builder: (context) => MessageDetailPage(messageDetails: jsonData[fileIDsList.indexOf(fileID)], username: '',),
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
