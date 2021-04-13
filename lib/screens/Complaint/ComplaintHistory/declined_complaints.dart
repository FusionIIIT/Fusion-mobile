import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'complain_history.dart';
import 'complaints_card.dart';

class DeclinedComplaints extends StatelessWidget {
  ComplaintDataUserStudent? data;
  DeclinedComplaints(this.data);

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Declined Complaints"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: data!.student_complain!.length,
          itemBuilder: (BuildContext context, index) {
            return data!.student_complain![index]['remarks'] == "Declined"
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
