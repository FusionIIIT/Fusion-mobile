import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/screens/Central_Mess/expandable_text.dart';

class HistoryOfVactionFood extends StatefulWidget {
  @override
  _HistoryOfVactionFoodState createState() => _HistoryOfVactionFoodState();
}

class _HistoryOfVactionFoodState extends State<HistoryOfVactionFood> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;

  static List<VacationFood> _vacationFoodRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchVactionFoodRequests(); // Fetch feedback data when the widget initializes
  }

  void _fetchVactionFoodRequests() async {
    try {
      List<VacationFood> rebateDates =
          await _centralMessService.getVacationFoodRequest();
      setState(() {
        _vacationFoodRequests = rebateDates;
        _vacationFoodRequests.sort((a, b) => b.appDate.compareTo(a.appDate));
      });
      print('Received Vacation Food Requests');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching Vacation Food Requests: $e');
    }
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
    final List<VacationFood> _modifiedVacationFoodRequests = (user == "student")
        ? _vacationFoodRequests
            .where((element) => (element.studentId == data.profile!['id']))
            .toList()
        : (user == "caretaker")
            ? _vacationFoodRequests
                .where((element) => (element.status != "1"))
                .toList()
            : _vacationFoodRequests;

    return _loading == true
        ? Center(child: CircularProgressIndicator())
        : (SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 14,
                      horizontalMargin: 8,
                      columns: [
                        DataColumn(
                            label: Text('S. No.',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Date(yyyy-mm-dd)',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Student ID',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Start Date',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('End Date',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Purpose',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Status',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: List.generate(
                        _modifiedVacationFoodRequests.length,
                        (index) => DataRow(cells: [
                          DataCell(Text((index + 1).toString() + ".")),
                          DataCell(Text(_modifiedVacationFoodRequests[index]
                              .appDate
                              .toString()
                              .substring(0, 10))),
                          DataCell(Text(
                              _modifiedVacationFoodRequests[index].studentId ??
                                  'N/A')),
                          DataCell(Text(_modifiedVacationFoodRequests[index]
                              .startDate
                              .toString()
                              .substring(0, 10))),
                          DataCell(Text(_modifiedVacationFoodRequests[index]
                              .endDate
                              .toString()
                              .substring(0, 10))),
                          DataCell(ExpandableText(text: _modifiedVacationFoodRequests[index].purpose ?? 'N/A', maxLines: 1)),
                          DataCell(Text(_modifiedVacationFoodRequests[index]
                                      .status ==
                                  "0"
                              ? "Rejected"
                              : _modifiedVacationFoodRequests[index].status == "1"
                                  ? "Pending"
                                  : "Accepted")),
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
