import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/tab_curriculum.dart';

class Curriculum extends StatefulWidget {
  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
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
                            child: Text(
                              'Working Curriculumns',
                              //style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TabBarView(
                        children: [
                          TabCurriculum(data: data),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
