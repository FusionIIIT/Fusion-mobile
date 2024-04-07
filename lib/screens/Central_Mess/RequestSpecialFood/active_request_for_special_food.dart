
import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;

class ActiveSpecialFoodRequest extends StatefulWidget {
  @override
  _ActiveSpecialFoodRequestState createState() => _ActiveSpecialFoodRequestState();
}

class _ActiveSpecialFoodRequestState extends State<ActiveSpecialFoodRequest> {

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  SpecialRequest? specialData;

  static List<SpecialRequest> _specialRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchSpecialRequests(); // Fetch feedback data when the widget initializes
  }

  void _fetchSpecialRequests() async {
    try {
      List<SpecialRequest> rebateDates = await _centralMessService.getSpecialRequest();
      setState(() {
        _specialRequests = rebateDates;
        _specialRequests.sort((a, b) => b.appDate.compareTo(a.appDate));
      });
      print('Received Special Requests');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching Special Requests: $e');
    }
  }

  void _updateSpecialRequestData(data) async {
    try {
      http.Response menuItems = await _centralMessService.updateSpecialRequest(data);
      if (menuItems.statusCode == 200) {
        print('Updated the special request');
        setState(() {
          _requestSent = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error updating Special Request: $e');
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
    user = user.toLowerCase();
    user = "caretaker";
    // user = "warden";
    List<SpecialRequest> _modifiedSpecialRequests = (user == "student") ? _specialRequests.where((element) => (element.studentId == data.profile!['id'])).toList()
        : (user == "caretaker") ? _specialRequests.where((element) => (element.status == "1")).toList()
        : _specialRequests;

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
                columns: [
                  DataColumn(label: Text('S. No.', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Date(yyyy-mm-dd)', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Request', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Item', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Meal Time', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  _modifiedSpecialRequests.length,
                      (index) => DataRow(cells: [
                    DataCell(Text((index + 1).toString()+".")),
                    DataCell(Text(_modifiedSpecialRequests[index].appDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].studentId?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].startDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].endDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].request?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].item1?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].item2?? 'N/A')),
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
                          // print({_modifiedSpecialRequests[index].studentId, status, _modifiedSpecialRequests[index].item1});
                          setState(() {
                            specialData = SpecialRequest(
                              studentId: _modifiedSpecialRequests[index].studentId,
                              startDate: _modifiedSpecialRequests[index].startDate!,
                              endDate: _modifiedSpecialRequests[index].endDate!,
                              request: _modifiedSpecialRequests[index].request,
                              status: status,
                              item1: _modifiedSpecialRequests[index].item1!,
                              item2: _modifiedSpecialRequests[index].item2!,
                              appDate: _modifiedSpecialRequests[index].appDate!,
                            );
                            _updateSpecialRequestData(specialData);
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

