import 'package:flutter/material.dart';
import 'package:fusion/screens/Academic/Registration/courses.dart';
import 'package:fusion/screens/Academic/Registration/final_registration.dart';
import 'package:fusion/screens/Academic/Registration/pre_registration.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/academic.dart';

class RegistrationHomePage extends StatefulWidget {
  @override
  _RegistrationHomePageState createState() => _RegistrationHomePageState();
}

class _RegistrationHomePageState extends State<RegistrationHomePage> {
  @override
  Widget build(BuildContext context) {
    final AcademicData data =
        ModalRoute.of(context)?.settings.arguments as AcademicData;
    // return DefaultTabController(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Academics Module",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),

      drawer: SideDrawer(),
      body: Container(
        child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: 170.0,
                              height: 170.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/unknown.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              //NAME OF USER
                              data.details!['current_user']['first_name'] +
                                  ' ' +
                                  data.details!['current_user']['last_name'],
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              data.details!['user_branch'] + ' | ' + "STUDENT",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.deepOrangeAccent,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Registration',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TabBar(
                          labelColor: Colors.deepOrangeAccent,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Container(
                                child: Text(
                                  'Courses',
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: Text(
                                  'Pre-Registration',
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: Text(
                                  'Final Registration',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 400, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                              child: Courses(data: data.currently_registered),
                            ),
                            Container(
                              child: PreRegistration(),
                            ),
                            Container(
                              child: FinalRegistration(
                                  data: data), // FinalRegistration(data: data)
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
