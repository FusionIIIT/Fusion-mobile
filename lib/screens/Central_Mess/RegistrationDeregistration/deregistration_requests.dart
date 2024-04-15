import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/material.dart';

class DeRegistrationRequests extends StatefulWidget {
  @override
  _DeRegistrationRequestsState createState() => _DeRegistrationRequestsState();
}

class _DeRegistrationRequestsState extends State<DeRegistrationRequests> {

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;
  DeregistrationRequest? deregistrationData;
  static List<DeregistrationRequest> _deregistrationRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchDeregistrationRequest();
  }

  void _fetchDeregistrationRequest() async {
    try {
      List<DeregistrationRequest> deregistrationRequests =
          await _centralMessService.getDeregistrationRequest();
      setState(() {
        _deregistrationRequests = deregistrationRequests.where((element) => element.status == "pending").toList();
        // _deregistrationRequests
        //     .sort((a, b) => b.startDate.compareTo(a.startDate));
      });
      print('Received Deregistrations');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching deregistrations: $e');
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }
  String? status;
  List<Map<String, dynamic>> tableData = [
    {
      'Student Id': '21BCS128',
      'Mess': 'Mess1',
      'Remark': 'No remarks',
      'Accept/Reject': 'Accepted',
    },
    {
      'Student Id': '21BCS064',
      'Mess': 'Mess2',
      'Remark': 'Out of tokens',
      'Accept/Reject': 'Rejected',
    },
    {
      'Student Id': '21BCS133',
      'Mess': 'Mess1',
      'Remark': 'Out of tokens',
      'Accept/Reject': 'Accepted',
    },
  ];

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "accepted"},
    {"text": "Reject", "value": "rejected"},
  ];

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = ElevatedButton.styleFrom(
    //   textStyle: const TextStyle(
    //       fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
    //   backgroundColor: Colors.white,
    //   shadowColor: Colors.black,
    // );

    return _loading == true
        ? Center(child: CircularProgressIndicator())
        : (SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        horizontalMargin: 8,
        columns: buildTableHeader(),
        rows: buildTableRows(),
      ),
    ));
  }

  List<DataColumn> buildTableHeader() {
    return _deregistrationRequests.first.getKeysToDisplay().map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows() {
    return _deregistrationRequests.map((data) {
      return DataRow(
        cells: data.toMap().keys.map((key) {
          if (key.toLowerCase() == 'status') {
            return DataCell(
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
            );
          } else if (key.toLowerCase() == 'deregistrationremark') {
            return DataCell(
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  hintText: 'Remark (optional)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  data.deregistrationRemark = value;
                },
              ),
            );
          }else {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value.toString()),
              ),
            );
          }
        }).toList(),
      );
    }).toList();
  }
}

