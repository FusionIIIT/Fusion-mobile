import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
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
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            "Thesis",
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
        ),
       ],
        drawer: SideDrawer(),
        body: Container(
          child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                DefaultTabController(
                  length: 5, // length of tabs
                  initialIndex: 0,
                  child: Column(children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        isScrollable: true,
                        indicatorColor: Colors.black,
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
                    Container(
                      height: 400, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(
                        children: [
                          Container(
                            child: RegisteredThesis(),
                          ),
                          Container(
                            child: AddThesis(),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
