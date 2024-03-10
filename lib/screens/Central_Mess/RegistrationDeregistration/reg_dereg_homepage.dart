import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'register.dart';
import 'deregister.dart';
import 'manage_registrations.dart';
import 'package:fusion/models/profile.dart';

class ManageRegDeReg extends StatefulWidget {
  @override
  _ManageRegDeRegState createState() => _ManageRegDeRegState();
}

class _ManageRegDeRegState extends State<ManageRegDeReg> {
  String? user;
  bool? isRegistered = false;
  @override
  Widget build(BuildContext context) {
    final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
    user = data.profile!['user_type'];
    // user = "caretaker";
    //user = "warden";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length:  1, // length of tabs
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
                        Tab(
                          child: Text(
                            "Manage Registrations",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (user == "student" && isRegistered==false)
                        Tab(
                          child: Text(
                            "Register",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (user == "student" && isRegistered==true)
                        Tab(
                          child: Text(
                            "De-Register",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child:  TabBarView(
                      children: <Widget>[
                        if (user == "student" && isRegistered==false) ...[
                          Register(),
                        ],
                        if (user == "student" && isRegistered==true) ...[
                          DeRegister(),
                        ],
                        if (user != "student") ...[
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
