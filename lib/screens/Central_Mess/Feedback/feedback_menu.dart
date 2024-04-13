import 'package:flutter/material.dart';
import 'feedback_form.dart';
import 'feedback_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class FeedbackMenu extends StatefulWidget {
  @override
  _FeedbackMenuState createState() => _FeedbackMenuState();
}

class _FeedbackMenuState extends State<FeedbackMenu> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5.0),
            DefaultTabController(
              length: user == 'caretaker' ? 1 : 2, // Change tab length based on user
              // length: 2,
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
                      tabs: [
                        if (user != 'caretaker' && user != 'warden')
                          Tab(
                            child: Text(
                              "Feedback Form",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        Tab(
                          child: Text(
                            "Feedback History",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        if (user != 'caretaker' && user != 'warden') FeedbackForm(),
                        FeedbackHistory(),
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
