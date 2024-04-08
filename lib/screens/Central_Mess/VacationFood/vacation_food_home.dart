import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'vacation_food_requests.dart';
import 'apply_for_vacation_food.dart';

class VacationFoodHome extends StatefulWidget {
  @override
  _VacationFoodHomeState createState() => _VacationFoodHomeState();
}

class _VacationFoodHomeState extends State<VacationFoodHome> {
  bool? isRegistered = false;
  @override
  Widget build(BuildContext context) {
    final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
    String user = data.profile!['user_type'];
    user = user.toLowerCase();
    user = "caretaker";
    //user = "warden";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length:  1,
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      if (user == "caretaker")
                        ...[
                          Tab(
                            child: Text(
                              "Vacation Food Requests",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      if (user == "student")
                        Tab(
                          child: Text(
                            "Apply for Vacation Food",
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
                    child:  TabBarView(
                      children: <Widget>[
                        if (user == "student") ...[
                          VacationFoodForm(),
                        ],
                        if (user == "caretaker") ...[
                          VacationFoodRequests(),
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
