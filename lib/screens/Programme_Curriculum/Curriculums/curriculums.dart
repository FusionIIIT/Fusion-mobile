import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Curriculums/tab_curriculum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';

class Curriculum extends StatefulWidget {
  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  List<List<dynamic>> _curriculum = [];
  // List<List<dynamic>> _curriculum_api = [];
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

    final http.Response responseAllCurr = await client.get(
      Uri.http(getLink(), kCurriculumns),
      headers: headers,
    );

    if (responseAllCurr.statusCode == 200) {
      List<dynamic> data1 = convert.jsonDecode(responseAllCurr.body);

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

    // print("This is list csv: $_listCurr");
    // print("This is list api: $_curriculum_api");

    _curriculum = _listCurr_api;

    return 1;
  }

  @override
  void initState() {
    super.initState();
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
          // int count = 0;
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
