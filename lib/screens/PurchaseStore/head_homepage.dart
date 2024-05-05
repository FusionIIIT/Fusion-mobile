// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
//
// class headHomePage extends StatefulWidget {
//   @override
//   headHomePageState createState() => headHomePageState();
// }
//
// class headHomePageState extends State<headHomePage> {
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//         color: Colors.deepOrangeAccent,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }
//
//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = '';
//     return Scaffold(
//       appBar:  AppBar(
//         title: Text('Head'),
//         backgroundColor: Colors.deepOrangeAccent,
//       ),
//
//       body: ListView(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         children: [
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//             shadowColor: Colors.black,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 20.0),
//                   width: 170.0,
//                   height: 170.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/unknown.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   'Arihant Jain',
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   'CSE',
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Text(
//                     "Purchase And Store",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.deepOrangeAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 2.0,
//                   )
//                 ],
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//               ),
//             ),
//           ),
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             shadowColor: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 InkWell(
//                   child: myContainer("New Request"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/new_request',
//                       arguments: data,
//                     );
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Pending"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/pending',
//                       arguments: data,
//                     );
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Approved Request"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/approved',
//                       arguments: data,
//                     );
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Rejected Request"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/rejected',
//                       arguments: data,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
//
// class adminHomePage extends StatefulWidget {
//   @override
//   adminHomePageState createState() => adminHomePageState();
// }
//
// class adminHomePageState extends State<adminHomePage> {
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//         color: Colors.deepOrangeAccent,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }
//
//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = '';
//     return Scaffold(
//       appBar: DefaultAppBar().buildAppBar(),
//       drawer: SideDrawer(),
//       body: ListView(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         children: [
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//             shadowColor: Colors.black,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 20.0),
//                   width: 170.0,
//                   height: 170.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/unknown.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   'Arihant Jain',
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   'CSE',
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Text(
//                     "Account Admin",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.deepOrangeAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 2.0,
//                   )
//                 ],
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//               ),
//             ),
//           ),
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             shadowColor: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 InkWell(
//                   child: myContainer("Audit"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/audit',
//                       arguments: data,
//                     );
//                   },
//                 ),
//                 InkWell(
//                   child: myContainer("Process Bill"),
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/purchase_store/process_bill',
//                       arguments: data,
//                     );
//                   },
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:fusion/Components/appBar2.dart';
// // import 'package:fusion/Components/side_drawer2.dart';
// // import 'package:fusion/services/service_locator.dart';
// // import 'package:fusion/services/storage_service.dart';
// // import 'package:fusion/Components/bottom_navigation_bar.dart';
// //
// //
// // class PurchaseStoreHomePage extends StatefulWidget {
// //   @override
// //   _PurchaseStoreHomePageState createState() => _PurchaseStoreHomePageState();
// // }
// //
// // class _PurchaseStoreHomePageState extends State<PurchaseStoreHomePage> {
// //   var service = locator<StorageService>();
// //   late String curr_desig = service.getFromDisk("Current_designation");
// //
// //   BoxDecoration myBoxDecoration() {
// //     return BoxDecoration(
// //       border: Border.all(
// //         color: Colors.deepOrangeAccent,
// //         width: 2.0,
// //         style: BorderStyle.solid,
// //       ),
// //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
// //     );
// //   }
// //
// //   Text myText(String text) {
// //     return Text(
// //       text,
// //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
// //     );
// //   }
// //
// //   Padding myContainer(String text) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Container(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: myText(text),
// //         ),
// //         decoration: myBoxDecoration(),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final data = '';
// //     return Scaffold(
// //       appBar: CustomAppBar(
// //         curr_desig: curr_desig,
// //         headerTitle: "Purchase And Store",
// //         onDesignationChanged: (newValue) {
// //           setState(() {
// //             curr_desig = newValue;
// //           });
// //
// //         },
// //       ), // This is default app bar used in all modules
// //       drawer: SideDrawer(curr_desig: curr_desig),
// //       bottomNavigationBar:
// //       MyBottomNavigationBar(),
// //
// //       body: ListView(
// //         shrinkWrap: true,
// //         physics: ClampingScrollPhysics(),
// //         children: [
// //
// //
// //           Card(
// //             elevation: 2.0,
// //             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// //             shadowColor: Colors.black,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //
// //
// //                 InkWell(
// //                   child: myContainer("Indent Form"),
// //                   onTap: () {
// //                     Navigator.pushNamed(
// //                       context,
// //                       '/purchase_store/indent_form',
// //                       arguments: data,
// //                     );
// //                   },
// //                 ),
// //                 InkWell(
// //                   child: myContainer("Inbox"),
// //                   onTap: () {
// //                     Navigator.pushNamed(
// //                       context,
// //                       '/purchase_store/inbox',
// //                       arguments: data,
// //                     );
// //                   },
// //                 ),
// //                 InkWell(
// //                   child: myContainer("Saved Indent"),
// //                   onTap: () {
// //                     Navigator.pushNamed(
// //                       context,
// //                       '/purchase_store/saved_indent',
// //                       arguments: data,
// //                     );
// //                   },
// //                 ),
// //                 InkWell(
// //                   child: myContainer("Filed Indent"),
// //                   onTap: () {
// //                     Navigator.pushNamed(
// //                       context,
// //                       '/purchase_store/filed_indent',
// //                       arguments: data,
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/appBar_services.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class  headHomePage extends StatefulWidget {
  static String tag = 'home-page';
  headHomePage();
  @override
  _headHomePageState createState() => _headHomePageState();
}

class _headHomePageState extends State<headHomePage> {
  bool _notificationsBool = false;
  bool _newsBool = false;
  bool _announcementsBool = false;
  bool _homeBool = true;

  bool _loading = true;
  late String name;
  late String studentType;
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  late List<String> designationsArray;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool isStudent = false;

  final appBarServices _appBarServices = appBarServices();
  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      print("gfsgsgd");
      Response response = await dashboardService.getDashboard();
      print("1");
      Response response2 = await profileService.getProfile();
      print("2");
      print(response);
      print(response2);

      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      print(data2.user!);
      print(
          '-----------------------------------=---------------------------------------');
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'];

      if (data2.profile!['user_type'] == 'student') {
        isStudent = true;
      }
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  fetchDesignations() async {
    try {
      designationsArray = await _appBarServices.getDesignations();
    } catch (e) {
      print("Error fetching designations: $e");
      return null;
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
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "P & S",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(), // This is sideDrawer used in all modules
      body: Column(
        children: [
          Expanded(
            child: _loading == true
                ? Center(child: CircularProgressIndicator())
                : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                // Display user information
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 170.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profile_pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        name, //Display name of User
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        studentType + " " + curr_desig, // Display Type of User
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0, right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                       context,
                       '/purchase_store/new_request',
                       arguments: data,
                     );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(width: 40.0),
                          Text(
                            'New Request',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40.0),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0, right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                       context,
                      '/purchase_store/approved',
                       arguments: data,
                     );;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(width: 40.0),
                          Text(
                            'Approved Request',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40.0),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0, right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/purchase_store/pending',
                          arguments: data,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(width: 40.0),
                          Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40.0),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0, right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/purchase_store/rejected',
                          arguments: data,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(width: 40.0),
                          Text(
                            'Rejected Request',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40.0),

                        ],
                      ),
                    ),
                  ),
                ),


                // Display Administrative Profile section if not a student and not HOD

              ],
            ),
          ),
          // Place the BottomNavigationBar here
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}
