import 'package:flutter/material.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/get_complaint_by_id.dart';
import '../../../models/complaints.dart';

class ComplaintCard extends StatefulWidget {
  ComplaintDataUserStudent? data;
  int? index = 0;
  ComplaintCard({
    this.data,
    this.index,
  });

  @override
  _ComplaintCardState createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Hello");
        print(widget.data!.student_complain![widget.index!]['id']);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GetComplaintByID(
                  widget.data!.student_complain![widget.index!])),
        );
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Complaint ID : ${widget.data!.student_complain![widget.index!]['id']!.toString()}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              Text(
                "Complainer :  ${widget.data!.student_complain![widget.index!]['complainer']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              Text(
                "Complaint Type : ${widget.data!.student_complain![widget.index!]['complaint_type']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              Text(
                "Complaint Details :  ${widget.data!.student_complain![widget.index!]['details']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
