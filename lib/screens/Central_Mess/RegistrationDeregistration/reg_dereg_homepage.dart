import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/deregistration_history.dart';
import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/registration_history.dart';
import 'register.dart';
import 'deregister.dart';
import 'registration_requests.dart';
import 'deregistration_requests.dart';
import 'package:fusion/models/profile.dart';

class RegDeReg extends StatefulWidget {
  @override
  _RegDeRegState createState() => _RegDeRegState();
}

class _RegDeRegState extends State<RegDeReg> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    var userMessData = arguments?['userMessData'];
    bool? isRegistered = (user == 'student' && userMessData?['current_mess_status'] == 'Registered');
    // print('$userMessData, $isRegistered');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
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
                              "Registration Status",
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
                              "Deregistration Status",
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
// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/deregistration_history.dart';
// import 'package:fusion/screens/Central_Mess/RegistrationDeregistration/registration_history.dart';
// import 'register.dart';
// import 'deregister.dart';
// import 'registration_requests.dart';
// import 'deregistration_requests.dart';
// import 'package:fusion/models/profile.dart';
//
// class RegDeReg extends StatefulWidget {
//   @override
//   _RegDeRegState createState() => _RegDeRegState();
// }
//
// class _RegDeRegState extends State<RegDeReg> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic>? arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     ProfileData data = ProfileData.fromJson(arguments?['profileData']);
//     String? user = arguments?['user'];
//     user = user?.toLowerCase();
//     // user = "caretaker";
//     //user = "warden";
//     var userMessData = arguments?['userMessData'];
//     bool? isRegistered = (user == 'student' && userMessData?['current_mess_status'] == 'Registered');
//     // print('$userMessData, $isRegistered');
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
//       drawer: SideDrawer(),
//       body:Container(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
//           SizedBox(height: 5.0),
//           DefaultTabController(
//               length:  2, // length of tabs
//               initialIndex: 0,
//               child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
//                 Container(
//                   //color: Colors.deepOrangeAccent,
//                   child: TabBar(
//                     labelColor: Colors.deepOrange,
//                     indicatorColor: Colors.deepOrangeAccent,
//                     unselectedLabelColor: Colors.black,
//                     tabs: [
//                       if (user == "caretaker")
//                         ...[
//                           Tab(
//                             child: Text(
//                               "Registration Requests",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Tab(
//                             child: Text(
//                               "De-registration Requests",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       if (user == "student" && isRegistered == false)
//                         ...[
//                             Tab(
//                               child: Text(
//                                 "Registration",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//
//                             Tab(
//                             child: Text(
//                               "Registration Status",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       if (user == "student" && isRegistered == true)
//                         ...[
//                             Tab(
//                               child: Text(
//                                 "Deregistration",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//
//                             Tab(
//                             child: Text(
//                               "Deregistration Status",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                     ],
//                   ),
//                 ),
//                 Container(
//                     height: 590, //height of TabBarView
//                     decoration: BoxDecoration(
//                         border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
//                     ),
//                     child:  TabBarView(
//                       children: <Widget>[
//                         if (user == "student" && isRegistered==false) ...[
//                           Register(),
//                           RegistrationHistory(userMessData: userMessData),
//                         ],
//                         if (user == "student" && isRegistered==true) ...[
//                           DeRegister(),
//                           DeRegistrationHistory(userMessData: userMessData),
//                         ],
//                         if (user =="caretaker") ...[
//                           RegistrationRequests(),
//                           DeRegistrationRequests(),
//                         ],
//                       ],
//                     )
//                 )
//               ])
//           ),
//         ]),
//       ),
//     );
//   }
// }
