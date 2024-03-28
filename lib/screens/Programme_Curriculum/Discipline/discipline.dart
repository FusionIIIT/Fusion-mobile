import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'discTabComponent.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// import 'package:csv/csv.dart';

class Discipline extends StatefulWidget {
  @override
  State<Discipline> createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  List<List<dynamic>> _disciplineList = [];
  List<List<dynamic>> _disciplineList_api = [];

  Future<int> _loadCSV() async {
    // final _disciplineProg = await rootBundle.loadString("db/Disciplines.csv");
    // List<List<dynamic>> _list =
    //     const CsvToListConverter().convert(_disciplineProg);

    final String discipline_api =
        "https://script.google.com/macros/s/AKfycbyLzHfXHOY63M7-11YJNIaK6OjxZtCCDxLhDL2j9vLlumnXvWjhWiO5GcHsMa-w4ANdtw/exec";
    final http.Response response_discipline =
        await http.get(Uri.parse(discipline_api));

    if (response_discipline.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_discipline.body);
      _disciplineList_api = [
        ['Discipline Name', 'programmes'],
        ...data
            .map((item) => [item['Discipline Name'], item['programmes']])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    // print("This is list csv: $_list");
    // print("This is list api: $_disciplineList_api");

    _disciplineList = _disciplineList_api;

    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          final data_Discipline = {
            "table": <String, dynamic>{
              "columns": _disciplineList[0],
              "rows": _disciplineList.skip(1).map((e) => e)
            }
          };
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
                          'Disciplines',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: SideDrawer(),
              body: TabBarView(
                children: [
                  DiscTabComponent(data: data_Discipline),
                ],
              ),
            ),
          );
        });
  }
}
