import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

import 'complaints_card.dart';

class PendingComplaints extends StatefulWidget {
  @override
  _PendingComplaintsState createState() => _PendingComplaintsState();
}

class _PendingComplaintsState extends State<PendingComplaints> {
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
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: data.student_complain!.length,
        itemBuilder: (context, index) {
          if(data.student_complain![index]['status'] == 0) {
            return ComplaintCard(
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
