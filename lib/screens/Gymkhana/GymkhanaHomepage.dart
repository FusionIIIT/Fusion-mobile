import 'package:flutter/material.dart';
import 'package:fusion/screens/LoginandDashboard/Components/appBar.dart';
import 'package:fusion/screens/LoginandDashboard/Components/side_drawer.dart';

class GymkhanaHomepage extends StatelessWidget {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)));
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
      ),
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
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 100.0, right: 100.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/profile.jpeg',
                      width: 140,
                      height: 120,
                    ),
                    Center(
                      child: Text("Yogendra Singh",
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                    ),
                    Center(
                        child: Text(
                      "cse student",
                    )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: myText("Gymkhana")),
              ),
              decoration: new BoxDecoration(
                color: Colors.orange,
                border: new Border.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              ),
            ),
          ),
          InkWell(
            child: myContainer("Apply"),
            onTap: () {
              Navigator.pushNamed(context, '/gymkhana_homepage/apply');
            },
          ),
          InkWell(
            child: myContainer("Voting Polls"),
            onTap: () {
              Navigator.pushNamed(context, '/gymkhana_homepage/polls');
            },
          ),
          InkWell(
            child: myContainer("Club Details"),
            onTap: () {
              Navigator.pushNamed(context, '/gymkhana_homepage/clubs');
            },
          ),
          InkWell(
            child: myContainer("Members Record"),
            onTap: () {
              Navigator.pushNamed(context, '/gymkhana_homepage/member_records');
            },
          ),
        ],
      ),
    );
  }
}
