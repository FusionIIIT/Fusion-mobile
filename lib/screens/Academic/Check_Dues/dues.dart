import 'package:fusion/models/academic.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Dues extends StatefulWidget {
  @override
  _DuesState createState() => _DuesState();
}

class _DuesState extends State<Dues> {
  @override
  Widget build(BuildContext context) {
    final AcademicData data =
        ModalRoute.of(context)!.settings.arguments as AcademicData;
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text("Mess Due"),
                  ),
                  DataColumn(
                    label: Text("Hostel Due"),
                  ),
                  DataColumn(
                    label: Text("Library Due"),
                  ),
                  DataColumn(
                    label: Text("Placement Cell Due"),
                  ),
                  DataColumn(
                    label: Text("Academic Due"),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text("Total Due"),
                    numeric: true,
                  )
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(data.mess_d.toString())),
                      DataCell(Text(data.hos_d.toString())),
                      DataCell(Text(data.lib_d.toString())),
                      DataCell(Text(data.pc_d.toString())),
                      DataCell(Text(data.acad_d.toString())),
                      DataCell(Text(data.tot_d.toString())),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
