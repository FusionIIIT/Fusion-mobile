import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PHCAnnouncement {
  final String title;
  final DateTime dateTime;

  PHCAnnouncement({required this.title, required this.dateTime});
}

class MyApp extends StatelessWidget {
  final List<PHCAnnouncement> announcements = [
    PHCAnnouncement(
      title: "Important Announcement 1",
      dateTime: DateTime(2024, 2, 20, 10, 30), // Dummy data
    ),
    PHCAnnouncement(
      title: "Important Announcement 2",
      dateTime: DateTime(2024, 2, 19, 15, 45), // Dummy data
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Announcements',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewAnnouncementPage(),
    );
  }
}

class ViewAnnouncementPage extends StatelessWidget {
  final List<PHCAnnouncement> announcements = [
    PHCAnnouncement(
      title: "Announcement 1",
      dateTime: DateTime(2024, 2, 20, 10, 30), // Dummy data
    ),
    PHCAnnouncement(
      title: "Announcement 2",
      dateTime: DateTime(2024, 2, 19, 15, 45), // Dummy data
    ),
  ];

  // ViewAnnouncementPage({required this.announcements});

  @override
  Widget build(BuildContext context) {
    announcements.sort(
        (a, b) => b.dateTime.compareTo(a.dateTime)); // Sort in reverse order

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300], // Setting gray background color
            borderRadius: BorderRadius.circular(12.0), // Adding border radius
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding for ListTile content
            title: Text(announcement.title),
             // Tile color (overrides container color if not null)
            subtitle: Text(
              '${announcement.dateTime.day}/${announcement.dateTime.month}/${announcement.dateTime.year} '
              '${announcement.dateTime.hour}:${announcement.dateTime.minute}',
            ),
          ),
        ),
      );
        },
      ),
    );
  }
}
