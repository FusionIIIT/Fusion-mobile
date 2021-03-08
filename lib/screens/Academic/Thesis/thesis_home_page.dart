import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Thesis/add_thesis_topic.dart';
import 'package:fusion/screens/Academic/Thesis/registered_thesis.dart';
import 'package:fusion/screens/Login%20and%20Dashboard/Components/side_drawer.dart';

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
          backgroundColor: Colors.black,
          title: Text(
            "FUSION",
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
        drawer: SideDrawer(),
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
