// import 'package:fusion/models/academic.dart';
import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues_hostel.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues_overall.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues_placement.dart';
import 'package:fusion/screens/Academic/Check_Dues/mess_dues.dart';
// import 'package:fusion/screens/Academic/Check_Dues/mess_dues.dart';
import 'package:fusion/screens/Academic/Check_Dues/dues_library.dart';

class Dues extends StatefulWidget {
  @override
  _DuesState createState() => _DuesState();
}

class _DuesState extends State<Dues> {
  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)!.settings.arguments as AcademicData;
    return DefaultTabController(
      //Default TabController for tab scrollbar with number of elements equal to 4
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            "Check Dues",
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
                                'Mess Due History',
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'Library Due History',
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'Hostel Due History',
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'Placement Cell due history',
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'Overall',
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
                      //TabBarView contains all the children to be called when tapped.
                      child: TabBarView(
                        children: [
                          Container(
                            child: MessDues(),
                          ),
                          Container(
                            child: LibraryDues(),
                          ),
                          Container(
                            child: HostelDues(),
                          ),
                          Container(
                            child: PlaccementDues(),
                          ),
                          Container(
                            child: OverallDues(),
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
