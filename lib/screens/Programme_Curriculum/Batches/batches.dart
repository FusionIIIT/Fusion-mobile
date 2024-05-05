import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:fusion/Components/side_drawer.dart';
import 'batchTabComponent.dart';
// import 'package:fusion/models/academic.dart';
// import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class Batches extends StatefulWidget {
  @override
  State<Batches> createState() => _BatchesState();
}

class _BatchesState extends State<Batches> {
  List<List<dynamic>> _currentBatchesList = [];
  List<List<dynamic>> _finishedBatchesList = [];
  List<List<dynamic>> _currentBatchesList_api = [];
  List<List<dynamic>> _finishedBatchesList_api = [];

  Future<int> _loadCSV() async {
    // final _batchesData = await rootBundle.loadString('db/Batches.csv');
    // final _finishedData = await rootBundle.loadString('db/Batches.csv');

    // List<List<dynamic>> _currentList =
    //     const CsvToListConverter().convert(_batchesData);
    // List<List<dynamic>> _finishedList =
    //     const CsvToListConverter().convert(_finishedData);

    final String batches_api =
        "https://script.google.com/macros/s/AKfycbxKaBfhdhiWdes8OhLlgh0jvK7NEvEJmeu1kdCFJS6YgKcUltn3Xx9kPyoLE5qy66wqNA/exec";
    final http.Response response_batches =
        await http.get(Uri.parse(batches_api));

    if (response_batches.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response_batches.body);
      _currentBatchesList_api = [
        ['name', 'discipline', 'year', 'curriculum'],
        ...data
            .map((item) => [
                  item['name'],
                  item['discipline'],
                  item['year'],
                  item['curriculum']
                ])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    final String finished_batches_api =
        "https://script.google.com/macros/s/AKfycbxKaBfhdhiWdes8OhLlgh0jvK7NEvEJmeu1kdCFJS6YgKcUltn3Xx9kPyoLE5qy66wqNA/exec";
    final http.Response response_finished_batches =
        await http.get(Uri.parse(finished_batches_api));

    if (response_finished_batches.statusCode == 200) {
      List<dynamic> data1 = convert.jsonDecode(response_finished_batches.body);
      _finishedBatchesList_api = [
        ['name', 'discipline', 'year', 'curriculum'],
        ...data1
            .map((item) => [
                  item['name'],
                  item['discipline'],
                  item['year'],
                  item['curriculum']
                ])
            .toList(),
      ];
    } else {
      throw Exception('Failed to load data from API');
    }

    _currentBatchesList = _currentBatchesList_api;
    _finishedBatchesList = _finishedBatchesList_api;
    return 1;
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    var service = locator<StorageService>();
    late String curr_desig = service.getFromDisk("Current_designation");
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          final data_CurrentBatches = {
            "table": <dynamic, dynamic>{
              "columns": _currentBatchesList[0],
              "rows": _currentBatchesList.skip(1).map((e) => e)
            }
          };
          final data_FinishedBatches = {
            "table": <dynamic, dynamic>{
              "columns": _finishedBatchesList[0],
              "rows": _finishedBatchesList.skip(1).map((e) => e)
            }
          };
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppBar(
                curr_desig: curr_desig,
                headerTitle: "Programme and Curriculum",
                onDesignationChanged: (newValue) {
                  setState(() {
                    curr_desig = newValue;
                  });
                },
              ),
              drawer: SideDrawer(curr_desig: curr_desig),
              body: TabBarView(
                children: [
                  BatchTabComponent(data: data_CurrentBatches),
                  BatchTabComponent(data: data_FinishedBatches),
                ],
              ),
            ),
          );
        });
  }
}
