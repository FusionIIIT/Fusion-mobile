import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;

class VacationFoodRequest extends StatefulWidget {
  @override
  _VacationFoodRequestState createState() =>
      _VacationFoodRequestState();
}

class _VacationFoodRequestState extends State<VacationFoodRequest> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  VacationFood? vacationFoodData;

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

  void _updateVacationFoodRequestData(data) async {
    try {
      http.Response menuItems =
          await _centralMessService.updateVacationFoodRequest(data);
      if (menuItems.statusCode == 200) {
        print('Updated the Vacation Food request');
        setState(() {
          _requestSent = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error updating vacation food Request: $e');
    }
  }

  String? status;

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "2"},
    {"text": "Reject", "value": "0"},
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    List<VacationFood> _modifiedVacationFoodRequests = (user == "student")
        ? _vacationFoodRequests
            .where((element) => (element.studentId == data.profile!['id']))
            .toList()
        : (user == "caretaker")
            ? _vacationFoodRequests
                .where((element) => (element.status == "1"))
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
                            label: Text('Action',
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
                          DataCell(Text(
                              _modifiedVacationFoodRequests[index].purpose ??
                                  'N/A')),
                          DataCell(
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: status != null ? null : 'Select',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepOrangeAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) =>
                                  value == null ? "Select" : null,
                              dropdownColor: Colors.white,
                              value: status,
                              onChanged: (String? newValue) {
                                setState(() {
                                  status = newValue!;
                                });
                                // print({_modifiedVacationFoodRequests[index].studentId, status, _modifiedVacationFoodRequests[index].item1});
                                setState(() {
                                  vacationFoodData = VacationFood(
                                    studentId: _modifiedVacationFoodRequests[index]
                                        .studentId,
                                    startDate: _modifiedVacationFoodRequests[index]
                                        .startDate,
                                    endDate: _modifiedVacationFoodRequests[index]
                                        .endDate,
                                    purpose:
                                        _modifiedVacationFoodRequests[index].purpose,
                                    status: status,
                                    appDate: _modifiedVacationFoodRequests[index]
                                        .appDate,
                                  );
                                  _updateVacationFoodRequestData(vacationFoodData);
                                  if (_requestSent == true) {
                                    initState();
                                  }
                                });
                              },
                              items: statusDropDownItems.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item["text"]!),
                                  value: item["value"],
                                );
                              }).toList(),
                            ),
                          ),
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
