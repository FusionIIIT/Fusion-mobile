import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/InfoTabComponent.dart';

class ProgrammeInfo extends StatefulWidget {
  @override
  _ProgrammeInfoState createState() => _ProgrammeInfoState();
}

class _ProgrammeInfoState extends State<ProgrammeInfo> {
  // List<List<dynamic>> _ugProgrammes = [];
  // List<List<dynamic>> _pgProgrammes = [];
  // List<List<dynamic>> _phdProgrammes = [];
  List<List<dynamic>> _selectProgrammes = [];
  List<List<dynamic>> _curriculum = [];
  List<dynamic> _filteredList = [];
  int index = -1;
  Future<int> _loadCSV() async {
    // final _underGraduate = await rootBundle.loadString("db/UG_programmes.csv");
    // List<List<dynamic>> _listUG =
    //     const CsvToListConverter().convert(_underGraduate);
    // final _postGraduate = await rootBundle.loadString("db/PG_Programmes.csv");
    // List<List<dynamic>> _listPG =
    //     const CsvToListConverter().convert(_postGraduate);
    // final _phdGraduate = await rootBundle.loadString("db/PHD_Programmes.csv");
    // List<List<dynamic>> _listPHD =
    //     const CsvToListConverter().convert(_phdGraduate);

    final _allGraduate = await rootBundle.loadString("db/ALL_Programmes.csv");
    List<List<dynamic>> _listALL =
        const CsvToListConverter().convert(_allGraduate);

    final _workingCurriculum =
        await rootBundle.loadString("db/Working_Curriculum1.csv");
    List<List<dynamic>> _listCurr =
        const CsvToListConverter().convert(_workingCurriculum);

    _curriculum = _listCurr;
    // _ugProgrammes = _listUG;
    // _pgProgrammes = _listPG;
    // _phdProgrammes = _listPHD;
    _selectProgrammes = _listALL;
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

          var dat = _selectProgrammes
              .skip(1)
              .map((e) => e.skip(1).take(1).toString())
              .toList();

          print(dat.toString() + " dat");
          for (var i = 0; i < dat.length; i++) {
            if (dat[i].replaceAll("(", "").replaceAll(")", "") ==
                arguments['e']) {
              index = i;
            }
          }

          final info_data = {
            "table": <dynamic, dynamic>{
              "columns": [arguments['e'], ""],
              "rows": [
                [
                  "Programme Category",
                  _selectProgrammes[index + 1][0].toString()
                ],
                ["Programme Name", _selectProgrammes[index + 1][1].toString()],
                [
                  "Programme Begin Year",
                  _selectProgrammes[index + 1][2].toString()
                ],
              ].map((e) => e)
            }
          };
          var dat_curriculum = _curriculum
              .skip(1)
              .map((e) => e.skip(2).take(1).toString())
              .toList();
          print(arguments['e'].toString());
          // print(dat_curriculum);

          for (var i = 0; i < dat_curriculum.length; i++) {
            var temp =
                dat_curriculum[i].replaceAll("(", "").replaceAll(")", "");

            if (temp.contains(arguments['e'].toString())) {
              _filteredList.add(_curriculum[i + 1]);
            }
          }
          final info_curriculums = {
            "table": <String, dynamic>{
              "columns": _curriculum[0],
              "rows": _filteredList.map((e) => e)
            }
          };

          return DefaultTabController(
            length: 2,
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
                    Tab(
                      child: Container(
                        child: Text(
                          'Working Curriculums',
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
                  InfoTabComponent(data: info_data),
                  InfoTabComponent(data: info_curriculums),
                ],
              ),
            ),
          );
        });
  }
}
