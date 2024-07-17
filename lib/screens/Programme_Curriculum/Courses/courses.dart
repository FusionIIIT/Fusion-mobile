import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'courseTabComponent.dart';
// import 'package:flutter/services.dart' show rootBundle;

// import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

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
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    var service = locator<StorageService>();
    late String curr_desig = service.getFromDisk("Current_designation");
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
                appBar: CustomAppBar(
                  curr_desig: curr_desig,
                  headerTitle: "Programme and Curriculum",
                  onDesignationChanged: (newValue) {
                    setState(() {
                      curr_desig = newValue;
                    });
                  },
                ),
                drawer: SideDrawer(curr_desig: curr_desig),
                body: TabBarView(
                  children: [
                    CourseTabComponent(data: data_Courses),
                  ],
                ),
              ));
        });
  }
}
