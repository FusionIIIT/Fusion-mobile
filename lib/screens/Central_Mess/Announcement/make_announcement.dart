import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class MakeAnnouncement extends StatefulWidget {
  @override
  _MakeAnnouncementState createState() => _MakeAnnouncementState();
}

//int get _value=>_value;

class _MakeAnnouncementState extends State<MakeAnnouncement> {
  String?_value1, _value2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 200,
      //height: 120,
      //color: Colors.blue,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(30.0),
      child: ListView(
        children: [
          Text(
            "Mess",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              height: 0.5,
              width: 130.0,
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          DropdownButton(
              dropdownColor: Colors.deepOrangeAccent,
              elevation: 16,
              value: _value1,
              isExpanded: true,
              hint: Text("-SELECT-"),
              items: [
                DropdownMenuItem<String>(
                  child: Text("--SELECT--"),
                  value: null,
                ),
                DropdownMenuItem<String>(
                  child: Text("Mess-1"),
                  value: "mess1",
                ),
                DropdownMenuItem<String>(
                  child: Text("Mess-2"),
                  value: "mess2",
                ),
                DropdownMenuItem<String>(
                  child: Text("Both Mess-1 & Mess-2"),
                  value: "mess1&mess2",
                ),

              ],
              onChanged: (String? value) {
                setState(() {
                  _value1 = value;
                });
              }
            ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          Text(
            "Type of Announcement",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              height: 0.5,
              width: 130.0,
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          DropdownButton(
              dropdownColor: Colors.deepOrangeAccent,
              elevation: 16,
              value: _value2,
              isExpanded: true,
              hint: Text("-SELECT-"),
              items: [
                DropdownMenuItem<String>(
                  child: Text("--SELECT--"),
                  value: null,
                ),
                DropdownMenuItem<String>(
                  child: Text("Change in Mess Time"),
                  value: "changeInMessTime",
                ),
                DropdownMenuItem<String>(
                  child: Text("Any Guidelines"),
                  value: "anyGuidelines",
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  _value2 = value;
                });
              }),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          TextFormField(
            maxLines: 4,
            cursorHeight: 30,
            decoration: new InputDecoration(
              labelText: "Feedback Details",
              fillColor: Colors.white,
              border: new OutlineInputBorder(),
              //fillColor: Colors.green
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Center(
            child: TextButton(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 15.0),
              ),
              // color: Colors.deepOrangeAccent,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
