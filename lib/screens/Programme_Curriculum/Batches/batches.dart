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
                            child: Text(
                              'Batches',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Finished Batches',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TabBarView(
                        //controller: tabController,
                        children: [
                          BatchTabComponent(data: data_CurrentBatches),
                          BatchTabComponent(data: data_FinishedBatches),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
