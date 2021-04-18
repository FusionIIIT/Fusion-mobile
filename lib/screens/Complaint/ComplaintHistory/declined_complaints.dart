import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';
import 'complain_history.dart';
import 'complaints_card.dart';

class DeclinedComplaints extends StatefulWidget {
  String? token;
  DeclinedComplaints(this.token);

  @override
  _DeclinedComplaintsState createState() => _DeclinedComplaintsState();
}

class _DeclinedComplaintsState extends State<DeclinedComplaints> {
  bool _loading = true;

  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintDataUserStudent data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    Response response = await complaintService.getComplaint(widget.token!);
    setState(() {
      data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
      print(data.student_complain);
      //print(data);
      _loading = false;
    });
  }

  loadData() async {
    getData().then((res) {
      _complaintController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Declined Complaints"),
      ),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: data!.student_complain!.length,
                itemBuilder: (BuildContext context, index) {
                  return data!.student_complain![index]['remarks'] == "Declined"
                      ? ComplaintCard(token: widget.token!, data: data, index: index)
                      : SizedBox(
                          width: 1,
                        );
                },
              ),
            ),
    );
  }
}
