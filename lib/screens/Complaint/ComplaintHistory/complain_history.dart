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

class ComplainHistory extends StatefulWidget {
  @override
  _ComplainHistoryState createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory>{
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
      //Default TabController for tab scrollbar with number of elements equal to 4
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
          //TabBar for a horizontal scrollable tob bar
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
        //TabBarView contains all the children to be called when tapped.
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
}
