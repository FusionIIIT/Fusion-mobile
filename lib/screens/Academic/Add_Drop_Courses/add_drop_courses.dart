import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class AddDropCourses extends StatefulWidget {
  @override
  _AddDropCoursesState createState() => _AddDropCoursesState();
}

class _AddDropCoursesState extends State<AddDropCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Add/Drop Courses",
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
      ), // Appbar
      drawer: SideDrawer(),
      body: Container(
        child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text(
                                'Add Course',
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'Drop Course',
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
                          Center(
                            child: Text(
                              "Add Course(s)\nYou have to wait for the date",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Drop Course(s)\nYou have to wait for the date",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(child: Text('Current Credits : 0')),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
