import 'package:flutter/material.dart';

class AddThesis extends StatefulWidget {
  @override
  _AddThesisState createState() => _AddThesisState();
}

class _AddThesisState extends State<AddThesis> {
  String courseCode="";
  String researchArea="";
  String theme="";
  String supervisor="";
  String cosupervisor="";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Form(
        key: _formKey,
        child: Column(
          children:[
            TextFormField(
              decoration: InputDecoration(),
            ),
          ]
        )
      )
    );
  }
}
