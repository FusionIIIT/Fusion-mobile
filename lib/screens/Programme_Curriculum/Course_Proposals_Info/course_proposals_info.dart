import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
// import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Course_Proposals_Info/course_proposals_infoTabComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class CoursesProposalInfo extends StatefulWidget {
  @override
  _CoursesProposalInfoState createState() => _CoursesProposalInfoState();
}

class _CoursesProposalInfoState extends State<CoursesProposalInfo> {
  List<List<dynamic>> _courseList = [];
  List<dynamic> _selectedCourse = [];
  List<List<dynamic>> _courseList_api = [];
  int index = -1;

  Future<int> _loadCSV() async {
    // final _allCourses = await rootBundle.loadString("db/Course_Code.csv");
    // List<List<dynamic>> _listALL =
    //     const CsvToListConverter().convert(_allCourses);

    final String course_code_api =
        "https://script.google.com/macros/s/AKfycbw0oi0VyhdlZ97ENHdUW8iQXNjpZZ4Yb42fl0sIbCFLED3tygO7aRM6VX_02afff6ImNg/exec";
    final http.Response response_course_code =
        await http.get(Uri.parse(course_code_api));

    if (response_course_code.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_course_code.body);
      _courseList_api = [
        [
          'code',
          'name',
          'credit',
          'lecture_hours',
          'tutorial_hours',
          'pratical_hours',
          'discussion_hours',
          'project_hours',
          'pre_requisits',
          'syllabus',
          'ref_books',
          'percent_course_attendance',
          'percent_endsem',
          'percent_midsem',
          'percent_project',
          'percent_quiz_1',
          'percent_quiz_2',
          'percent_lab_evaluation',
          'course_proposedby',
          'status'
        ],
        ...data
            .map((item) => [
                  item['code'],
                  item['name'],
                  item['credit'],
                  item['lecture_hours'],
                  item['tutorial_hours'],
                  item['pratical_hours'],
                  item['discussion_hours'],
                  item['project_hours'],
                  item['pre_requisits'],
                  item['syllabus'],
                  item['ref_books'],
                  item['percent_course_attendance'],
                  item['percent_endsem'],
                  item['percent_midsem'],
                  item['percent_project'],
                  item['percent_quiz_1'],
                  item['percent_quiz_2'],
                  item['percent_lab_evaluation'],
                  item['course_proposedby'],
                  item['status']
                ])
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
    // final AcademicData data =
    //     ModalRoute.of(context)?.settings.arguments as AcademicData;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          print(arguments["e"]);

          List<List<dynamic>> _rows = [];

          for (var i = 1; i < _courseList.length; i++) {
            if (_courseList[i][0].toString() == arguments["e"].toString()) {
              _selectedCourse = _courseList[i];
              break;
            }
          }

          for (int i = 0; i < _selectedCourse.length; i++) {
            List<dynamic> _rowElements = [];
            _rowElements.add(_courseList[0][i].toString().toUpperCase());
            _rowElements.add(_selectedCourse[i]);
            _rows.add(_rowElements);
          }
          print(_rows);
          final info_data = {
            "table": <dynamic, dynamic>{
              "columns": ["Info", "Description"],
              "rows": _rows,
            }
          };
          // print(_rows);
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
                  CourseProposalsInfoTabComponent(data: info_data),
                ],
              ),
            ),
          );
        });
  }
}
