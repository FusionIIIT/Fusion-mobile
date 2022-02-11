import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/pending_complaints.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/resolved_complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';
import 'declined_complaints.dart';
import 'on-hold_complaints.dart';

final List<Map<String, String>> listOfColumns = [
  {
    "Acc No.": "56382",
    "Due Date": "12-01-1231",
    "Days*o*d*c": "43",
    "Total*o*d*c": "1239"
  },
  {
    "Acc No.": "56382",
    "Due Date": "19-01-1231",
    "Days*o*d*c": "13",
    "Total*o*d*c": "139"
  },
  {
    "Acc No.": "56999",
    "Due Date": "29-01-1218",
    "Days*o*d*c": "93",
    "Total*o*d*c": "134"
  },
];

class ComplainHistory extends StatefulWidget {
  @override
  _ComplainHistoryState createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {
  bool _loading1 = true;
  //integrating_api
  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintDataUserStudent data;

  int step = 0;

  @override
  void initState() {
    super.initState();

    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        print(data.student_complain);
        //print(data);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _complaintController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _loading1 == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 10.0,
                      columns: [
                        DataColumn(
                            label: Text('Acc No.',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Due Date',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Days*o*d*c',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Total*o*d*c',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: iterateList(),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

List<DataRow> iterateList() {
  if (listOfColumns.isNotEmpty) {
    return listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
        .map(
          ((element) => DataRow(
                cells: <DataCell>[
                  DataCell(Container(
                      width: 40, //SET width
                      child: Text(element[
                          "Acc No."]!))), //Extracting from Map element the value
                  DataCell(Container(
                      width: 57, //SET width
                      child: Text(element["Due Date"]!))),
                  DataCell(Container(
                      width: 57, //SET width
                      child: Text(element["Days*o*d*c"]!))),
                  DataCell(Container(
                      width: 57, //SET width
                      child: Text(element["Total*o*d*c"]!))),
                ],
              )),
        )
        .toList();
  } else {
    print("no returned items");
    return listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
        .map(
          ((element) => DataRow(
                color: MaterialStateColor.resolveWith((states) => Colors.blue),
                cells: <DataCell>[],
              )),
        )
        .toList();
  }
}
