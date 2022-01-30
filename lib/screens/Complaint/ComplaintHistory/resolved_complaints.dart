import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';
import 'complaints_card.dart';

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
    // TODO: implement initState
    super.initState();
    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try{
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        print(data.student_complain);
        //print(data);
        _loading = false;
      });
    }catch(e){
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Resolved Complaints"),
      ),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: data.student_complain!.length,
                itemBuilder: (BuildContext context, index) {
                  return data.student_complain![index]['remarks'] == "Resolved"
                      ? ComplaintCard(data: data, index: index)
                      : SizedBox(
                          width: 10,
                        );
                },
              ),
            ),
    );
  }
}
