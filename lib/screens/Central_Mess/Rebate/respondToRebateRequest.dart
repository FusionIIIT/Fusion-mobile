import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';

class RespondToRebateRequest extends StatefulWidget {
  @override
  _RespondToRebateRequestState createState() => _RespondToRebateRequestState();
}

class _RespondToRebateRequestState extends State<RespondToRebateRequest> {
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

  String? status ;

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "2"},
    {"text": "Reject", "value": "0"},
  ];

  @override
  Widget build(BuildContext context) {
    final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
    String user = data.profile!['user_type'];
    user = "caretaker";
    // user = "warden";
    final List<Rebate> _modifiedRebateDates = (user == "student") ? _rebateDates.where((element) => (element.studentId == data.profile!['id'])).toList()
        : (user == "caretaker") ? _rebateDates.where((element) => (element.status == "1")).toList()
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
                  DataColumn(label: Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  _modifiedRebateDates.length,
                      (index) => DataRow(cells: [
                    DataCell(Text((index + 1).toString()+".")),
                    DataCell(Text(_modifiedRebateDates[index].appDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedRebateDates[index].studentId?? 'N/A')),
                    DataCell(Text(_modifiedRebateDates[index].leaveType)),
                    DataCell(Text(_modifiedRebateDates[index].purpose)),
                    DataCell(Text(_modifiedRebateDates[index].startDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedRebateDates[index].endDate.toString().substring(0, 10))),
                    // DataCell(Text(_modifiedRebateDates[index].status == "0" ? "Rejected" : _modifiedRebateDates[index].status == "1" ? "Pending" : "Accepted")),
                        DataCell(
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              hintText: 'Enter remark (optional)',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              // data['Remark'] = value;
                            },
                          ),
                        ),
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
                        validator: (value) => value == null ? "Select" : null,
                        dropdownColor: Colors.white,
                        value: status,
                        onChanged: (String? newValue) {
                          setState(() {
                            status = newValue!;
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
