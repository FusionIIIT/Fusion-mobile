// import 'package:flutter/material.dart';
// import 'make_annoucement.dart';
// import 'annoucement_history.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/profile.dart';
//
// class AnnoucementMess extends StatefulWidget {
//   @override
//   _AnnoucementMessState createState() => _AnnoucementMessState();
// }
//
// class _AnnoucementMessState extends State<AnnoucementMess> {
//   @override
//   void initState() {
//     super.initState();
//     // Simulating different user types
//     // user = "caretaker"; // Change to "caretaker" to see the caretaker view
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic>? arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     ProfileData data = ProfileData.fromJson(arguments?['profileData']);
//     String? user = arguments?['user'];
//     user = user?.toLowerCase();
//     // user = "caretaker";
//     //user = "warden";
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: DefaultAppBar().buildAppBar(titleText: "Central Mess"),
//       drawer: SideDrawer(),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             SizedBox(height: 5.0),
//             DefaultTabController(
//               length: user == "student" ? 1 : 2, // length of tabs
//               initialIndex: 0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(
//                     child: TabBar(
//                       labelColor: Colors.deepOrange,
//                       indicatorColor: Colors.deepOrangeAccent,
//                       unselectedLabelColor: Colors.black,
//                       tabs: [
//
//                         if (user == "caretaker" || user == "warden")
//                           Tab(
//                             child: Text(
//                               "Make AnnoucementMess",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//
//                         Tab(
//                           child: Text(
//                             "Annoucement History",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 590, //height of TabBarView
//                     decoration: BoxDecoration(
//                       border:
//                       Border(top: BorderSide(color: Colors.grey, width: 0.5)),
//                     ),
//                     child: TabBarView(
//                       children: <Widget>[
//
//                         if (user == "caretaker" || user == "warden") MakeAnnoucement(),
//                         AnnoucementHistory(),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
