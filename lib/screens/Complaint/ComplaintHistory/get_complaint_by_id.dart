import 'package:flutter/material.dart';

class GetComplaintByID extends StatefulWidget {
  @override
  _GetComplaintByIDState createState() => _GetComplaintByIDState();
}

class _GetComplaintByIDState extends State<GetComplaintByID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Enter any Complaint ID'),
      ),
    );
  }
}
