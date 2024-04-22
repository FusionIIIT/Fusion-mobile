// ignore_for_file: camel_case_types

import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:fusion/Components/appBar.dart";
import "package:fusion/Components/side_drawer.dart";

class View_staff extends StatefulWidget {
    final String index;
  const View_staff({Key? key , required this.index}) : super(key: key);

  @override
  State<View_staff> createState() => _View_staffState();
}

class _View_staffState extends State<View_staff> {
   List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    
    fetchData();
  }

  Future<void> fetchData() async {
    final String response = await rootBundle.loadString('assets/db2.json');
    Map<String, dynamic> data = json.decode(response);
    List<dynamic> user = data[widget.index];
    // print(user);
    setState(() {
      userData = user;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
        

          child: Table(
            border: TableBorder.all(color: Colors.white),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('StaffId'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Staff Name'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Qualification'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Stipend'),
                    ),
                  ),
                ],
              ),
              // Populate table rows with data from userData
              for (final rowData in userData)
                // print(rowData[widget.index]['StaffId']);
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['StaffId']),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['Staff Name']),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['Qualification'].toString()),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['Stipend'].toString()),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    

    );
  }
}