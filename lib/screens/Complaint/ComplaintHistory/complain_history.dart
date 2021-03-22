import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/pending_complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';
import '../Constants/constants.dart';

class ComplainHistory extends StatefulWidget {
  String? token;
  ComplainHistory(this.token);

  @override
  _ComplainHistoryState createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading4 = false;

  bool _loading = true;

  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  //integrating_api
  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintData data;

  @override
  void initState() {
    super.initState();

    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  getData() async {
    //print('token-'+widget.token!);
    Response response = await complaintService.getComplaint(widget.token!);
    setState(() {
      data = ComplaintData.fromJson(jsonDecode(response.body));
      print(data.complaint_details);
      print(data);
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
    return Column(
      children: [
        _loading1 == true
            ? SizedBox(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendingComplaints(data)),
                        );
                      },
                      child: Card(
                        elevation: 6,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shadowColor: Colors.black,
                        child: Center(
                          child: Text(
                            'Pending Complaints',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 6,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shadowColor: Colors.black,
                        child: Center(
                          child: Text(
                            'On-Hold Complaints',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 6,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shadowColor: Colors.black,
                        child: Center(
                          child: Text(
                            'Resolved Complaints',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 6,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shadowColor: Colors.black,
                        child: Center(
                          child: Text(
                            'Declined Complaints',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(width: 20),
      ],
    );
  }
}
