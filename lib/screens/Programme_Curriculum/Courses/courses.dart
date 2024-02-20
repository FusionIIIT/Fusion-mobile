import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'courseTabComponent.dart';
// import 'package:flutter/services.dart' show rootBundle;

// import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<List<dynamic>> _courseList = [];
  List<List<dynamic>> _courseList_api = [];

  Future<int> _loadCSV() async {
    // final _courseData = await rootBundle.loadString('db/courses.csv');
    // List<List<dynamic>> _list = const CsvToListConverter().convert(_courseData);

    final String course_api =
        "https://script.google.com/macros/s/AKfycbzYHOnBC4Wfyj2usAKlnJjnq8eOk0JmRk6vFAo4tecdlKJrqJoFrrfxTvxlJ62E536wEA/exec";
    final http.Response response_course = await http.get(Uri.parse(course_api));

    if (response_course.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_course.body);
      _courseList_api = [
        ['Course Code', 'Course Name', 'credits'],
        ...data
            .map((item) =>
                [item['Course Code'], item['Course Name'], item['credits']])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    _courseList = _courseList_api;
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          final data_Courses = {
            "table": <String, dynamic>{
              "columns": _courseList[0],
              "rows": _courseList.skip(1).map((e) => e)
            }
          };
          return DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    "FUSION",
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
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorWeight: 6.0,
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
                drawer: SideDrawer(),
                body: TabBarView(
                  children: [
                    CourseTabComponent(data: data_Courses),
                  ],
                ),
              ));
        });
  }
}
