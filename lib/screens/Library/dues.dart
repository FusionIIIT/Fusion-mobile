//TODO: Make Dynamic

import 'package:flutter/material.dart';
import 'side_drawer.dart';

class LibraryDues extends StatefulWidget {
  @override
  _LibraryDuesState createState() => _LibraryDuesState();
}

class _LibraryDuesState extends State<LibraryDues> {
  final List<Map<String, String>> listOfColumns = [
    {
      "Acc No.": "56382",
      "Due Date": "12-01-1231",
      "Days*o*d*c": "43",
      "Total*o*d*c": "1239"
    },
    {
      "Acc No.": "56382",
      "Due Date": "19-01-1231",
      "Days*o*d*c": "13",
      "Total*o*d*c": "139"
    },
    {
      "Acc No.": "56999",
      "Due Date": "29-01-1218",
      "Days*o*d*c": "93",
      "Total*o*d*c": "134"
    },
  ];

  final List<Map<String, String>> nonReturned = [
    {
      "Acc No.": "56382",
      "Due Date": "12-01-1231",
      "Return Date": "12-01-1231",
      "Total*o*d*c": "1239",
      "Cause": "Late Fees"
    },
    {
      "Acc No.": "56382",
      "Due Date": "19-01-1231",
      "Return Date": "12-01-1231",
      "Total*o*d*c": "139",
      "Cause": "Late Fees"
    },
    {
      "Acc No.": "56999",
      "Due Date": "29-01-1218",
      "Return Date": "12-01-1231",
      "Total*o*d*c": "134",
      "Cause": "Late Fees"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              'FUSION',
              style: TextStyle(
                color: Colors.white,
              ),
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
          body: ListView(children: <Widget>[
            SizedBox(height: 30),
            Center(
                child: Text(
              'LibraryDues On Returned Items',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            DataTable(
              columnSpacing: 10.0,
              columns: [
                DataColumn(
                    label: Text('Acc No.',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Due Date',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Days*o*d*c',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Total*o*d*c',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
              ],
              rows:
                  listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Container(
                                    width: 40, //SET width
                                    child: Text(element[
                                        "Acc No."]!))), //Extracting from Map element the value
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Due Date"]!))),
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Days*o*d*c"]!))),
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Total*o*d*c"]!))),
                              ],
                            )),
                      )
                      .toList(),
            ),
            SizedBox(height: 50),
            Center(
                child: Text(
              'LibraryDues On Non-Returned Items',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            DataTable(
              columnSpacing: 10.0,
              columns: [
                DataColumn(
                    label: Text('Acc No.',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Due Date',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Return Date',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Total*o*d*c',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Cause',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
              rows:
                  nonReturned // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Container(
                                    width: 40, //SET width
                                    child: Text(element[
                                        "Acc No."]!))), //Extracting from Map element the value
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Due Date"]!))),
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Return Date"]!))),
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Total*o*d*c"]!))),
                                DataCell(Container(
                                    width: 57, //SET width
                                    child: Text(element["Cause"]!))),
                              ],
                            )),
                      )
                      .toList(),
            ),
          ])),
    );
  }
}
