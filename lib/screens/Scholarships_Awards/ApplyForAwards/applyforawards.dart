import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/screens/Scholarships_Awards/ApplyForAwards/Convocation.dart';
import 'package:fusion/screens/Scholarships_Awards/ApplyForAwards/MCMScholarship.dart';
import 'package:fusion/screens/Scholarships_Awards/ApplyForAwards/ViewApplications.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/catalogue.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/previous_winners.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/spacs_memebers_details.dart';
import 'package:http/http.dart';

class ApplyForAwards extends StatefulWidget {
  @override
  _ApplyForAwardsState createState() => _ApplyForAwardsState();
}

class _ApplyForAwardsState extends State<ApplyForAwards> {
  bool _loading1 = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Apply For Awards",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          //TabBar for a horizontal scrollable tob bar
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'MCM Scholarship',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Convocation Medals',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'View Applications Status',
                  ),
                ),
              ),
            ],
          ),
        ),
        //TabBarView contains all the children to be called when tapped.
        body: TabBarView(
          children: [
            MCMScholarship(),
            Convocation(),
            ViewApplications(),
          ],
        ),
      ),
    );
  }
}
