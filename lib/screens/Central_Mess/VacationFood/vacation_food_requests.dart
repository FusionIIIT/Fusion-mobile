
import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;

class VacationFoodRequest extends StatefulWidget {
  @override
  _VacationFoodRequestState createState() => _VacationFoodRequestState();
}

class _VacationFoodRequestState extends State<VacationFoodRequest> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  VacationFood? vacationFoodData;

  List<VacationFood> _vacationFoodRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchVacationFoodRequests(); // Fetch feedback data when the widget initializes
  }

  Future<List<VacationFood>> _fetchVacationFoodRequests() async {
    List<VacationFood> vacationFoodRequests = [];
    try {
      vacationFoodRequests = await _centralMessService.getVacationFoodRequest();
      if (mounted) {
        setState(() {
          _vacationFoodRequests = vacationFoodRequests;
          _vacationFoodRequests.sort((a, b) => b.appDate.compareTo(a.appDate));
          _loading = false;
        });
      }
      print('Received Vacation Food Requests');
    } catch (e) {
      print('Error fetching Vacation Food Requests: $e');
    }
    return vacationFoodRequests;
  }


  // void _updateVacationFoodRequestData(VacationFood data) async {
  //   setState(() {
  //     _loading = true; // Set loading state to true before making the update request
  //   });
  //
  //   try {
  //     http.Response menuItems =
  //     await _centralMessService.updateVacationFoodRequest(data);
  //     if (menuItems.statusCode == 200) {
  //       print('Updated the Vacation Food request');
  //       setState(() {
  //         _requestSent = true;
  //       });
  //       // Reload vacation food requests after updating
  //       await _fetchVacationFoodRequests(); // Wait for fetch to complete before setting loading to false
  //     } else {
  //       print('Couldn\'t send');
  //     }
  //   } catch (e) {
  //     print('Error updating vacation food Request: $e');
  //   }
  //
  //   setState(() {
  //     _loading = false; // Set loading state to false after update request completes
  //   });
  // }
  void _updateVacationFoodRequestData(VacationFood data) async {
    setState(() {
      _loading = true; // Set loading state to true before making the update request
    });

    try {
      http.Response menuItems =
      await _centralMessService.updateVacationFoodRequest(data);
      if (menuItems.statusCode == 200) {
        print('Updated the Vacation Food request');
        setState(() {
          _requestSent = true;
          // Remove the updated request from the list
          _vacationFoodRequests.remove(data);
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error updating vacation food Request: $e');
    }

    setState(() {
      _loading = false; // Set loading state to false after update request completes
    });
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
    List<VacationFood> _filteredVacationFoodRequests = (user == "student")
        ? _vacationFoodRequests
        .where((element) => (element.studentId == data.profile!['id']))
        .toList()
        : (user == "caretaker")
        ? _vacationFoodRequests
        .where((element) => (element.status == "1"))
        .toList()
        : _vacationFoodRequests;


    if (user == "student") {
      _filteredVacationFoodRequests = _vacationFoodRequests
          .where((element) => element.studentId == data.profile!['id'])
          .toList();
    } else if (user == "caretaker") {
      _filteredVacationFoodRequests = _vacationFoodRequests
          .where((element) => element.status == "1")
          .toList();
    }

    return _loading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
            _filteredVacationFoodRequests.length,
                (index) => DataRow(cells: [
              DataCell(Text((index + 1).toString() + ".")),
              DataCell(Text(
                  _filteredVacationFoodRequests[index]
                      .appDate
                      .toString()
                      .substring(0, 10))),
              DataCell(Text(
                  _filteredVacationFoodRequests[index].studentId ??
                      'N/A')),
              DataCell(Text(
                  _filteredVacationFoodRequests[index]
                      .startDate
                      .toString()
                      .substring(0, 10))),
              DataCell(Text(
                  _filteredVacationFoodRequests[index]
                      .endDate
                      .toString()
                      .substring(0, 10))),
              DataCell(Text(
                  _filteredVacationFoodRequests[index].purpose ??
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
                    setState(() {
                      vacationFoodData = VacationFood(
                        studentId:
                        _filteredVacationFoodRequests[index]
                            .studentId,
                        startDate:
                        _filteredVacationFoodRequests[index]
                            .startDate,
                        endDate:
                        _filteredVacationFoodRequests[index]
                            .endDate,
                        purpose:
                        _filteredVacationFoodRequests[index]
                            .purpose,
                        status: status,
                        appDate:
                        _filteredVacationFoodRequests[index]
                            .appDate,
                      );
                      _updateVacationFoodRequestData(vacationFoodData!);
                      if (_requestSent == true) {
                        _fetchVacationFoodRequests();
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
    );
  }
}

