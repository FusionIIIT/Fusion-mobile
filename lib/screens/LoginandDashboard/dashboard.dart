// import 'dart:async';
// import 'dart:convert';
// import 'package:fusion/models/profile.dart';
// import 'package:fusion/services/profile_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/dashboard.dart';
// import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
// import 'package:fusion/services/dashboard_service.dart';
// import 'package:fusion/services/updatesession.dart';
// import 'package:fusion/services/viewclubdetails.dart';
// import 'package:http/http.dart';

// String clubb = "";

// class Dashboard extends StatefulWidget {
//   static String tag = 'home-page';
//   Dashboard();
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   bool _notificationsBool = true;
//   bool _newsBool = false;
//   bool _announcementsBool = false;
//   bool _loading = true;
//   late String name = "manu";
//   late String studentType;
//   late String designation = "student";
//   late String club = "";
//   // Stream Controller for API
//   late StreamController _dashboardController;
//   late DashboardService dashboardService;
//   late DashboardData data;
//   late StreamController _profileController;
//   late ProfileService profileService;
//   late ViewClubDetails clubDetailsService = ViewClubDetails();
//   late ProfileData data2;
//   @override
//   void initState() {
//     super.initState();
//     _dashboardController = StreamController();
//     dashboardService = DashboardService();
//     _profileController = StreamController();
//     profileService = ProfileService();
//     getData();
//   }

//   getData() async {
//     try {
//       // Fetch profile data first
//       // Fetch dashboard data
//       Response response = await dashboardService.getDashboard();
//       Response response2 = await profileService.getProfile();
//       List<dynamic> clubDetails = await clubDetailsService.getClubDetails();
//       if (response.statusCode == 200) {
//         data = DashboardData.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception(
//             'Failed to load dashboard data: ${response.statusCode}');
//       }
//       if (response2.statusCode == 200) {
//         data2 = ProfileData.fromJson(jsonDecode(response2.body));
//         // Assign the username to the name variable
//         name = data2.user!["username"];
//       } else {
//         throw Exception('Failed to load profile data: ${response2.statusCode}');
//       }
//       // Fetch club details
//       // Find the club associated with the user
//       for (var clubDetail in clubDetails) {
//         if (clubDetail['co_ordinator'] == name) {
//           setState(() {
//             // Update the club name
//             club = clubDetail['club_name'];
//           });
//           break;
//         }
//       }
//       print(club);
//       clubb = club;

//       setState(() {
//         // Update UI state
//         _loading = false;
//         studentType = data2.profile!['department']!['name'] +
//             '  ' +
//             data2.profile!['user_type'];
//         designation = data.designation![0];
//         print(designation);
//       });
//     } catch (e, stackTrace) {
//       // Print error and stack trace for debugging
//       print('Error: $e');
//       print('Stack Trace: $stackTrace');

//       // Show error message to the user
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('An error occurred while loading data: $e'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   loadData() async {
//     getData().then((res) {
//       _dashboardController.add(res);
//       _profileController.add(res);
//     });
//   }

//   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//   showSnack() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('New Content Loaded'),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar()
//           .buildAppBar(), // This is default app bar used in all modules
//       drawer: SideDrawer(designation: designation, club: club),
//       // This is sideDrawer used in all modules
//       body: _loading == true
//           ? Center(child: CircularProgressIndicator())
//           : StreamBuilder(
//               stream: _dashboardController.stream,
//               builder: (context, AsyncSnapshot snapshot) {
//                 return ListView(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   children: [
//                     Card(
//                       elevation: 2.0,
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 50.0, vertical: 20.0),
//                       shadowColor: Colors.black,
//                       child: Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: 20.0),
//                             width: 170.0,
//                             height: 170.0,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage('assets/profile_pic.png'),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             name, //Display name of User
//                             style:
//                                 TextStyle(fontSize: 20.0, color: Colors.black),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             designation +
//                                 " " +
//                                 "-" +
//                                 club, // Display Type of User
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Card(
//                       color: Colors.black,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 _notificationsBool = true;
//                                 _announcementsBool = false;
//                                 _newsBool = false;
//                                 setState(() {
//                                   _notificationsBool = true;
//                                   _announcementsBool = false;
//                                   _newsBool = false;
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Notifications',
//                                     style: TextStyle(
//                                       fontSize: 16.0,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.notifications_active_rounded,
//                                     color: _notificationsBool
//                                         ? Colors.deepOrangeAccent
//                                         : Colors.white,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 _newsBool = true;
//                                 _announcementsBool = false;
//                                 _notificationsBool = false;
//                                 setState(() {
//                                   _newsBool = true;
//                                   _announcementsBool = false;
//                                   _notificationsBool = false;
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'News',
//                                     style: TextStyle(
//                                       fontSize: 16.0,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.email,
//                                     color: _newsBool
//                                         ? Colors.deepOrangeAccent
//                                         : Colors.white,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 _announcementsBool = true;
//                                 _newsBool = false;
//                                 _notificationsBool = false;
//                                 setState(() {
//                                   _announcementsBool = true;
//                                   _newsBool = false;
//                                   _notificationsBool = false;
//                                 });
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 16.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Announcements',
//                                       style: TextStyle(
//                                         fontSize: 16.0,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.announcement,
//                                       color: _announcementsBool
//                                           ? Colors.deepOrangeAccent
//                                           : Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     _notificationsBool
//                         ? NotificationCard(
//                             notifications: data.notifications,
//                           )
//                         : NewsCard(),
//                   ],
//                 );
//               },
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _dashboardController.close();
//     super.dispose();
//   }
// }

// class clubname {
//   String clubnam() {
//     return clubb;
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:fusion/services/updatesession.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:http/http.dart';

import '../../services/change_club_position.dart';

class Dashboard extends StatefulWidget {
  late String clubb = "";
  static String tag = 'home-page';
  Dashboard();
  @override
  _DashboardState createState() => _DashboardState();
  String clubnam() {
    return clubb;
  }
}

class _DashboardState extends State<Dashboard> {
  bool _notificationsBool = true;
  bool _newsBool = false;
  bool _announcementsBool = false;
  bool _loading = true;
  late String name = "manu";
  late String studentType;
  late String designation = "student";
  late String club = "";

  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ViewClubDetails clubDetailsService = ViewClubDetails();
  late ProfileData data2;

  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getCData();
  }

  getCData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      List<dynamic> clubDetails = await clubDetailsService.getClubDetails();
      if (response.statusCode == 200) {
        data = DashboardData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load dashboard data: ${response.statusCode}');
      }
      if (response2.statusCode == 200) {
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        name = data2.user!["username"];
      } else {
        throw Exception('Failed to load profile data: ${response2.statusCode}');
      }

      String? userClub;
      // Find the club associated with the user
      for (var clubDetail in clubDetails) {
        if (clubDetail['co_ordinator'] == name) {
          userClub = clubDetail['club_name'];
          break;
        }
      }

      setState(() {
        // Update UI state
        widget.clubb = userClub ?? "";
        club = userClub ?? ""; // Provide a default value if userClub is null
        _loading = false;
        studentType = data2.profile!['department']!['name'] +
            '  ' +
            data2.profile!['user_type'];

        if (club != "")
          designation = "co_ordinator";
        else
          designation = data.designation![0];
        print(designation);
      });
    } catch (e, stackTrace) {
      // Print error and stack trace for debugging
      print('Error: $e');
      print('Stack Trace: $stackTrace');

      // Show error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while loading data: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('New Content Loaded'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar()
          .buildAppBar(), // This is default app bar used in all modules
      drawer: SideDrawer(designation: designation),
      // This is sideDrawer used in all modules
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: _dashboardController.stream,
              builder: (context, AsyncSnapshot snapshot) {
                return ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            width: 170.0,
                            height: 170.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/profile_pic.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            name, //Display name of User
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            designation +
                                " " +
                                "-" +
                                club, // Display Type of User
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _notificationsBool = true;
                                _announcementsBool = false;
                                _newsBool = false;
                                setState(() {
                                  _notificationsBool = true;
                                  _announcementsBool = false;
                                  _newsBool = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.notifications_active_rounded,
                                    color: _notificationsBool
                                        ? Colors.deepOrangeAccent
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _newsBool = true;
                                _announcementsBool = false;
                                _notificationsBool = false;
                                setState(() {
                                  _newsBool = true;
                                  _announcementsBool = false;
                                  _notificationsBool = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'News',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: _newsBool
                                        ? Colors.deepOrangeAccent
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _announcementsBool = true;
                                _newsBool = false;
                                _notificationsBool = false;
                                setState(() {
                                  _announcementsBool = true;
                                  _newsBool = false;
                                  _notificationsBool = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Announcements',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.announcement,
                                      color: _announcementsBool
                                          ? Colors.deepOrangeAccent
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _notificationsBool
                        ? NotificationCard(
                            notifications: data.notifications,
                          )
                        : NewsCard(),
                  ],
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}
