import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
// import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/tab_curriculum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Curriculum extends StatefulWidget {
  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  List<List<dynamic>> _curriculum = [];
  List<List<dynamic>> _curriculum_api = [];
  Future<int> _loadCSV() async {
    // final _underGraduate =
    //     await rootBundle.loadString("db/Working_Curriculum.csv");
    // List<List<dynamic>> _listCurr =
    //     const CsvToListConverter().convert(_underGraduate);

    final String curriculum_api =
        "https://script.google.com/macros/s/AKfycbzEAfs5su95Cgc7QRgxBzZRmveReRi_DFc0Ck7KOcm7RrW-JiM-Sj3TJywFfF9YfbJd/exec";
    final http.Response response_curriculum =
        await http.get(Uri.parse(curriculum_api));

    if (response_curriculum.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_curriculum.body);
      _curriculum_api = [
        ['name', 'version', 'batch', 'no_of_semester'],
        ...data
            .map((item) => [
                  item['name'],
                  item['version'],
                  item['batch'],
                  item['no_of_semester']
                ])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    // print("This is list csv: $_listCurr");
    // print("This is list api: $_curriculum_api");

    _curriculum = _curriculum_api;

    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          final data = {
            "table": <String, dynamic>{
              "columns": _curriculum[0],
              "rows": _curriculum.skip(1).map((e) => e)
            }
          };
          // List<dynamic> keys =
          //     _curriculum.skip(1).map((e) => e.elementAt(0)).toSet().toList();
          // List<dynamic> values =
          //     _curriculum.skip(1).map(((e) => e.elementAt(2))).toList();

          List<dynamic> key_val = _curriculum
              .skip(1)
              .map(((e) => [e.elementAt(0), e.elementAt(2)]))
              .toList();
          // print(keys);
          // print(key_val);
          int count = 0;
          for (var i = 0; i < key_val.length; i++) {
            print(key_val[i][0] == key_val[i][1]);
          }

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
                          'Working Curriculumns',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: SideDrawer(),
              body: TabBarView(
                children: [
                  TabCurriculum(data: data),
                ],
              ),
            ),
          );
        });
  }
}
