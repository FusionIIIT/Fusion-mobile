import 'package:flutter/material.dart';
import 'package:fusion/models/gymkhana.dart';

class ClubDropDown extends StatefulWidget {
  List? data;

  ClubDropDown({this.data});

  @override
  _ClubDropDownState createState() => _ClubDropDownState(data: this.data);
}

class _ClubDropDownState extends State<ClubDropDown> {
  int _value = 1;
  List? data;

  _ClubDropDownState({this.data});

  Widget sessionView() {
    TableRow header = TableRow(children: [
      Center(
        child: Text("\nVenue\n",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Center(
        child: Text("\nDate\n",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Center(
        child: Text("\nTime\n",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Center(
        child: Text("\nDetails\n",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ]);
    List<TableRow> rows = data!
        .map<TableRow>((srecord) => TableRow(children: [
              Center(
                  child: Text("\n" + srecord['venue'] + "\n",
                      style: TextStyle(fontSize: 16))),
              Center(
                  child: Text("\n" + srecord['date'] + "\n",
                      style: TextStyle(fontSize: 16))),
              Center(
                  child: Text("\n" + srecord['time'] + "\n",
                      style: TextStyle(fontSize: 16))),
              Center(
                  child: IconButton(
                      icon: Icon(Icons.attachment_sharp), onPressed: null)),
              // child: Text("\n" + srecord['details'] + "\n",
              //     style: TextStyle(fontSize: 16))),
            ]))
        .toList();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          [header],
          rows
        ].expand((x) => x).toList(),
      ),
    );
  }

  Widget build(BuildContext context) {
    // Srecords = data.membersDetails!.map((member) => Srecord(Name: member['name'], Rollno: member['rollno'], Club: member['club'], Category: member['category'])).toList();

    return Container(
        width: 200,
        //color: Colors.blue,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Club",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.black,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            DropdownButton(
                dropdownColor: Colors.deepOrangeAccent,
                elevation: 16,
                value: _value,
                isExpanded: true,
                hint: Text("-SELECT-"),
                items: [
                  DropdownMenuItem(
                    child: Text("--SELECT--"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Saaz"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Avartan"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("Electronics"),
                    value: 4,
                  ),
                ],
                onChanged: (int? value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            sessionView(),

          ],
        ));
  }
}
