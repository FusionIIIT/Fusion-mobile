import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer2.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/tab_curriculum.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class Curriculum extends StatefulWidget {
  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  List<List<dynamic>> _curriculum = [];
  Future<int> _loadCSV() async {
    final _underGraduate =
        await rootBundle.loadString("db/Working_Curriculum.csv");
    List<List<dynamic>> _listCurr =
        const CsvToListConverter().convert(_underGraduate);
    _curriculum = _listCurr;
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
          if (!snapshot.hasData) return Scaffold();
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
              drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
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
