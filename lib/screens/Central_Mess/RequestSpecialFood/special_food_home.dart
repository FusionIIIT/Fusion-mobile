import 'package:flutter/material.dart';
import 'apply_for_special_food.dart';
import 'special_food_history.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'active_request_for_special_food.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class SpecialFood extends StatefulWidget {
  @override
  _SpecialFoodState createState() => _SpecialFoodState();
}

class _SpecialFoodState extends State<SpecialFood> {

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? user = arguments?['user'];
    user = user?.toLowerCase();

    return SafeArea(
    bottom: true,
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Central Mess",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
          if (curr_desig.toLowerCase() != "student" && curr_desig.toLowerCase() != "mess_manager" && curr_desig.toLowerCase() != "mess_warden") {
            Navigator.pushReplacementNamed(context, "/dashboard"); // Redirect to home ("/dashboard")
          }
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      // bottomNavigationBar: MyBottomNavigationBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5.0),
            Expanded(
                child: DefaultTabController(
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
                      Expanded(
                          child: Container(
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
                          ))
                    ],
                  ),
                ),)
          ],
        ),
      ),
    );
  }
}