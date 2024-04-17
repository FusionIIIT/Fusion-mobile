import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/add_remove_student.dart';
import 'manage_registrations.dart';
import 'package:fusion/models/profile.dart';

class ManageRegDeRegHomepage extends StatefulWidget {
  @override
  _ManageRegDeRegHomepageState createState() => _ManageRegDeRegHomepageState();
}

class _ManageRegDeRegHomepageState extends State<ManageRegDeRegHomepage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    var userMessData = arguments?['userMessData'];
    // bool? isRegistered = (user == 'student' && userMessData?['current_mess_status'] == 'Registered');
    // print('$userMessData, $isRegistered');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length:  2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      if (user == "caretaker" || user == "warden")
                        ...[
                          Tab(
                            child: Text(
                              "View List",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Add/Remove Student",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],

                    ],
                  ),
                ),
                Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child:  TabBarView(
                      children: <Widget>[
                        if (user == "caretaker" || user=="warden") ...[
                          // ViewRegDeRegList(),
                          ManageRegistrations(),
                        ],
                      ],
                    )
                )
              ])
          ),
        ]),
      ),
    );
  }
}
