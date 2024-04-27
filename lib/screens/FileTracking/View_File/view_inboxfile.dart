import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Forward_file/forward_file.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageDetailPage extends StatefulWidget {
  final Map<String, dynamic> messageDetails;
  final String username;

  const MessageDetailPage({Key? key, required this.messageDetails, required this.username}) : super(key: key);

  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  String? historyResponse;
  String? messageResponse;
  String? receiver;
  String? filename;
  
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

      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/file/${widget.messageDetails['id']}');
      final Uri historyUrl = Uri.http('10.0.2.2:8000', '/filetracking/api/history/${widget.messageDetails['id']}');

      final client = http.Client();
      final response = await client.get(url, headers: headers);
      final historyResponse = await client.get(historyUrl, headers: headers);
      final fileResponse = json.decode(response.body); // Parse response body
      setState(() {
        filename = fileResponse["upload_file"];
      });
      if (response.statusCode == 200 && historyResponse.statusCode == 200) {
        setState(() {
          this.historyResponse = historyResponse.body;
          this.messageResponse = response.body;
          final List<dynamic> historyData = json.decode(historyResponse.body);
          if (historyData.isNotEmpty) {
            receiver = historyData[0]['receiver_id'];
          }
        });
      } else {
        print('Failed to fetch file history. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Failed to fetch file history. Error: $error');
    }
  }

  Future<void> _archiveFile(String fileID) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json'
      };

      final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/createarchive/');

      final client = http.Client();

      final response = await client.post(url, headers: headers, body: json.encode({'file_id': fileID}));

      if (response.statusCode == 200) {
        print('File $fileID archived successfully');

        // Show a green prompt indicating that the file has been archived
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('File $fileID archived successfully'),
          ),
        );

        // Pop out to the parent page
        Navigator.pop(context);
      } else {
        print('Error archiving file $fileID: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred while archiving file $fileID: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

Widget build(BuildContext context) {
  final bool isUploader = widget.messageDetails['uploader'] == widget.username;
  final Uri fileUrl = Uri.http('10.0.2.2:8000', filename ?? "");

  return Scaffold(
    appBar: AppBar(
      title: Text('Inbox Details'),
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
          if (messageResponse != null) ...[
            Text('File ID: ${widget.messageDetails['id'] ?? 'N/A'}'),
            Text('Subject: ${widget.messageDetails['subject'] ?? 'N/A'}'),
            if (filename != null)
                ElevatedButton(
                  onPressed: () async {
                    if (await canLaunch(fileUrl.toString())) {
                      await launch(fileUrl.toString());
                    } else {
                      throw 'Could not launch $fileUrl';
                    }
                  },
                  child: Text('File Attached'),
                ),
            SizedBox(height: 16),
            Text(
              'History',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (historyResponse != null)
              buildMessageThread(json.decode(historyResponse!)),
          ],
          // **Integration of buttons here**
          if (!isUploader) // Show Forward button if not uploader
            ElevatedButton(
              onPressed: () {
                // Navigate to ForwardFilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForwardFilePage(fileDetails: widget.messageDetails),
                  ),
                );
              },
              child: Text('Forward'),
            ),
          if (isUploader) // Show Archive button if uploader
            ElevatedButton(
              onPressed: () {
                // Archive the file
                _archiveFile(widget.messageDetails['id'].toString());
              },
              child: Text('Archive'),
            ),
        ],
      ),
    ),
  );
}


Widget buildMessageThread(List<dynamic> historyData) {
  // Organize messages based on sender and receiver
  Map<String, List<Map<String, dynamic>>> messageThreads = {};
  for (var message in historyData) {
    String sender = message['current_id'];
    String receiver = message['receiver_id'];
    messageThreads.putIfAbsent(sender, () => []);
    messageThreads[sender]!.add(message);
  }

  // Sort message threads by date
  messageThreads.forEach((key, value) {
    value.sort((a, b) => a['receive_date'].compareTo(b['receive_date']));
  });

  // Build UI for message threads
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: messageThreads.keys.map((sender) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sender == messageThreads.keys.last) // Check if it's the last sender
            Text(
              'Uploader: ${sender}', // Display "Uploader" instead of actual sender
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Text(
              'Sent By: ${sender}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          SizedBox(height: 8),
          Column(
            children: messageThreads[sender]!.map((message) {
              String formattedDate = '';
              String forwardDate = message['forward_date'] ?? 'N/A';
              if (forwardDate != 'N/A') {
                DateTime date = DateTime.parse(forwardDate);
                String formattedTime = '${date.hour}:${date.minute}:${date.second}';
                formattedDate = '${date.year}-${date.month}-${date.day}';
                formattedDate = '$formattedDate & Time: $formattedTime'; // Combining date and time
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Sent To: ${message['receiver_id']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Remarks: ${message['remarks']}'),
                        Text('Date: $formattedDate'), // Display formatted date and time
                        if (message['upload_file'] != null)
                          Text('Uploaded File: ${message['upload_file']}'), // Display uploaded file if it exists
                        // Add more details here as needed
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 8),
          
        ],
      );
    }).toList(),
  );
}
}