// ignore_for_file: unused_import

import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/RSPC/Patents/patents_tab.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

import '../../../Components/utils.dart';

class Patents extends StatefulWidget {
  final uid;
  Patents(this.uid);
  @override
  State<Patents> createState() => _PatentsState();
}

class _PatentsState extends State<Patents> {
  List<List<dynamic>> _patentList = [];
  Utils utils = Utils();
  Future<int> _loadCSV() async {
    final _patentsData = await rootBundle.loadString('db/patents.csv');
    List<List<dynamic>> _list =
        const CsvToListConverter().convert(_patentsData);
    _patentList = _list;
    return 1;
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadCSV(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Scaffold();
          final patentData = {
            "table": <String, dynamic>{
              "columns": _patentList[0],
              "rows": _patentList.skip(1).map((e) => e)
            }
          };
          return DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: utils.primarybackgroundcolor,
                  leading:
                      utils.leadingPopIconsButton(utils.primarycolor, context),
                  title: Text(
                    "Patents",
                    style: TextStyle(
                        color: utils.primarycolor, fontWeight: FontWeight.bold),
                  ),
                ),

                // drawer: SideDrawer(),
                body: TabBarView(
                  children: [
                    PatentsStatus(data: patentData),
                  ],
                ),
              ));
        });
  }
}
