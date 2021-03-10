import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class IssuedItems extends StatefulWidget {
  @override
  _IssuedItemsState createState() => _IssuedItemsState();
}

class _IssuedItemsState extends State<IssuedItems> {
  final List<Map<String, String>> listOfColumns = [
    {"Acc No.": "56382", "Book Name": "Introduction to Data Structure and Flutter", "Issued Date": "12-10-2021" , "Due Date":"12-10-2101"},
    {"Acc No.": "12313", "Book Name": "Introduction to Data Structure and Flutter - Web", "Issued Date": "12-10-2021" , "Due Date":"12-10-2101"},
    {"Acc No.": "23123", "Book Name": "Introduction to Flutter", "Issued Date": "12-10-2021" , "Due Date":"12-10-2101"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Issued Items'),
            backgroundColor: Colors.black,
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                            "Issued Items",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      border: new Border.all(
                        color: Colors.deepOrange,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        )
                      ],
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(5.0)),
                    ),
                  ),
                )),
            SizedBox(height: 20),
            DataTable(
                columnSpacing: 10.0,
              columns: [
                DataColumn(label: Text(
                    'Acc No.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Book Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Issued Date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Due Date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                )),
              ],
              rows:
              listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                  .map(
                ((element) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                        Container(
                            width: 40, //SET width
                            child: Text(element["Acc No."]!))), //Extracting from Map element the value
                    DataCell(Container(
                        width: 150, //SET width
                        child: Text(element["Book Name"]!))),
                    DataCell(Container(
                        width: 57, //SET width
                        child: Text(element["Issued Date"]!))),
                    DataCell(Container(
                        width: 57, //SET width
                        child: Text(element["Due Date"]!))),
                  ],
                )),
              )
                  .toList(),
            ),
          ])
      );
  }
}

