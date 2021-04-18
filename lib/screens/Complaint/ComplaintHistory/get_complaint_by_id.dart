import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetComplaintByID extends StatefulWidget {
  Map<String, dynamic> data;
  GetComplaintByID(this.data);

  @override
  _GetComplaintByIDState createState() => _GetComplaintByIDState();
}

class _GetComplaintByIDState extends State<GetComplaintByID> {
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complaint Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Complaint ID : ${widget.data['id'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Complaint Date : ${widget.data['complaint_date'].substring(0, 10)}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Complaint Finish : ${widget.data['complaint_finish'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Location : ${widget.data['location']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Specific Location : ${widget.data['specific_location']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Details : ${widget.data['details']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Status : ${widget.data['status']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Remarks : ${widget.data['remarks']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Flag : ${widget.data['flag']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Reason : ${widget.data['reason']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Feedback : ${widget.data['feedback']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Upload Complaint : ${widget.data['']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Comment : ${widget.data['comment'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Complainer : ${widget.data['complainer'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            height: 80,
            color: Colors.grey,
            child: Text(
              "Worker ID : ${widget.data['worker_id'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
