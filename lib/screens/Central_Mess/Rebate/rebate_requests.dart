import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class RebateRequests extends StatefulWidget {
  @override
  _RebateRequestsState createState() => _RebateRequestsState();
}

class _RebateRequestsState extends State<RebateRequests> {

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  List<Map<String, String>> tableData = [
    {
      'Date': '2023-12-01',
      'Student': 'Alice',
      'Type':'Leave',
      'Purpose': 'Library',
      'From': '10:00 AM',
      'To': '12:00 PM',
      'Approve': 'Yes',
      'Remark': 'No remarks',
    },
    {
      'Date': '2023-12-01',
      'Student': 'Alice',
      'Type':'Leave',
      'Purpose': 'Library and I cant go home so that I have done',
      'From': '10:00 AM',
      'To': '12:00 PM',
      'Approve': 'Yes',
      'Remark': 'No remarks',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            ElevatedButton(
              style: style,
              onPressed: () {
                // Handle post API accept all request
              },
              child: Text("Accept All Requests"),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                    columnSpacing: 12,
                    horizontalMargin: 8,
                    columns: buildTableHeader(),
                    rows: buildTableRows(),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> buildTableHeader() {
    return tableData.first.keys.map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows() {
    return tableData.map((data) {
      return DataRow(
        cells: data.keys.map((key) {
          if (key.toLowerCase() == 'approve') {
            return DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Accept action
                      // Call API post method
                      // Remove item from list
                    },
                    child: Text('Accept'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Reject action
                      // Call API post method
                      // Remove item from list
                    },
                    child: Text('Reject'),
                  ),
                ],
              ),
            );
          } else if (key == 'Remark') {
            return DataCell(
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  hintText: 'Enter remark (optional)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  data['Remark'] = value;
                },
              ),
            );
          } else {
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(data[key]!),
              ),
            );
          }
        }).toList(),
      );
    }).toList();
  }
}

