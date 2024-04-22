import 'package:flutter/material.dart';
import 'apply_for_vacation_food.dart';
import 'vacation_food_history.dart';
import 'vacation_food_requests.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class VacationFoodHome extends StatefulWidget {
  @override
  _VacationFoodHomeState createState() => _VacationFoodHomeState();
}

class _VacationFoodHomeState extends State<VacationFoodHome> {

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? user = arguments?['user'];
    user = user?.toLowerCase();

    return Scaffold(
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
