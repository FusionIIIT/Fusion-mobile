import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {
            // Implement filter functionality
            // For example, show a filter dialog or update the list with filtered data
          },
        ),
      ],
      title: Text(
        'Notifications',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return ListTile(
      title: Text(
        'Mess Committee',
        style: TextStyle(
          color: isRead ? Colors.grey : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Mess module notification description goes here.',
        style: TextStyle(color: isRead ? Colors.grey : Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Implement delete functionality
              // For example, remove the notification from the list
            },
          ),
          IconButton(
            icon: Icon(Icons.mark_email_read),
            color: isRead ? Colors.grey : Colors.black,
            onPressed: () {
              setState(() {
                isRead = !isRead;
              });
            },
          ),
        ],
      ),
      onTap: () {
        // Implement onTap functionality
        // For example, navigate to a detailed page for the mess module
        setState(() {
          isRead = !isRead;
        });
      },
    );
  }
}
