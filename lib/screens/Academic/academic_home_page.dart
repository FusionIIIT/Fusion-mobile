import 'package:flutter/material.dart';

class AcademicHomePage extends StatefulWidget {
  @override
  _AcademicHomePageState createState() => _AcademicHomePageState();
}

class _AcademicHomePageState extends State<AcademicHomePage> {
  @override

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(
            new Radius.circular(5.0)
        )
    );
  }

  Text myText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }

  Padding myContainer(String text){
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
      appBar: AppBar(
        title: Text("Academic Module"),
        backgroundColor: Colors.grey[900],
      ),
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
                  borderRadius: new BorderRadius.all(
                      new Radius.circular(5.0)
                  ),
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/profile.jpeg"),
                    ),
                    Center(
                        child: Text(
                          "Rishabh Pandey",
                          style: TextStyle(
                            fontSize: 15.0,
                          )
                        ),
                    ),
                    Center(
                        child:Text(
                          "cse student",
                        )
                    ),
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
                child: Center(child:myText("Academic")),
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
                    offset: Offset(0.0,1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: new BorderRadius.all(
                    new Radius.circular(5.0)
                ),
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
            onTap: (){
              Navigator.pushNamed(context, '/registration_home_page');
            },
          ),
          InkWell(
            child: myContainer("Check Dues"),
            onTap: (){
              Navigator.pushNamed(context, '/dues');
            },
          ),
          InkWell(
            child: myContainer("Apply for Bonafide"),
            onTap: (){
              Navigator.pushNamed(context, '/bonafide');
            },
          ),
          InkWell(
            child: myContainer("Check Attendance"),
            onTap: (){
              Navigator.pushNamed(context, '/attendance');
            },
          ),
          InkWell(
            child: myContainer("Branch Change"),
            onTap: (){
              Navigator.pushNamed(context, 'branch_change');
            },
          ),
          InkWell(
            child: myContainer("Evaluate Teaching Credits"),
            //onTap: (){},
          ),
          InkWell(
            child: myContainer("Thesis"),
            onTap: (){
              Navigator.pushNamed(context, '/thesis');
            },
          ),
          InkWell(
            child: myContainer("View Performance"),
            onTap: (){
              Navigator.pushNamed(context, '/performance');
            },
          ),
        ],
      ),
    );
  }
}
