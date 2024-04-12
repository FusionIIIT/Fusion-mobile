import 'package:flutter/material.dart';
import 'apply_for_special_food.dart';
import 'special_food_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'active_request_for_special_food.dart';
import 'package:fusion/models/profile.dart';

class SpecialFood extends StatefulWidget {
  @override
  _SpecialFoodState createState() => _SpecialFoodState();
}

class _SpecialFoodState extends State<SpecialFood> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";

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
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    //color: Colors.deepOrangeAccent,
                    child: TabBar(
                      labelColor: Colors.deepOrange,
                      indicatorColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.black,
                      tabs: user == 'student'
                          ? [
                        Tab(
                          child: Text(
                            "Request For Special Food",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Requests History",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                          : [
                        Tab(
                          child: Text(
                            "Active Requests For Special Food",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Requests History",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)),
                    ),
                    child: user == 'student'
                        ? TabBarView(
                      children: <Widget>[
                        ApplySpecialFood(),
                        HistoryOfSpecialFood(),
                      ],
                    )
                        : TabBarView(
                      children: <Widget>[
                        ActiveSpecialFoodRequest(),
                        HistoryOfSpecialFood(),
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