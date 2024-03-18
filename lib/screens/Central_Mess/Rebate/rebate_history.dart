import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:date_field/date_field.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';

class RebateHistory extends StatefulWidget {
  @override
  _RebateHistoryState createState() => _RebateHistoryState();
}

class _RebateHistoryState extends State<RebateHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;

  static List<Rebate> _rebateDates = [
    // "From 2024-02-17 To 2024-02-18",
    // "From 2024-02-16 To 2024-02-17",
    // "From 2024-02-15 To 2024-02-16",
    // "From 2024-02-14 To 2024-02-15",
    // "From 2024-02-13 To 2024-02-14",
    // "From 2024-02-12 To 2024-02-13",
    // "From 2024-02-11 To 2024-02-12",
    // "From 2024-02-10 To 2024-02-11",
    // "From 2024-02-09 To 2024-02-10",
    // "From 2024-02-08 To 2024-02-09",
    // "From 2024-02-07 To 2024-02-08",
    // "From 2024-02-06 To 2024-02-07",
    // "From 2024-02-05 To 2024-02-06",
    // "From 2024-02-04 To 2024-02-05",
    // "From 2024-02-03 To 2024-02-04",
    // "From 2024-02-02 To 2024-02-03",
    // "From 2024-02-01 To 2024-02-02",
    // "From 2024-01-31 To 2024-02-01",
    // "From 2024-01-30 To 2024-01-31",
    // "From 2024-01-29 To 2024-01-30",
    // Add more dates as needed
  ];

  @override
  void initState() {
    super.initState();
    _fetchFeedbackData(); // Fetch feedback data when the widget initializes
  }

  void _fetchFeedbackData() async {
    try {
      List<Rebate> rebateDates = await _centralMessService.getRebate();
      setState(() {
        _rebateDates = rebateDates;
        _rebateDates.sort((a, b) => b.appDate.compareTo(a.appDate));
      });
      print('Received Rebates');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching Rebates: $e');
    }
  }

  // String? _value1, _value2;
  int? _currentlyExpandedIndex;

  int _pageNumber = 1;
  int _pageSize = 5; // Number of items per page
  int _totalItems = _rebateDates.length; // Total number of items (for demonstration)

  List<Rebate> getPaginatedRebateDates() {
    int startIndex = (_pageNumber - 1) * _pageSize;
    int endIndex = min(_totalItems, startIndex + _pageSize);
    return _rebateDates.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<Rebate> paginatedRebateDates = getPaginatedRebateDates();

    return _loading == true ? Center(child: CircularProgressIndicator()) : (Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: paginatedRebateDates.length,
            itemBuilder: (BuildContext context, int index) {
              final int serialNumber =
                  index + 1 + (_pageNumber - 1) * _pageSize;
              Rebate date = paginatedRebateDates[index];
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
                  "$serialNumber. " + date.startDate.toString().substring(0, 10) + " to " + date.endDate.toString().substring(0, 10),
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
                            initialValue: date.purpose,
                            decoration: InputDecoration(
                              labelText: "Reason",
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Text(
                          date.appDate.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(IconData(0xe159, fontFamily: 'MaterialIcons')),
                    Text(" Accepted"),
                  ],
                )
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
    ));
  }
}