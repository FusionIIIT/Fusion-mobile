import 'package:flutter/material.dart';
import 'package:fusion/models/gymkhana.dart';

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
      rows: Srecords.map((srecord) => DataRow(cells: <DataCell>[
            DataCell(Text(srecord.Name)),
            DataCell(Text(srecord.Rollno)),
            DataCell(Text(srecord.Club)),
            DataCell(Text(srecord.Category)),
          ])).toList());

  @override
  Widget build(BuildContext context) {
    final GymkhanaData data =
        ModalRoute.of(context)!.settings.arguments as GymkhanaData;
    Srecords = data.membersDetails!
        .map((member) => Srecord(
            Name: member['name'],
            Rollno: member['rollno'],
            Club: member['club'],
            Category: member['category']))
        .toList();

    Srecords = <Srecord>[
      Srecord(
          Name: "Abhishek",
          Rollno: "22bcs012",
          Club: "Badminton",
          Category: "Sports"),
      Srecord(
          Name: "Pawan Singh",
          Rollno: "21bec098",
          Club: "Dance",
          Category: "Cultural"),
      Srecord(
          Name: "Rajat ",
          Rollno: "20bcs140",
          Club: "Basketball",
          Category: "Sports"),
    ];

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

  late String Name;
  late String Rollno;
  late String Club;
  late String Category;

  Srecord(
      {this.Name: "default-name",
      this.Rollno: "000000",
      this.Club: "default-club",
      this.Category: "default-category"});
}

var Srecords = <Srecord>[
  Srecord(
      Name: "default", Rollno: "default", Club: "default", Category: "default"),
];
