import 'package:flutter/material.dart';

//TODO: Make Dynamic
class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Records(),
    );
  }
}

class Records extends StatelessWidget {
  Widget bodyData() => DataTable(
      columnSpacing: 35,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Name"),
          numeric: false,
          onSort: (i, b) {},
        ),
        DataColumn(
          label: Text("Rollno"),
          numeric: false,
          onSort: (i, b) {},
        ),
        DataColumn(
          label: Text("Club"),
          numeric: false,
          onSort: (i, b) {},
        ),
        DataColumn(
          label: Text("Category"),
          numeric: false,
          onSort: (i, b) {},
        ),
      ],
      rows: Srecords.map((srecord) => DataRow(cells: [
            DataCell(Text(srecord.Name!)),
            DataCell(Text(srecord.Rollno!)),
            DataCell(Text(srecord.Club!)),
            DataCell(Text(srecord.Category!)),
          ])).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Records'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(5.0),
                  child:
                      Text("Member's Record", style: TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
            bodyData(),
          ],
        ));
  }
}

class Srecord {
  // Student record class

  String? Name;
  String? Rollno;
  String? Club;
  String? Category;

  Srecord({this.Name, this.Rollno, this.Club, this.Category});
}

var Srecords = <Srecord>[
  Srecord(Name: "Pawan", Rollno: "430", Club: "Cricket", Category: "sports"),
];
