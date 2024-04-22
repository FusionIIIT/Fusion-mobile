import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer2.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class AddDropCourses extends StatefulWidget {
  @override
  _AddDropCoursesState createState() => _AddDropCoursesState();
}

class _AddDropCoursesState extends State<AddDropCourses> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
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
         drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
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
    );
  }
}
