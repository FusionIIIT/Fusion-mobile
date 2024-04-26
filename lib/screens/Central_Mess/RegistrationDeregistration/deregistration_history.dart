import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/Central_Mess/expandable_text.dart';

class DeRegistrationHistory extends StatefulWidget {
  final Map<String, dynamic> userMessData;
  DeRegistrationHistory({required this.userMessData});

  @override
  _DeRegistrationHistoryState createState() => _DeRegistrationHistoryState();
}

class _DeRegistrationHistoryState extends State<DeRegistrationHistory> {
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
        _deregistrationRequests = deregistrationRequests
            .where((element) => element.studentId == widget.userMessData['student_id'])
            .toList();
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


  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "accepted"},
    {"text": "Reject", "value": "rejected"},
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
    if (_deregistrationRequests.length <= 0) {
      return [
        DataColumn(
          label: Text(
            'No Deregistration Requests!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
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
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value == 'accept' ? "Accepted" : value == 'pending' ? "Pending" : "Rejected"),
              ),
            );
          } else if (key.toLowerCase() == 'enddate') {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value.toString().substring(0, 10)),
              ),
            );
          }else if (key.toLowerCase() == 'deregistrationremark') {
            return DataCell(ExpandableText(text: data.deregistrationRemark ?? 'N/A', maxLines: 1)
            );
          }  else {
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
