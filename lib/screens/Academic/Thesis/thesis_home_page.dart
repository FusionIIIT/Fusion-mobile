// @dart=2.9

import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Thesis/add_thesis_topic.dart';
import 'package:fusion/screens/Academic/Thesis/registered_thesis.dart';

class ThesisHomePage extends StatefulWidget {
  @override
  _ThesisHomePageState createState() => _ThesisHomePageState();
}

class _ThesisHomePageState extends State<ThesisHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thesis'),
          backgroundColor: Colors.grey[900],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Registered Thesis',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Add Thesis',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RegisteredThesis(),
            AddThesis(),
          ],
        ),
      ),
    );
  }
}
