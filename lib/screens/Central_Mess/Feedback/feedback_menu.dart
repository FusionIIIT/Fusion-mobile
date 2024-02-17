import 'package:flutter/material.dart';
import 'feedback_form.dart';
import 'feedback_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
<<<<<<< HEAD
=======

>>>>>>> facc8f506f9faa81d3261f106fdd014481ac55ed
class FeedbackMenu extends StatefulWidget {
  @override
  _FeedbackMenuState createState() => _FeedbackMenuState();
}

class _FeedbackMenuState extends State<FeedbackMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              SizedBox(height: 5.0),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    Container(
                      //color: Colors.deepOrangeAccent,
                      child: TabBar(
                        labelColor: Colors.deepOrange,
                        indicatorColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(child: Text("Feedback Form",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Tab(child: Text("Feedback History",style: TextStyle(fontWeight: FontWeight.bold),),),
                        ],
                      ),
=======
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("Feedback Form",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Feedback History",style: TextStyle(fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
                Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
>>>>>>> facc8f506f9faa81d3261f106fdd014481ac55ed
                    ),
                    Container(
                        height: 520, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                        child: TabBarView(children: <Widget>[
                          FeedbackForm(),
                          FeedbackHistory(),

                        ])
                    )
                  ])
              ),
            ]),
          ),
        ),
    );
  }
}
