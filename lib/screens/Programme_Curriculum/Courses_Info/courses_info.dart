import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Courses_Info/courseInfoTabComponent.dart';

class CoursesInfo extends StatefulWidget {
  @override
  _CoursesInfoState createState() => _CoursesInfoState();
}

class _CoursesInfoState extends State<CoursesInfo> {
  List<List<dynamic>> _courseList = [];
  List<dynamic> _selectedCourse = [];
  int index = -1;
  Future<int> _loadCSV() async {
    final _allCourses = await rootBundle.loadString("db/Course_Code.csv");
    List<List<dynamic>> _listALL =
        const CsvToListConverter().convert(_allCourses);

    _courseList = _listALL;
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)?.settings.arguments as AcademicData;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Scaffold();

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
                          arguments['e'].toString() + " Info",
                        ),
                      ),
                    ),
                    // Tab(
                    //   child: Container(
                    //     child: Text(
                    //       'Obsolete Curriculums',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              drawer: SideDrawer(),
              body: TabBarView(
                children: [
                  CourseInfoTabComponent(data: info_data),
                ],
              ),
            ),
          );
        });
  }
}
