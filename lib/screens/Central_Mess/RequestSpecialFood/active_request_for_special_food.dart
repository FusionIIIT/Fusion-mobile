import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class ActiveSpecialFoodRequest extends StatefulWidget {
  @override
  _ActiveSpecialFoodRequestState createState() => _ActiveSpecialFoodRequestState();
}

class _ActiveSpecialFoodRequestState extends State<ActiveSpecialFoodRequest> {
  static List<String> _feedbackDates = [
    "Mess 1 Cleanliness 2024-02-02",
    "Mess 2 Cleanliness 2024-02-02",
    "Mess 1 Food Quality 2024-02-02",
    "Mess 2 Food Quality 2024-02-02",
    "Mess 1 Cleanliness 2024-01-26",
    "Mess 2 Cleanliness 2024-01-26",
    "Mess 1 Food Quality 2024-01-26",
    "Mess 2 Food Quality 2024-01-26",
    "Mess 1 Cleanliness 2024-01-19",
    "Mess 2 Cleanliness 2024-01-19",
    "Mess 1 Food Quality 2024-01-19",
    "Mess 2 Food Quality 2024-01-19",
    "Mess 1 Cleanliness 2024-01-12",
    "Mess 2 Cleanliness 2024-01-12",
    "Mess 1 Food Quality 2024-01-12",
    "Mess 2 Food Quality 2024-01-12",
    "Mess 1 Cleanliness 2024-01-05",
    "Mess 2 Cleanliness 2024-01-05",
    "Mess 1 Food Quality 2024-01-05",
    "Mess 2 Food Quality 2024-01-05",
    // Add more dates as needed
  ];

  List<String> _feedbackActions = List.filled(20, '');

  int? _currentlyExpandedIndex;

  int _pageNumber = 1;
  int _pageSize = 5; // Number of items per page
  int _totalItems = _feedbackDates.length; // Total number of items (for demonstration)

  List<String> getPaginatedFeedbackDates() {
    int startIndex = (_pageNumber - 1) * _pageSize;
    int endIndex = min(_totalItems, startIndex + _pageSize);
    return _feedbackDates.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<String> paginatedFeedbackDates = getPaginatedFeedbackDates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: paginatedFeedbackDates.length,
            itemBuilder: (BuildContext context, int index) {
              final int serialNumber =
                  index + 1 + (_pageNumber - 1) * _pageSize;
              String date = paginatedFeedbackDates[index];
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
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _feedbackActions[index] = 'Accept';
                            });
                          },
                          child: Text('Accept'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _feedbackActions[index] = 'Reject';
                            });
                          },
                          child: Text('Reject'),
                        ),
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
