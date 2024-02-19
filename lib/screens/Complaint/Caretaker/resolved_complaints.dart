import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

import 'caretaker_complaints_card.dart';

class ResolvedComplaints extends StatefulWidget {
  @override
  _ResolvedComplaintsState createState() => _ResolvedComplaintsState();
}

class _ResolvedComplaintsState extends State<ResolvedComplaints> {
  bool _loading = true;
  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintDataUserStudent data;

  @override
  void initState() {
    super.initState();
    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    try {
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
          "Resolved Complaints",
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
        ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: data.student_complain!.length,
        itemBuilder: (context, index) {
          if(data.student_complain![index]['status'] == 2 || data.student_complain![index]['status'] == 3) {
            return CaretakerComplaintCard(
              data: data,
              index: index,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
