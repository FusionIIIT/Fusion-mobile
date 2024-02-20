import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:fusion/models/profile.dart';
// import 'package:fusion/services/profile_service.dart';
// import 'package:fusion/models/dashboard.dart';
// import 'package:fusion/services/dashboard_service.dart';
// import 'package:http/http.dart';

class ProgrammeCurriculumHome extends StatefulWidget {
  @override
  _ProgrammeCurriculumHomeState createState() =>
      _ProgrammeCurriculumHomeState();
}

class _ProgrammeCurriculumHomeState extends State<ProgrammeCurriculumHome> {
  @override
  void initState() {
    super.initState();
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.deepOrangeAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
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
    final data = '';
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
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
                  "Acad_Admin",
                  // data.details!['current_user']['first_name'] +
                  //     ' ' +
                  //     data.details!['current_user']['last_name'],
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "admin",
                  // data.details!['user_branch'] + ' | ' + "STUDENT",
                  // style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Programme Curriculum",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
              ),
              decoration: new BoxDecoration(
                color: Colors.deepOrangeAccent,
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
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  child: myContainer("Browse Programmes"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/programme',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Add Programmes"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/programme_form',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Browse Curriculums"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/curriculum',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Add Curriculum"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/curriculum_form',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Browse Courses"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/courses',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Add Courses"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/courses_form',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Browse Disciplines"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/discipline',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Add Disciplines"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/discipline_form',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Browse Batches"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/batches',
                        arguments: data);
                  },
                ),
                InkWell(
                  child: myContainer("Add Batches"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/programme_curriculum_home/batches_form',
                        arguments: data);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
