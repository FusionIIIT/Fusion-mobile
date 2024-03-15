import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/get_complaint_by_id.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/update_complaint.dart';
import 'package:fusion/services/complaint_service.dart';
import '../../../models/complaints.dart';

class CaretakerComplaintCard extends StatefulWidget {
  final ComplaintDataUserStudent? data;
  final int? index;
  CaretakerComplaintCard({
    this.data,
    this.index,
  });

  @override
  _CaretakerComplaintCardState createState() => _CaretakerComplaintCardState();
}

class _CaretakerComplaintCardState extends State<CaretakerComplaintCard> {
  @override
  Widget build(BuildContext context) {
    int flag = 0;
    bool isNotResolved =
        widget.data!.student_complain![widget.index!]['status'] == 0;
    return GestureDetector(
      onTap: () {
        //print("Hello");
        //print(widget.data!.student_complain![widget.index!]['complaint_type']);

        //print(complaintType);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GetComplaintByID(
                  widget.data!.student_complain![widget.index!])),
        );
      },
      child: Card(
        elevation: 5,
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
                "Complaint Location :  ${widget.data!.student_complain![widget.index!]['location']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              Text(
                "Specific Location :  ${widget.data!.student_complain![widget.index!]['specific_location']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              Text(
                "Details :  ${widget.data!.student_complain![widget.index!]['details']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              SizedBox(height: 5),
              Visibility(
                visible: isNotResolved,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Warning"),
                            content:
                                Text("Are you sure the complaint is resolved?"),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // Mark complaint as resolved
                                  // ...
                                },
                                child: Text("Resolve"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 25,
                          ),
                          Text("  Mark as resolved"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Warning"),
                            content: Text(
                                "Are you sure you want to decline the complaint?"),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // Delete complaint
                                  // ...
                                },
                                child: Text("Decline"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 25,
                          ),
                          Text("  Decline"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
