import 'package:flutter/material.dart';

// Assuming you have a model class for file data
class TrackFile {
  final int id;
  final String name;
  final DateTime createdDate;
  final String sender;
  final String recipient;
  final String department;

  TrackFile({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.sender,
    required this.recipient,
    required this.department,
  });
}

class FileTrackingPage extends StatefulWidget {
  @override
  _FileTrackingPageState createState() => _FileTrackingPageState();
}

class _FileTrackingPageState extends State<FileTrackingPage> {
  List<TrackFile> exampleFiles = [
    TrackFile(
      id: 1,
      name: "Document 1",
      createdDate: DateTime.now().subtract(Duration(days: 2)),
      sender: "Aishwarya",
      recipient: "Yash",
      department: "IT",
    ),
    TrackFile(
      id: 2,
      name: "Report Q3",
      createdDate: DateTime.now().subtract(Duration(days: 5)),
      sender: "Yash",
      recipient: "Department Head",
      department: "Finance",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Tracking'),
      ),
      body: ListView.builder(
        itemCount: exampleFiles.length,
        itemBuilder: (context, index) {
          final trackFile = exampleFiles[index];
          return ListTile(
            title: Text(trackFile.name),
            subtitle: Text(
              "Sent by: ${trackFile.sender} | Sent to: ${trackFile.recipient}",
            ),
            trailing: TextButton(
              onPressed: () {
                // Handle "View File" action
                // ... navigation or action to view file details
                Navigator.pushNamed(
                  context,
                  '/fts/view_file_details', // Replace with your details page route
                  arguments: trackFile, // Pass the TrackFile object for details
                );
              },
              child: Text('View File'),
            ),
          );
        },
      ),
    );
  }
}
