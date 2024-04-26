import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/screens/Central_Mess/expandable_text.dart';

class RebateHistory extends StatefulWidget {
  @override
  _RebateHistoryState createState() => _RebateHistoryState();
}

class _RebateHistoryState extends State<RebateHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;

  static List<Rebate> _rebateDates = [];

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
  // int? _currentlyExpandedIndex;

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
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    final List<Rebate> _modifiedRebateDates = (user == "student") ? _rebateDates.where((element) => (element.studentId == data.profile!['id'])).toList()
        : (user == "caretaker") ? _rebateDates.where((element) => (element.status != "1")).toList()
        : _rebateDates;

    return _loading == true ? Center(child: CircularProgressIndicator()) : (SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 14,
                horizontalMargin: 8,
                columns: [
                  DataColumn(label: Text('S. No.', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Date(yyyy-mm-dd)', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Purpose', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  _modifiedRebateDates.length,
                      (index) => DataRow(cells: [
                    DataCell(Text((index + 1).toString()+".")),
                    DataCell(Text(_modifiedRebateDates[index].appDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedRebateDates[index].studentId?? 'N/A')),
                    DataCell(Text(_modifiedRebateDates[index].leaveType)),
                    DataCell(ExpandableText(text: _modifiedRebateDates[index].purpose ?? 'N/A', maxLines: 1)),
                    DataCell(Text(_modifiedRebateDates[index].startDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedRebateDates[index].endDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedRebateDates[index].status == "0" ? "Rejected" : _modifiedRebateDates[index].status == "1" ? "Pending" : "Accepted")),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
