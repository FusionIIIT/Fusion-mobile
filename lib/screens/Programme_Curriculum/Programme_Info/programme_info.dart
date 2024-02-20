import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
// import 'package:fusion/models/academic.dart';
// import 'package:csv/csv.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/InfoTabComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  List<List<dynamic>> _listALL_api = [];
  List<List<dynamic>> _listCurr_api = [];
  Future<int> _loadCSV() async {
    // final _allGraduate = await rootBundle.loadString("db/ALL_Programmes.csv");
    // List<List<dynamic>> _listALL =
    //     const CsvToListConverter().convert(_allGraduate);

    final String all_grad_api =
        "https://script.google.com/macros/s/AKfycbxaIqq8_XzUf0nTLhMYxrC6dqQ7mqoN5LgV4Ln2M6j731juYrHpsKt6EhiBlTjD6kRl/exec";
    final http.Response response_all_grad =
        await http.get(Uri.parse(all_grad_api));

    if (response_all_grad.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_all_grad.body);
      _listALL_api = [
        ['Programme Category', 'Programme Name', 'Programme Begin Year'],
        ...data
            .map((item) => [
                  item['Programme Category'],
                  item['Programme Name'],
                  item['Programme Begin Year']
                ])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    // final _workingCurriculum =
    //     await rootBundle.loadString("db/Working_Curriculum1.csv");
    // List<List<dynamic>> _listCurr =
    //     const CsvToListConverter().convert(_workingCurriculum);

    final String all_curr_api =
        "https://script.google.com/macros/s/AKfycbzp0Nqb8-G_lxp_SZK8eOjV3CgmCC5Qz98e8jYaLFF8azUXJjk9kAqp1Nbm8rp-JuJz5A/exec";
    final http.Response response_all_curr =
        await http.get(Uri.parse(all_curr_api));

    if (response_all_curr.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_all_curr.body);
      _listCurr_api = [
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

    _curriculum = _listCurr_api;

    _selectProgrammes = _listALL_api;

    // print("This is list Curr: $_listCurr");
    // print("This is list all coming from api: $_listCurr_api");
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
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

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
