import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/remove_student.dart';
import 'manage_registrations.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ManageRegDeRegHomepage extends StatefulWidget {
  @override
  _ManageRegDeRegHomepageState createState() => _ManageRegDeRegHomepageState();
}

class _ManageRegDeRegHomepageState extends State<ManageRegDeRegHomepage> {

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
    // bool? isRegistered = (user == 'student' && userMessData?['current_mess_status'] == 'Registered');
    // print('$userMessData, $isRegistered');
    return SafeArea(
    bottom: true,
        child:Scaffold(
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
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 5.0),
          Expanded(
            child: DefaultTabController(
              length: user == "caretaker" ? 2 : 1, // length of tabs
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
                              "View List",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Remove Student",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      if (user == "warden")
                        ...[
                          Tab(
                            child: Text(
                              "View List",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],

                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child:  TabBarView(
                      children: <Widget>[
                        if (user == "caretaker") ...[
                          ManageRegistrations(),
                          AddRemoveStudents(),
                        ],
                        if (user=="warden") ...[
                          ManageRegistrations(),
                        ],
                      ],
                    )
                )
                )
              ])
          ),)
        ]),
        ),
    );
  }
}
