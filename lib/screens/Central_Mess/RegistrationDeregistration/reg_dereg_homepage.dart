import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/deregistration_history.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/registration_history.dart';
import 'register.dart';
import 'deregister.dart';
import 'registration_requests.dart';
import 'deregistration_requests.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class RegDeReg extends StatefulWidget {
  @override
  _RegDeRegState createState() => _RegDeRegState();
}

class _RegDeRegState extends State<RegDeReg> {

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    var userMessData = arguments?['userMessData'];
    bool? isRegistered = (user == 'student' && userMessData?['current_mess_status'] == 'Registered');
    // print('$userMessData, $isRegistered');
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
                      if (user == "caretaker")
                        ...[
                          Tab(
                            child: Text(
                              "Registration Requests",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "De-registration Requests",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      if (user == "student" && isRegistered == false)
                        ...[
                            Tab(
                              child: Text(
                                "Registration",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Tab(
                            child: Text(
                              "Registration History",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      if (user == "student" && isRegistered == true)
                        ...[
                            Tab(
                              child: Text(
                                "Deregistration",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Tab(
                            child: Text(
                              "Deregistration History",
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
                        if (user == "student" && isRegistered==false) ...[
                          Register(),
                          RegistrationHistory(userMessData: userMessData),
                        ],
                        if (user == "student" && isRegistered==true) ...[
                          DeRegister(),
                          DeRegistrationHistory(userMessData: userMessData),
                        ],
                        if (user =="caretaker") ...[
                          RegistrationRequests(),
                          DeRegistrationRequests(),
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
