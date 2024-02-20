import 'package:flutter/material.dart';
// import 'package:date_field/date_field.dart';
import 'dart:math';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';


class FeedbackHistory extends StatefulWidget {
  @override
  _FeedbackHistoryState createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  CentralMessService _centralMessService = CentralMessService();

  static List<MessFeedback> _feedbackDates = [
    // "Mess 1 Cleanliness 2024-02-02",
    // "Mess 2 Cleanliness 2024-02-02",
    // "Mess 1 Food Quality 2024-02-02",
    // "Mess 2 Food Quality 2024-02-02",
    // "Mess 1 Cleanliness 2024-01-26",
    // "Mess 2 Cleanliness 2024-01-26",
    // "Mess 1 Food Quality 2024-01-26",
    // "Mess 2 Food Quality 2024-01-26",
    // "Mess 1 Cleanliness 2024-01-19",
    // "Mess 2 Cleanliness 2024-01-19",
    // "Mess 1 Food Quality 2024-01-19",
    // "Mess 2 Food Quality 2024-01-19",
    // "Mess 1 Cleanliness 2024-01-12",
    // "Mess 2 Cleanliness 2024-01-12",
    // "Mess 1 Food Quality 2024-01-12",
    // "Mess 2 Food Quality 2024-01-12",
    // "Mess 1 Cleanliness 2024-01-05",
    // "Mess 2 Cleanliness 2024-01-05",
    // "Mess 1 Food Quality 2024-01-05",
    // "Mess 2 Food Quality 2024-01-05",
    // "Mess 2 Food Quality 2024-01-05",
    // "Mess 2 Food Quality 2024-01-05",
    // "Mess 2 Food Quality 2024-01-05",
    // "Mess 2 Food Quality 2024-01-05",
    // Add more dates as needed
  ];

  @override
  void initState() {
    super.initState();
    _fetchFeedbackData(); // Fetch feedback data when the widget initializes
  }

  void _fetchFeedbackData() async {
    try {
      List<MessFeedback> feedbackDates = await _centralMessService.getFeedback();
      setState(() {
        _feedbackDates = feedbackDates;
        _feedbackDates.sort((a, b) => b.fdate.compareTo(a.fdate));
      });
      print('Received Feedbacks');
    } catch (e) {
      print('Error fetching feedback: $e');
    }
  }


  // String? _value1, _value2;
  int? _currentlyExpandedIndex;

  int _pageNumber = 1;
  int _pageSize = 5; // Number of items per page
  int _totalItems = _feedbackDates.length; // Total number of items (for demonstration)

  List<MessFeedback> getPaginatedFeedbackDates() {
    int startIndex = (_pageNumber - 1) * _pageSize;
    int endIndex = min(_totalItems, startIndex + _pageSize);
    return _feedbackDates.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<MessFeedback> paginatedFeedbackDates = getPaginatedFeedbackDates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: paginatedFeedbackDates.length,
            itemBuilder: (BuildContext context, int index) {
              final int serialNumber =
                  index + 1 + (_pageNumber - 1) * _pageSize;
              MessFeedback date = paginatedFeedbackDates[index];
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
                  "$serialNumber. " + " [Mess: " + date.mess + "] [Type: " + date.feedbackType + "]",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                            initialValue: date.description,
                            decoration: InputDecoration(
                              labelText: "Feedback Details",
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Text(
                          date.fdate.toString(),
                          style: TextStyle(fontSize: 12),
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
