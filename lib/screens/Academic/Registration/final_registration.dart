import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

class FinalRegistration extends StatefulWidget {
  @override
  _FinalRegistrationState createState() => _FinalRegistrationState();
}

class _FinalRegistrationState extends State<FinalRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? programme_type;
  List programmeTypeItem = [
    'B.Tech',
    'B.des',
    'M.Tech',
    'PhD',
  ];
  String? scholarship_type;
  List scholarshipTypeItem = [
    'MCM',
    'NSP',
    'Random',
  ];
  String? academicyear;
  List academicyearTypeItem = [
    '1st',
    '2nd',
    '3rd',
    '4th',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: [
            new Container(
              child: new Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Final Reistration:",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            new Container(
                child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Text('Course ID', style: TextStyle(fontSize: 14.0))
                      ]),
                      Column(children: [
                        Text('Course Code', style: TextStyle(fontSize: 14.0))
                      ]),
                      Column(children: [
                        Text('User Name', style: TextStyle(fontSize: 14.0))
                      ]),
                      Column(children: [
                        Text('Semester', style: TextStyle(fontSize: 14.0))
                      ]),
                    ]),
                    // TableRow(children: [
                    //   Column(children: [Text('Award_Name')]),
                    //   Column(children: [Text('Student_Name')]),
                    //   Column(children: [Text('2020')]),
                    // ]),
                  ],
                ),
              ),
            ]))
          ],
        ),

        //Table
      ),
    );
  }
}
