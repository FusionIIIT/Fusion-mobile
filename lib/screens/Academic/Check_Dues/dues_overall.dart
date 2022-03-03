// import 'package:fusion/models/academic.dart';
import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';

class OverallDues extends StatefulWidget {
  @override
  _OverallDuesState createState() => _OverallDuesState();
}

class _OverallDuesState extends State<OverallDues> {
  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)!.settings.arguments as AcademicData;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text('Your Entry in Dues is not entered yet.'),
      ),
    );
  }
}
