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

class _ComplainHistoryState extends State<ComplainHistory> {
  bool _loading1 = true;

  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

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

    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3 && _currentPage > 0) {
        if (step % 2 == 0)
          _currentPage++;
        else
          _currentPage--;
      } else if (_currentPage == 3) {
        _currentPage--;
        step++;
      } else {
        _currentPage++;
        if (step != 0) step++;
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
    try{
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        print(data.student_complain);
        //print(data);
        _loading1 = false;
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
    return Column(
      children: [
        _loading1 == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 200,
                child: PageView(
                  // scrollDirection: Axis.horizontal,

                  controller: _pageController,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendingComplaints()),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnHoldComplaints()),
                        );
                      },
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResolvedComplaints()),
                        );
                      },
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeclinedComplaints()),
                        );
                      },
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
              ),
      ],
    );
  }
}
