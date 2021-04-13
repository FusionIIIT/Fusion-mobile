import 'package:flutter/material.dart';
import '../../../models/complaints.dart';

class ComplaintCard extends StatelessWidget {
  ComplaintDataUserStudent? data;
  int? index = 0;
  ComplaintCard({
    this.data,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              "Complaint ID : ${data!.student_complain![index!]['id']!.toString()}",
              style: TextStyle(fontSize: 17, letterSpacing: 1.5),
            ),
            Text(
              "Complainer :  ${data!.student_complain![index!]['complainer']}",
              style: TextStyle(fontSize: 17, letterSpacing: 1.5),
            ),
            Text(
              "Complaint Type : ${data!.student_complain![index!]['complaint_type']}",
              style: TextStyle(fontSize: 17, letterSpacing: 1.5),
            ),
            Text(
              "Complaint Details :  ${data!.student_complain![index!]['details']}",
              style: TextStyle(fontSize: 17, letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
