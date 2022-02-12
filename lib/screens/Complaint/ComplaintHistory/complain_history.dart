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

final List<Map<String, String>> complaints = [
  {
    "Acc No.": "56382",
    "Due Date": "12-01-1231",
    "Return Date": "12-01-1231",
    "Total*o*d*c": "1239",
  },
  {
    "Acc No.": "56382",
    "Due Date": "19-01-1231",
    "Return Date": "12-01-1231",
    "Total*o*d*c": "139",
  },
  {
    "Acc No.": "56999",
    "Due Date": "29-01-1218",
    "Return Date": "12-01-1231",
    "Total*o*d*c": "134",
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Complaint History",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Pending Complaints',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'OnHold Complaints',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Resolved Complaints',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Declined Complaints',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingComplaints(),
            OnHoldComplaints(),
            ResolvedComplaints(),
            DeclinedComplaints(),
          ],
        ),
      ),
    );
  }

  ListView listView() {
    return ListView(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Complaint History",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )),
            ),
            decoration: new BoxDecoration(
              color: Colors.deepOrangeAccent,
              border: new Border.all(
                color: Colors.deepOrange,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 2.0,
                )
              ],
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
            ),
          ),
        )),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            // headingRowColor:
            //     MaterialStateColor.resolveWith((states) => Colors.blue),
            dataRowHeight: 80.0,
            columnSpacing: 10.0,
            columns: [
              DataColumn(
                  label: Text('Pending Complaints',
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('On-Hold Complaints',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Resolved Complaints',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Declined Complaints',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
            ],
            rows: complaintList(),
          ),
        ),
      ],
    );
  }
}

List<DataRow> complaintList() {
  return complaints // Loops through dataColumnText, each iteration assigning the value to element
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
                    child: Text(element["Return Date"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Total*o*d*c"]!))),
              ],
            )),
      )
      .toList();
}
