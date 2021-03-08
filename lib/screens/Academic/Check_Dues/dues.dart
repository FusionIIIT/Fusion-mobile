import 'package:flutter/material.dart';
import 'package:fusion/screens/Login%20and%20Dashboard/Components/appBar.dart';
import 'package:fusion/screens/Login%20and%20Dashboard/Components/side_drawer.dart';

class Dues extends StatefulWidget {
  @override
  _DuesState createState() => _DuesState();
}

class _DuesState extends State<Dues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body:Container(
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text("#"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course ID"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course Name"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Credits"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Semester"),
                  numeric: false,
                )
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
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
      )
    );
  }
}
