import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Announcement {
  final String title;
  final String description;
  final DateTime dateTime;

  Announcement({
    required this.title,
    required this.description,
    required this.dateTime,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Announcements',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnnouncementPage(),
    );
  }
}

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  List<Announcement> announcements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(announcements[index].title),
            subtitle: Text(
                '${announcements[index].dateTime.day}/${announcements[index].dateTime.month}/${announcements[index].dateTime.year} ${announcements[index].dateTime.hour}:${announcements[index].dateTime.minute}'),
            onTap: () {
              // Handle onTap event
              // For example, navigate to a detailed page
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Call a method to show a dialog for entering new announcement details
          final newAnnouncement = await _showAddAnnouncementDialog(context);
          if (newAnnouncement != null) {
            setState(() {
              announcements.add(newAnnouncement);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Announcement?> _showAddAnnouncementDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    return showDialog<Announcement>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Announcement'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Date'),
              ),
              TextButton(
                onPressed: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                child: Text('Select Time'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(Announcement(
                  title: titleController.text,
                  description: descriptionController.text,
                  dateTime: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ),
                ));
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
