import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Assuming you have a model class for message or file data
class OutboxMessage {
  final String recipient;
  final String subject;
  final String snippet;
  final DateTime sentDate;
  final String? messageType; // Optional for message type (e.g., email, chat)

  OutboxMessage({
    required this.recipient,
    required this.subject,
    required this.snippet,
    required this.sentDate,
    this.messageType,
  });
}

class OutboxPage extends StatefulWidget {
  @override
  _OutboxPageState createState() => _OutboxPageState();
}

class _OutboxPageState extends State<OutboxPage> {
  // Example data for two outbox messages
  List<OutboxMessage> exampleMessages = [
    OutboxMessage(
      recipient: "Siddhant",
      subject: "Project Update",
      snippet: "The project is on track and we're making good progress...",
      sentDate: DateTime.now().subtract(Duration(days: 2)),
      messageType: "Email",
    ),
    OutboxMessage(
      recipient: "Divyansh",
      subject: "Meeting Reminder",
      snippet: "Don't forget about the meeting tomorrow at 10 AM...",
      sentDate: DateTime.now().subtract(Duration(days: 1)),
      messageType: "Chat",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outbox'),
      ),
      body: ListView.builder(
        itemCount: exampleMessages.length, // Use length of exampleMessages
        itemBuilder: (context, index) {
          final message = exampleMessages[index];
          return CustomListItem(
            message: message,
            onTap: () {
              // Handle message tap (e.g., navigate to details page)
            },
          );
        },
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final OutboxMessage message;
  final void Function() onTap;

  const CustomListItem({Key? key, required this.message, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: CircleAvatar(
      backgroundColor: Colors.grey[200],
      child: Text(
        message.recipient[0].toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    title: Text(
      message.recipient,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message.subject,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          message.snippet,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
    trailing: Wrap(
      spacing: 8,
      children: [
        TextButton(
          onPressed: () {
            // Handle view file action
          },
          child: Text(
            'View File',
            style: TextStyle(
              color: Color.fromARGB(255, 241, 114, 3),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap, // Handle item tap (e.g., navigate to details page)
  );
}


}
