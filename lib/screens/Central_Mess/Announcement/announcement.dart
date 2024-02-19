import 'package:flutter/material.dart';
import 'make_announcement.dart';
import 'announcement_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  String? user;

  @override
  void initState() {
    super.initState();
    // Simulating different user types
    user = "caretaker"; // Change to "caretaker" to see the caretaker view
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5.0),
            DefaultTabController(
              length: user == "student" ? 1 : 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Colors.deepOrange,
                      indicatorColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.black,
                      tabs: [

                        if (user == "caretaker")
                          Tab(
                            child: Text(
                              "Make Announcement",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                        Tab(
                          child: Text(
                            "Announcement History",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                      border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                    ),
                    child: TabBarView(
                      children: <Widget>[

                        if (user == "caretaker") MakeAnnouncement(),
                        AnnouncementHistory(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
