import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class outlay extends StatefulWidget {
  final String index;
  const outlay({Key? key , required this.index}) : super(key: key);

  @override
  State<outlay> createState() => _outlayState();
}

class _outlayState extends State<outlay> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    
    fetchData();
  }

  Future<void> fetchData() async {
    final String response = await rootBundle.loadString('assets/db1.json');
    Map<String, dynamic> data = json.decode(response);
    List<dynamic> user = data[widget.index];
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
          //  Container(
          //   height: 60,
          //   width: 350,
          //   decoration: BoxDecoration(
          //       color: Colors.orange[700],
          //       border:
          //           Border.all(color: Color.fromARGB(255, 179, 128, 51)),
          //       borderRadius: BorderRadius.circular(5)),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       'Staff form',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           fontSize: 24.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white),
          //     ),
          //   ),
          // ),

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
                      child: Text('Category'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Sub-Category'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Alloted Amount'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(4.0),
                      child: Text('Amount Remaining'),
                    ),
                  ),
                ],
              ),
              // Populate table rows with data from userData
              for (final rowData in userData)
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['category']),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['subCategory']),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['allottedAmount'].toString()),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(8.0),
                        child: Text(rowData['amountRemaining'].toString()),
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
