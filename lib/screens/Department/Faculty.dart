import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart';
import 'package:fusion/Components/faculty_card.dart';

class Faculty extends StatefulWidget {
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: DefaultAppBar().buildAppBar(),
            drawer: SideDrawer(),
            body: Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                    ],
                  ),
                  Row(
                    children: [
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                    ],
                  ),
                  Row(
                    children: [
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                      FacultyCard(
                          name: 'John Smith',
                          email: 'john.smith@university.edu',
                          department: 'Computer Science',
                          researchInterest: 'Artificial Intelligence'),
                    ],
                  )
                ],
              ),
            ))));
  }
}
