import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'mess_bill_history.dart';
import 'mess_monthly_bill.dart';
import 'update_monthly_bill.dart';
import 'view_student_bills.dart';
import 'search_student_bills.dart';
import 'package:fusion/models/profile.dart';

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
    // user = "caretaker";
    //user = "warden";

    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length: user == "student" ? 2 : 3, // length of tabs
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
                          Tab(child: Text("Monthly Bill",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Tab(child: Text("Bill History",style: TextStyle(fontWeight: FontWeight.bold),),),
                        ],
                      if (user == "caretaker" || user=="warden")
                        ...[
                          Tab(child: Text("Bill Base",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Tab(child: Text("View Student Bills",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Tab(child: Text("Update Student Bill",style: TextStyle(fontWeight: FontWeight.bold),),),
                        ]
                    ],
                  ),
                ),
                Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      if(user == "student") ...[
                        MessMonthlyBill(),
                        MessMonthlyBillHistory(profileData: data),
                      ],
                      if(user=="caretaker" || user=="warden") ...[
                        UpdateMonthlyBill(),
                        ViewStudentBill(),
                        SearchStudentBill(),
                      ]
                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
