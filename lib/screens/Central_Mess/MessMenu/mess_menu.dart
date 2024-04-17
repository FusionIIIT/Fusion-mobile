import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'view_menu.dart';
import 'update_menu.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class MessMenu extends StatefulWidget {
  @override
  _MessMenuState createState() => _MessMenuState();
}

class _MessMenuState extends State<MessMenu> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    Map<String, dynamic> userMessData = arguments?['userMessData'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length: (user == 'student' || user== 'warden') ? 1 : 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("View Menu",style: TextStyle(fontWeight: FontWeight.bold),),),
                      if (user == 'caretaker') // Conditionally render "Update Menu" tab
                        Tab(
                          child: Text(
                            "Update Menu",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      ViewMenu(userMessData: userMessData, user: user),
                      if (user == 'caretaker') // Conditionally render "Update Menu" tab
                        UpdateMenu(),

                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
