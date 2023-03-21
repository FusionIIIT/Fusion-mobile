import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';

class Programme extends StatefulWidget {
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            width: 130.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/unknown.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            //NAME OF USER
                            'Arihant Jain',
                            // data.details!['current_user']['first_name'] +
                            //     ' ' +
                            //     data.details!['current_user']['last_name'],
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            'CSE',
                            // data.details!['user_branch'] + ' | ' + "STUDENT",
                            // style: TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TabBar(
                        // controller: tabController,
                        isScrollable: true,
                        labelColor: Colors.orange.shade300,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.orange.shade300,
                        indicatorWeight: 3.0,
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
                    Expanded(
                      flex: 2,
                      child: TabBarView(
                        children: [
                          TabComponent(data: data_UG),
                          TabComponent(data: data_PG),
                          TabComponent(data: data_PHD)
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
