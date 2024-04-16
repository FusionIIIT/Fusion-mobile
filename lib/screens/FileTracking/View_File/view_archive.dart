import 'package:flutter/material.dart';

class MessageDetailPage extends StatelessWidget {
  final Map<String, dynamic> messageDetails;

  const MessageDetailPage({Key? key, required this.messageDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived File Details'),
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
              subtitle: Text(messageDetails['id'].toString()),
            ),
            ListTile(
              title: Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(messageDetails['subject']),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(messageDetails['description']),
            ),
            ListTile(
              title: Text(
                'Upload Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(messageDetails['upload_date']),
            ),
            ListTile(
              title: Text(
                'Uploader',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(messageDetails['uploader']),
            ),
          ],
        ),
      ),
    );
  }
}
