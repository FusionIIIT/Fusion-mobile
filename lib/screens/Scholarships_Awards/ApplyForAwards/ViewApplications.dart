import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart';

class ViewApplications extends StatefulWidget {
  @override
  _ViewApplicationsState createState() => _ViewApplicationsState();
}

final List<Map<String, String>> awards = [
  {
    "Name": " ",
    "Application ID": " ",
    "Applied Date": " ",
    "Status": " ",
  }
];

class _ViewApplicationsState extends State<ViewApplications> {
  

  @override
  Widget build(BuildContext context) {
    return listView();
  }
}

//Main component to render the table..
ListView listView() {
  return ListView(
    children: [
      SizedBox(height: 40),
      ToggleSwitch(
        minWidth: 800,
        initialLabelIndex: 0,
        totalSwitches: 2,
        activeBgColor: [Colors.orange],
        activeFgColor: Colors.white,
        inactiveBgColor: Color.fromARGB(255, 214, 214, 214),
        inactiveFgColor: Colors.grey[900],

        labels: ['Current','History'],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
      SizedBox(height: 10),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "Current Applications",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.deepOrangeAccent,
            ),
          )),
        ),
      ),
      SizedBox(height: 20),
      //To scroll pass the width
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        //Component to lay table on the page
        child: DataTable(
          // headingRowColor:
          //     MaterialStateColor.resolveWith((states) => Colors.blue),
          dataRowHeight: 80.0,
          columnSpacing: 28.0,
          columns: [
            //DataColumns to lay columns of the table
            DataColumn(
                label: Text('Name',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Application ID',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Applied Date',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Status',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          ],
          //This method will get lay all the rows
          rows: awardList(),
        ),
      ),
    ],
  );
}

List<DataRow> awardList() {
  //Get the list of json and map through, to select each json and lay row to the table..
  return awards
      .map(
        ((element) => DataRow(
              cells: <DataCell>[
                DataCell(Container(
                    width: 40, //SET width
                    child: Text(element[
                        "Name"]!))), //Extracting from Map element the value
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Application ID"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Applied Date"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Status"]!))),
              ],
            )),
      )
      .toList();
}
