import 'package:flutter/material.dart';
import 'apply_for_special_food.dart';
import 'special_food_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class RequestSpecialFood extends StatefulWidget {
  @override
  _RequestSpecialFoodState createState() => _RequestSpecialFoodState();
}

class _RequestSpecialFoodState extends State<RequestSpecialFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("Request Special Food",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Special Food History",style: TextStyle(fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
                Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      RequestForSpecialFood(),
                      HistoryOfSpecialFood(),

                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
