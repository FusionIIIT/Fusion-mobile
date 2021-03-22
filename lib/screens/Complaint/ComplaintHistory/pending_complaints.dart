import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'complain_history.dart';

class PendingComplaints extends StatelessWidget {
  ComplaintData? data;
  PendingComplaints(this.data);

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shadowColor: Colors.black,
              child: Center(
                child: Text(
                  'Pending Complaints',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            Card(
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
                      "Complaint ID : ${data!.complainer!['id']!.toString()}",
                      style: TextStyle(fontSize: 17, letterSpacing: 1.5),
                    ),
                    Text(
                      "Complainer Roll No :  ${data!.complainer!['complainer']}",
                      style: TextStyle(fontSize: 17, letterSpacing: 1.5),
                    ),
                    Text(
                      "Complainer Name :  ${data!.complainer!['first_name']}",
                      style: TextStyle(fontSize: 17, letterSpacing: 1.5),
                    ),
                    Text(
                      "Complaint Type : ${data!.complaint_details!['complaint_type']}",
                      style: TextStyle(fontSize: 17, letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
