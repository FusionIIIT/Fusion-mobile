import 'package:fusion/api.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePaymentHistory extends StatefulWidget {

  final Map<String, dynamic> userMessData;
  UpdatePaymentHistory({required this.userMessData});

  @override
  _UpdatePaymentHistoryState createState() => _UpdatePaymentHistoryState();
}

class _UpdatePaymentHistoryState extends State<UpdatePaymentHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;
  UpdatePaymentRequest? registrationData;
  static List<UpdatePaymentRequest> _updatePaymentRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchUpdatePaymentRequest();
  }

  void _fetchUpdatePaymentRequest() async {
    try {
      List<UpdatePaymentRequest> updatePaymentRequests =
      await _centralMessService.getUpdatePaymentRequest();
      // updatePaymentRequests.forEach((element) => print(element.studentId));
      print(widget.userMessData);
      setState(() {
        _updatePaymentRequests = updatePaymentRequests
            .where((element) => element.studentId == widget.userMessData['student_id'])
            .toList();
        _updatePaymentRequests
            .sort((a, b) => b.paymentDate.compareTo(a.paymentDate));
      });
      print('Received Update Payment Requests');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching update payment requests: $e');
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


  String? status;

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
    if (_updatePaymentRequests.length <= 0) {
      return [
        DataColumn(
          label: Text(
            'No Update Payment Requests!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    return _updatePaymentRequests.first.getKeysToDisplay().map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows() {
    return _updatePaymentRequests.map((data) {
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
          } else if (key.toLowerCase() == 'paymentdate') {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value.toString().substring(0, 10)),
              ),
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
