import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

import 'caretaker_complaints_card.dart';

class ViewCaretaker extends StatefulWidget {
  @override
  _ViewCaretaker createState() => _ViewCaretaker();
}

class _ViewCaretaker extends State<ViewCaretaker> {
  bool _loading = true;
  late ComplaintService complaintService;
  late CaretakerData data;

  @override
  void initState() {
    super.initState();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    try {
      Response response = await complaintService.getCaretaker();
      setState(() {
        data = CaretakerData.fromJson(jsonDecode(response.body));
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // backgroundColor: Colors.red[100],
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  _loading ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange[100],
                      ),
                    ),
                  ) : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: ListView.builder(
                        itemCount: data.caretakers?.length,
                        itemBuilder: (BuildContext context, int index) {
                          if(data.caretakers?[index]["area"] != "cc2") {
                            // return const SizedBox();
                          }
                          return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Column(
                                children: [
                                  Container(
                                      width: 400,
                                      color: Colors.orange[500],
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${index+1}.",
                                                        style: TextStyle(color: Colors.white),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                      Text(
                                                        "Rating: ${data.caretakers?[index]["rating"]}",                                              style: TextStyle(color: Colors.white),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  )
                                              ),
                                              Center(
                                                  child: Text(
                                                    "${data.caretakers?[index]["area"]}",
                                                    style: TextStyle(color: Colors.white),
                                                  )
                                              ),
                                              Center(
                                                  child: Text(
                                                    "${data.caretakers?[index]["myfeedback"]}",
                                                    style: TextStyle(color: Colors.white),
                                                  )
                                              )

                                            ],
                                          )
                                      )
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 10,
                                  ),
                                ],
                              )
                          );
                        },
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}