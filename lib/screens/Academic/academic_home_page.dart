

import 'package:flutter/material.dart';
import 'package:fusion/screens/LoginandDashboard/Components/appBar.dart';
import 'package:fusion/screens/LoginandDashboard/Components/side_drawer.dart';

class AcademicHomePage extends StatefulWidget {
  static String tag = 'academic-page';
  @override
  _AcademicHomePageState createState() => _AcademicHomePageState();
}

class _AcademicHomePageState extends State<AcademicHomePage> {
  final list={
    'Current Semester':['Semester','Time table', 'Academic Calendar', 'List of holidays','Exam time table']
  };
  @override
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
                    Image(
                      image: AssetImage("assets/profile.jpeg"),
                    ),
                    Center(
                      child: Text("Rishabh Pandey",
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
                child: Center(child: myText("Academic")),
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
            child: myContainer("Current Semester"),
            onTap: () {
              Navigator.pushNamed(context, '/current_semester_home_page');
            },
          ),
          InkWell(
            child: myContainer("Registration"),
            onTap: () {
              Navigator.pushNamed(context, '/registration_home_page');
            },
          ),
          InkWell(
            child: myContainer("Check Dues"),
            onTap: () {
              Navigator.pushNamed(context, '/dues');
            },
          ),
          InkWell(
            child: myContainer("Apply for Bonafide"),
            onTap: () {
              Navigator.pushNamed(context, '/bonafide');
            },
          ),
          InkWell(
            child: myContainer("Check Attendance"),
            onTap: () {
              Navigator.pushNamed(context, '/attendance');
            },
          ),
          InkWell(
            child: myContainer("Branch Change"),
            onTap: () {
              Navigator.pushNamed(context, '/branch_change');
            },
          ),
          InkWell(
            child: myContainer("Evaluate Teaching Credits"),
            //onTap: (){},
          ),
          InkWell(
            child: myContainer("Thesis"),
            onTap: () {
              Navigator.pushNamed(context, '/thesis');
            },
          ),
          InkWell(
            child: myContainer("View Performance"),
            onTap: () {
              Navigator.pushNamed(context, '/performance');
            },
          ),
        ],
      ),
    );
  }
}

class ModulesPadding extends StatelessWidget {
  final String line;
  final String pageMover;
  ModulesPadding({this.line,this.pageMover});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          line,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, pageMover);
      },
    );
  }
}

