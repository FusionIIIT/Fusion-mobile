import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';
import 'courseTabComponent.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with TickerProviderStateMixin {
  List<List<dynamic>> _courseList = [];

  Future<int> _loadCSV() async {
    final _courseData = await rootBundle.loadString('db/courses.csv');
    List<List<dynamic>> _list = const CsvToListConverter().convert(_courseData);
    _courseList = _list;
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 1, vsync: this);
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Scaffold();
          final data_Courses = {
            "table": <String, dynamic>{
              "columns": _courseList[0],
              "rows": _courseList.skip(1).map((e) => e)
            }
          };
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.black,
              title: Text(
                "Fusion",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
            body: Column(
              children: [
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 100.0,
                        height: 100.0,
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
                        'Arihant Jain',
                        // data.details!['current_user']['first_name'] +
                        //     ' ' +
                        //     data.details!['current_user']['last_name'],
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'CSE',
                        // data.details!['user_branch'] + ' | ' + "STUDENT",
                        // style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelColor: Colors.orange.shade300,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.orange.shade300,
                    indicatorWeight: 3.0,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(
                            'Courses',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      CourseTabComponent(data: data_Courses),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
