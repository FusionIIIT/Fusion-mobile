import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Registration/courses.dart';
import 'package:fusion/screens/Academic/Registration/final_registration.dart';
import 'package:fusion/screens/Academic/Registration/pre_registration.dart';

class RegistrationHomePage extends StatefulWidget {
  @override
  _RegistrationHomePageState createState() => _RegistrationHomePageState();
}

class _RegistrationHomePageState extends State<RegistrationHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
          backgroundColor: Colors.grey[900],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Courses',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Pre-Registration',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Final Registration',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Courses(),
            FinalRegistration(),
            PreRegistration(),
          ],
        ),
      ),
    );
  }
}
