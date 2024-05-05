import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'mess_bill_history.dart';
import 'update_monthly_bill.dart';
import 'view_student_bills.dart';
import 'update_student_bill.dart';
import 'package:fusion/models/profile.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ManageBill extends StatefulWidget {
  @override
  _ManageBillState createState() => _ManageBillState();
}

class _ManageBillState extends State<ManageBill> {

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    Map<String, dynamic> userMessData = arguments?['userMessData'];

    return
      SafeArea(
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              SizedBox(height: 5.0),
              Expanded(
                child: DefaultTabController(
                    length: user == "student" || user == "warden" ? 1 : 3, // length of tabs
                    initialIndex: 0,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                      Container(
                        //color: Colors.deepOrangeAccent,
                        child: TabBar(
                          labelColor: Colors.deepOrange,
                          indicatorColor: Colors.deepOrangeAccent,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            if (user == "student")
                              ...[
                                Tab(child: Text("Monthly Bills",style: TextStyle(fontWeight: FontWeight.bold),),),
                                // Tab(child: Text("Bill History",style: TextStyle(fontWeight: FontWeight.bold),),),
                              ],
                            if (user == "caretaker")
                              ...[
                                Tab(child: Text("Bill Base",style: TextStyle(fontWeight: FontWeight.bold),),),
                                Tab(child: Text("View Student Bills",style: TextStyle(fontWeight: FontWeight.bold),),),
                                Tab(child: Text("Update Student Bill",style: TextStyle(fontWeight: FontWeight.bold),),),
                              ],
                            if (user=="warden")
                              ...[
                                Tab(child: Text("View Student Bills",style: TextStyle(fontWeight: FontWeight.bold),),),
                              ]
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            // height: isPortrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width,
                            // width: isPortrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                              ),
                              child: TabBarView(children: <Widget>[
                                if(user == "student") ...[
                                  // MessMonthlyBill(),
                                  MessMonthlyBillHistory(profileData: data, userMessData: userMessData),
                                ],
                                if(user=="caretaker") ...[
                                  UpdateMonthlyBill(),
                                  ViewStudentBill(),
                                  UpdateStudentBill(),
                                ],
                                if(user=="warden") ...[
                                  ViewStudentBill(),
                                ]
                              ])
                          )),

                    ])
                ),
              ),

            ]),

    ),
    );
  }
}
