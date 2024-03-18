
import 'package:flutter/material.dart';

class HistoryOfSpecialFood extends StatefulWidget {
  @override
  _HistoryOfSpecialFoodState createState() => _HistoryOfSpecialFoodState();
}

class _HistoryOfSpecialFoodState extends State<HistoryOfSpecialFood> {

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
      'Student Id': 'S12345',
      'Request Dates': '2023-11-28 to 2023-12-02',
      'Food': 'Vegetarian',
      'Purpose': 'Attending workshop',
      'accept/reject': 'Accepted',
    },
    {
      'Date': '2023-12-05',
      'Student Id': 'S67890',
      'Request Dates': '2023-12-03 to 2023-12-07',
      'Food': 'Non-Vegetarian',
      'Purpose': 'Medical check-up',
      'accept/reject': 'Rejected',
    },
    {
      'Date': '2023-12-10',
      'Student Id': 'S24680',
      'Request Dates': '2023-12-08 to 2023-12-12',
      'Food': 'Vegan',
      'Purpose': 'Visiting family',
      'accept/reject': 'Accepted',
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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        horizontalMargin: 8,
        columns: buildTableHeader(),
        rows: buildTableRows(),
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
          return DataCell(
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(data[key]!),
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}

