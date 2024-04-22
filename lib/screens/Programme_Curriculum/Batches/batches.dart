import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'batchTabComponent.dart';
// import 'package:fusion/models/academic.dart';
import 'package:csv/csv.dart';

class Batches extends StatefulWidget {
  @override
  State<Batches> createState() => _BatchesState();
}

class _BatchesState extends State<Batches> {
  List<List<dynamic>> _currentBatchesList = [];
  List<List<dynamic>> _finishedBatchesList = [];

  Future<int> _loadCSV() async {
    final _batchesData = await rootBundle.loadString('db/Batches.csv');
    final _finishedData = await rootBundle.loadString('db/Batches.csv');

    List<List<dynamic>> _currentList =
        const CsvToListConverter().convert(_batchesData);
    List<List<dynamic>> _finishedList =
        const CsvToListConverter().convert(_finishedData);

    _currentBatchesList = _currentList;
    _finishedBatchesList = _finishedList;
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
          if (!snapshot.hasData) return Scaffold();
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
                          'Batches',
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'Finished Batches',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: SideDrawer(),
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
