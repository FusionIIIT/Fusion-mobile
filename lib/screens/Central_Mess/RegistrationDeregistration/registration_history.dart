import 'package:fusion/api.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fusion/screens/Central_Mess/expandable_text.dart';

class RegistrationHistory extends StatefulWidget {

  final Map<String, dynamic> userMessData;
  RegistrationHistory({required this.userMessData});

  @override
  _RegistrationHistoryState createState() => _RegistrationHistoryState();
}

class _RegistrationHistoryState extends State<RegistrationHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;
  RegistrationRequest? registrationData;
  static List<RegistrationRequest> _registrationRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchRegistrationRequest();
  }

  void _fetchRegistrationRequest() async {
    try {
      List<RegistrationRequest> registrationRequests =
          await _centralMessService.getRegistrationRequest();
          // registrationRequests.forEach((element) => print(element.studentId));
          print(widget.userMessData);
      setState(() {
        _registrationRequests = registrationRequests
            .where((element) => element.studentId == widget.userMessData['student_id'])
            .toList();
        _registrationRequests
            .sort((a, b) => b.paymentDate.compareTo(a.paymentDate));
      });
      print('Received Registrations');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching registrations: $e');
    }
  }

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "2"},
    {"text": "Reject", "value": "0"},
  ];
  List<Map<String, String>> menuDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];

  @override
  Widget build(BuildContext context) {

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
    if (_registrationRequests.length <= 0) {
      return [
        DataColumn(
          label: Text(
            'No Registration Requests!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    return _registrationRequests.first.getKeysToDisplay().map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows() {
    return _registrationRequests.map((data) {
      return DataRow(
        cells: data.toMap().keys.map((key) {
          if (key.toLowerCase() == 'img') {
            var imageUrl = Uri.http(kCentralMess, 'mess${data.toMap()[key]}');
            return DataCell(
              InkWell(
                child: DefaultTextStyle(
                  style: TextStyle(color: Color.fromARGB(255, 33, 93, 243)),
                  child: Text('View Image'),
                ),
                onTap: () async {
                  if (await canLaunchUrl(imageUrl)) {
                    await launchUrl(imageUrl);
                  } else {
                    print('Could not launch $imageUrl');
                  }
                },
              ),
            );
          } else if (key.toLowerCase() == 'status') {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value == 'accept' ? "Accepted" : value == 'pending' ? "Pending" : "Rejected"),
              ),
            );
          } else if (key.toLowerCase() == 'paymentdate' || key.toLowerCase() == 'startdate') {
          var value = data.toMap()[key];
          return DataCell(
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(value.toString().substring(0, 10)),
            ),
          );
          } else if (key.toLowerCase() == 'registrationremark') {
            return DataCell(ExpandableText(text: data.registrationRemark ?? 'N/A', maxLines: 1)
            );
          } else {
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
