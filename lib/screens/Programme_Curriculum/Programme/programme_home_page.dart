import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class Programme extends StatefulWidget {
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  List<List<dynamic>> _ug = [];
  List<List<dynamic>> _pg = [];
  List<List<dynamic>> _phd = [];
  Future<int> _loadCSV() async {
    final _underGraduate =
        await rootBundle.loadString("db/UG_Under_Graduate.csv");
    final _postGraduate =
        await rootBundle.loadString("db/PG_Post_Graduate.csv");
    final _phdGraduate = await rootBundle.loadString("db/PHD_Graduate.csv");
    List<List<dynamic>> _listUG =
        const CsvToListConverter().convert(_underGraduate);
    List<List<dynamic>> _listPG =
        const CsvToListConverter().convert(_postGraduate);
    List<List<dynamic>> _listPHD =
        const CsvToListConverter().convert(_phdGraduate);
    _ug = _listUG;
    _pg = _listPG;
    _phd = _listPHD;

    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    // _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    // final AcademicData data =
    //     ModalRoute.of(context)?.settings.arguments as AcademicData;

    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Scaffold();

          final data_UG = {
            "table": <String, dynamic>{
              "columns": _ug[0],
              "rows": _ug.skip(1).map((e) => e)
            }
          };
          final data_PG = {
            "table": <String, dynamic>{
              "columns": _pg[0],
              "rows": _pg.skip(1).map((e) => e)
            }
          };
          final data_PHD = {
            "table": <String, dynamic>{
              "columns": _phd[0],
              "rows": _phd.skip(1).map((e) => e)
            }
          };
          print(data_UG);
          return DefaultTabController(
            length: 3,
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
                          'UG: Under Graduate',
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'PG: Post Graduate',
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'PHD:Doctor of Philosopy',
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
                  TabComponent(data: data_UG),
                  TabComponent(data: data_PG),
                  TabComponent(data: data_PHD)
                ],
              ),
            ),
          );
        });
  }
}
