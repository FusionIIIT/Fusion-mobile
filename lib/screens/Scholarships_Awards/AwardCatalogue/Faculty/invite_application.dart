import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/Faculty/invite_app.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/Faculty/recent_app.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/catalogue.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/previous_winners.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/spacs_memebers_details.dart';
import 'package:http/http.dart';

class InviteApplication extends StatefulWidget {
  @override
  _InviteApplicationState createState() =>
      _InviteApplicationState();
}

class _InviteApplicationState
    extends State<InviteApplication> {
  bool _loading1 = true;

  int step = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //Default TabController for tab scrollbar with number of elements equal to 4
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Invite Applications",
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
                    'Invite Applications',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Recent Invite Applications',
                  ),
                ),
              ),
            ],
          ),
        ),
        //TabBarView contains all the children to be called when tapped.
        body: TabBarView(
          children: [
            InviteApplications(),
            RecentInviteApplications(),
          ],
        ),
      ),
    );
  }
}
