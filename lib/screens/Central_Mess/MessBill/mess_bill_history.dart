import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'dart:math';


class MessMonthlyBillHistory extends StatefulWidget {
  @override
  _MessMonthlyBillHistoryState createState() => _MessMonthlyBillHistoryState();
}

class _MessMonthlyBillHistoryState extends State<MessMonthlyBillHistory> {
  static List<String> _monthlyBillDates = [
    "Monthly Mess Bill for February successful 2024-02-02",
    "Monthly Mess Bill for February successful 2024-02-02",
    "Mess Monthly Mess Bill for February successful 2024-02-02",
    "Mess Monthly Mess Bill for February successful 2024-02-02",
    "Monthly Mess Bill for January successful 2024-01-26",
    "Monthly Mess Bill for February successful 2024-01-26",
    "Monthly Mess Bill for February successful 2024-02-02",
    "Monthly Mess Bill for February successful 2024-02-02",
    "Mess Monthly Mess Bill for February successful 2024-02-02",
    "Mess Monthly Mess Bill for February successful 2024-02-02",
    "Monthly Mess Bill for January successful 2024-01-26",
    "Monthly Mess Bill for January successful 2024-01-26",
    // Add more dates as needed
  ];

  String? _value1, _value2;
  int? _currentlyExpandedIndex;

  int _pageNumber = 1;
  int _pageSize = 5; // Number of items per page
  int _totalItems = _monthlyBillDates.length; // Total number of items (for demonstration)

  List<String> getPaginatedMonthlyBillDates() {
    int startIndex = (_pageNumber - 1) * _pageSize;
    int endIndex = min(_totalItems, startIndex + _pageSize);
    return _monthlyBillDates.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<String> paginatedMonthlyBillDates = getPaginatedMonthlyBillDates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: paginatedMonthlyBillDates.length,
            itemBuilder: (BuildContext context, int index) {
              final int serialNumber =
                  index + 1 + (_pageNumber - 1) * _pageSize;
              String date = paginatedMonthlyBillDates[index];
              return ExpansionTile(
                key: UniqueKey(), // Use UniqueKey to force rebuild the widget
                initiallyExpanded: index == _currentlyExpandedIndex,
                onExpansionChanged: (bool isExpanded) {
                  setState(() {
                    if (isExpanded) {
                      _currentlyExpandedIndex = index;
                    } else {
                      _currentlyExpandedIndex = null;
                    }
                  });
                },
                title: Text(
                  "$serialNumber. $date",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        IgnorePointer(
                          ignoring: true, // Set to true to disable user interaction
                          child: TextFormField(
                            maxLines: 4,
                            cursorHeight: 30,
                            decoration: InputDecoration(
                              labelText: "Payment Details",
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _pageNumber > 1
                  ? () {
                setState(() {
                  _pageNumber--;
                  _currentlyExpandedIndex = null;
                });
              }
                  : null,
            ),
            Text('Page $_pageNumber of ${(_totalItems / _pageSize).ceil()}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _pageNumber < (_totalItems / _pageSize).ceil()
                  ? () {
                setState(() {
                  _pageNumber++;
                  _currentlyExpandedIndex = null;
                });
              }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
