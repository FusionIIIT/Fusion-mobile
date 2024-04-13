import 'package:flutter/material.dart';
import 'apply_for_vacation_food.dart';
import 'vacation_food_history.dart';
import 'vacation_food_requests.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class VacationFoodHome extends StatefulWidget {
  @override
  _VacationFoodHomeState createState() => _VacationFoodHomeState();
}

class _VacationFoodHomeState extends State<VacationFoodHome> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
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
                                  "Request For Vacation Food",
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
                                  "Active Requests For Vacation Food",
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
                              VacationFoodForm(),
                              HistoryOfVactionFood(),
                            ],
                          )
                        : TabBarView(
                            children: <Widget>[
                              VacationFoodRequest(),
                              HistoryOfVactionFood(),
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
