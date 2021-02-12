import 'package:flutter/material.dart';

class AcademicHomePage extends StatefulWidget {
  @override
  _AcademicHomePageState createState() => _AcademicHomePageState();
}

class _AcademicHomePageState extends State<AcademicHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Academic"),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Current Semester"),
          ),
          ListTile(
            title: Text("Registration"),
          ),
          ListTile(
            title: Text("Check Dues"),
          ),
          ListTile(
            title: Text("Apply for Bonafide"),
          ),
          ListTile(
            title: Text("Check Attendance"),
          ),
          ListTile(
            title: Text("Branch Change"),
          ),
          ListTile(
            title: Text("Evaluate Teaching Credits"),
          ),
          ListTile(
            title: Text("Thesis"),
          ),
          ListTile(
            title: Text("View Performance"),
          ),
        ],
      ),
    );
  }
}
