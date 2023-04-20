import 'package:flutter/material.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class RecentInviteApplications extends StatefulWidget {
  @override
  _RecentInviteApplicationsState createState() =>
      _RecentInviteApplicationsState();
}

class _RecentInviteApplicationsState extends State<RecentInviteApplications> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? programme_type;
  List complaintTypeItem = [
    "Directors Gold Medal",
    "Directors Silver Medal",
    'Notional Prizes',
    'MCM Scholarship',
    'D&M Proficiency Gold Medal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Recent Invite Applications",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            Container(
              
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.all(4),
                children: [
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shadowColor: Colors.black,
                    color: Color.fromARGB(153, 204, 204, 204),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.all(40)),
                        new Container(
                          alignment: Alignment.center,
                          child: Column(children: [
                            TextButton(
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(14)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange)),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "Update",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
