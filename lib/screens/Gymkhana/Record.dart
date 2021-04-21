import 'package:flutter/material.dart';

//TODO: Make Dynamic
class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Records(),
    );
  }
}

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
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
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                            "Member's Record",
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
