import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:flutter/material.dart';

class Performance extends StatefulWidget {
  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(context),
      drawer: SideDrawer(),
      body:Container(
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text("Course ID"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course Name"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Quiz 1"),
                ),
                DataColumn(
                  label: Text("Midsem"),
                ),
                DataColumn(
                  label: Text("Quiz 2"),
                ),
                DataColumn(
                  label: Text("EndSem"),
                ),
                DataColumn(
                  label: Text("Other"),
                ),
                DataColumn(
                  label: Text("Total"),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
