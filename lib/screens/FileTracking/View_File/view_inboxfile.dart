import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class MessageDetailPage extends StatefulWidget {
  final Map<String, dynamic> messageDetails;

  const MessageDetailPage({Key? key, required this.messageDetails}) : super(key: key);

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  String? historyResponse;

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/history/${widget.messageDetails['id']}');
      final client = http.Client();
      final response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        setState(() {
          historyResponse = response.body;
        });
      } else {
        print('Failed to fetch file history. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Failed to fetch file history. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Message Details',
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
              subtitle: Text(widget.messageDetails['id'].toString()),
            ),
            ListTile(
              title: Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.messageDetails['subject']),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.messageDetails['description']),
            ),
            ListTile(
              title: Text(
                'Sent By',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.messageDetails['sent_by_user']),
            ),
            ListTile(
              title: Text(
                'Upload Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.messageDetails['upload_date']),
            ),
            ListTile(
              title: Text(
                'Uploader',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.messageDetails['uploader']),
            ),
            SizedBox(height: 16),
            if (historyResponse != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'File History Response',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    JsonEncoder.withIndent('  ').convert(jsonDecode(historyResponse!)),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Courier',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
