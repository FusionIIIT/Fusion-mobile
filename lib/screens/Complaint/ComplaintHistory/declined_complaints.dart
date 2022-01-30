import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';
import 'complaints_card.dart';

class DeclinedComplaints extends StatefulWidget {
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
        title: Text("Declined Complaints"),
      ),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: data.student_complain!.length,
                itemBuilder: (BuildContext context, index) {
                  return data.student_complain![index]['remarks'] == "Declined"
                      ? ComplaintCard(data: data, index: index)
                      : SizedBox(
                          width: 1,
                        );
                },
              ),
            ),
    );
  }
}
