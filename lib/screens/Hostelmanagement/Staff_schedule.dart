import 'package:flutter/material.dart';
import 'Staff_schedule.dart';


import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CollegeDropdownPage(),
    );
  }
}

class CollegeDropdownPage extends StatefulWidget {
  @override
  _CollegeDropdownPageState createState() => _CollegeDropdownPageState();
}

class _CollegeDropdownPageState extends State<CollegeDropdownPage> {
  List<String> _collegeNames = ['College A', 'College B', 'College C'];
  late String _selectedCollege;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select College'),
      ),
      body: Center(
        child: DropdownButton(
          value: _selectedCollege,
          items: _collegeNames.map((collegeName) {
            return DropdownMenuItem(
              value: collegeName,
              child: Text(collegeName),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              Object? obj = "Hello World";
              String myString = obj.toString(); // Cast obj to String using toString()

              _selectedCollege = myString; newValue;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StaffListPage(collegeName: _selectedCollege),
              ),
            );
          },
        ),
      ),
    );
  }
}



class StaffListPage extends StatelessWidget {
  final String collegeName;

  StaffListPage({required this.collegeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$collegeName Staff'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Staff 1')),
          ListTile(title: Text('Staff 2')),
          ListTile(title: Text('Staff 3')),
          ListTile(title: Text('Staff 4')),
          // Add more staff details for the selected college here
        ],
      ),
    );
  }
}
