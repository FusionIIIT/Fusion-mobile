import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: 'Submit Event Report To Convenor',
    home: SubmitEventReportPage(),
  ));
}

class SubmitEventReportPage extends StatefulWidget {
  @override
  _SubmitEventReportPageState createState() => _SubmitEventReportPageState();
}

class _SubmitEventReportPageState extends State<SubmitEventReportPage> {
  int _selectedIndex = 0; // Set initial index to 0 for ComposeFilePage

  final List<Widget> _pages = [
    ComposeFilePage(),
    DraftsPage(),
    InboxPage(),
    OutboxPage(),
    TrackPage(),
    ArchivePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit Event Report To Convenor',
          style: TextStyle(color:Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  'Submit Event Report To Convenor',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text('Compose File', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Drafts', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Inbox', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Outbox', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Track', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Archive', style: TextStyle(color: Colors.orange)),
                onTap: () {
                  _onItemTapped(5);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Colors.white,
    );
  }
}

class ComposeFilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose File'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title of file',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Created as',
              ),
              items: <String>['Coordinator', 'Counselor', 'Convenor', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Remarks',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Forward To',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save to drafts
              },
              child: Text('Save to Drafts'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to send
              },
              child: Text('Send'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraftsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Drafts Page',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Inbox Page',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}

class OutboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Outbox Page',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}

class TrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Track Page',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}

class ArchivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Archive Page',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}



