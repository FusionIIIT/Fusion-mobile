import 'package:flutter/material.dart';

// Assuming you have a model class for inbox message data
class InboxMessage {
  final String sender;
  final String subject;
  final String snippet;
  final DateTime timestamp;
  // ... other message data properties

  InboxMessage({
    required this.sender,
    required this.subject,
    required this.snippet,
    required this.timestamp,
    // ... other required or optional properties
  });
}

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  Future<List<InboxMessage>> _fetchInboxMessages() async {
    // Replace with your actual logic to fetch inbox messages
    // Simulate data fetching (replace with your API call or service)
    return [
      InboxMessage(
        sender: "University Administration",
        subject: "Important Announcement",
        snippet: "Regarding upcoming semester registration...",
        timestamp: DateTime.now().subtract(Duration(days: 2)),
      ),
      InboxMessage(
        sender: "Department of CS",
        subject: "Course Materials Update",
        snippet: "New materials uploaded for Data Structures...",
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: FutureBuilder<List<InboxMessage>>(
        future: _fetchInboxMessages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data!;
            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200], // Placeholder for sender avatar
                    child: Text(message.sender[0].toUpperCase()), // Initials from sender name
                  ),
                  title: Text(message.subject),
                  subtitle: Text(message.snippet),
                  trailing: Text(message.timestamp.toString()),
                  onTap: () {
                    // Handle message item tap (e.g., open details page)
                    Navigator.pushNamed(
                      context,
                      '/fts/view_message', // Replace with your message details page route
                      arguments: message, // Pass the message object for details
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching inbox messages: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
