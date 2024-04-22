import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme_Info/InfoTabComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';

class ProgrammeInfo extends StatefulWidget {
  @override
  _ProgrammeInfoState createState() => _ProgrammeInfoState();
}

class _ProgrammeInfoState extends State<ProgrammeInfo> {
  List<List<dynamic>> _selectProgrammes = [];
  List<List<dynamic>> _curriculum = [];
  List<dynamic> _filteredList = [];
  int index = -1;
  List<List<dynamic>> _listALL_api = [];
  List<List<dynamic>> _listCurr_api = [
    ['Name', 'Version', 'Batch', 'No of Semesters']
  ];
  Future<int> _loadCSV() async {
    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) throw Exception('Token Error');

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
    };

    var client = http.Client();

    final http.Response response_all_grad = await client.get(
      Uri.http(getLink(), kProgrammeInfo),
      headers: headers,
    );

    if (response_all_grad.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_all_grad.body);
      _listALL_api = [
        ['Programme Category', 'Programme Name', 'Programme Begin Year'],
        ...data
            .map((item) =>
                [item['category'], item['name'], item['programme_begin_year']])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    // print(_listALL_api);
    final http.Response response_all_curr = await client.get(
      Uri.http(getLink(), kCurriculumns),
      headers: headers,
    );

    if (response_all_curr.statusCode == 200) {
      List<dynamic> data1 = convert.jsonDecode(response_all_curr.body);

      for (var data in data1) {
        for (var data_in in data) {
          List<dynamic> temp = [
            data_in['name'],
            data_in['version'],
            data_in['batch'],
            data_in['no_of_semester']
          ];
          _listCurr_api.add(temp);
          // print(data_in['name']);
        }
      }
    } else {
      throw Exception('Failed to load data from API');
    }

    // print(_listCurr_api);

    _curriculum = _listCurr_api;

    _selectProgrammes = _listALL_api;

    return 1;
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    print(arguments);
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

          // print(dat.toString() + " dat");
          for (var i = 0; i < dat.length; i++) {
            if (dat[i].replaceAll("(", "").replaceAll(")", "") ==
                arguments['e']) {
              index = i;
            }
          }
          print(dat.toString() + " dat");

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

          print(_selectProgrammes);
          var dat_curriculum = _curriculum
              .skip(1)
              .map((e) => e.skip(2).take(1).toString())
              .toList();
          print(arguments['e'].toString());
          // print(dat_curriculum);

          for (var i = 0; i < dat_curriculum.length; i++) {
            var temp =
                dat_curriculum[i].replaceAll("(", "").replaceAll(")", "");

            String eString = arguments['e'].toString();
            String firstTwoLetters = eString.substring(0, 3);
            String lastTwoLetters = eString.substring(eString.length - 2);
            print(firstTwoLetters);

            if (temp.contains(firstTwoLetters) &&
                temp.contains(lastTwoLetters)) {
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
