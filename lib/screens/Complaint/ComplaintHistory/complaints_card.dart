import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/get_complaint_by_id.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/update_complaint.dart';
import 'package:fusion/services/complaint_service.dart';
import '../../../models/complaints.dart';

class ComplaintCard extends StatefulWidget {
  final ComplaintDataUserStudent? data;
  final int? index;
  final int? status;
  ComplaintCard({
    this.data,
    this.index,
    this.status,
  });

  @override
  _ComplaintCardState createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  final TextEditingController _feedbackController = TextEditingController();
  bool _showFeedbackSection = false;
  @override
  Widget build(BuildContext context) {
    int flag = 0;
    return GestureDetector(
      onTap: () {
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
              Text(
                "Feedback :  ${widget.data!.student_complain![widget.index!]['feedback']}",
                style: TextStyle(fontSize: 17, letterSpacing: 1.5),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        String complaintType = widget.data!
                            .student_complain![widget.index!]['complaint_type'];
                        String location = widget
                            .data!.student_complain![widget.index!]['location'];
                        String complainerRollNo = widget.data!
                            .student_complain![widget.index!]['complainer'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateComplaint(
                                widget.data!
                                    .student_complain![widget.index!]['id'],
                                widget.data!
                                    .student_complain![widget.index!]
                                ['remarks'],
                                complaintType,
                                location,
                                complainerRollNo,
                              )),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.update),
                          Text("Update"),
                        ],
                      )),
                  if (widget.status != 2)
                    ElevatedButton(
                      onPressed: () async {
                        return showDialog(
                          context: context,
                          builder: (ctx) =>
                              AlertDialog(
                                title: Text("Warning"),
                                content: Text(
                                    "Are you sure you want to delete complaint?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      ComplaintService auth = ComplaintService();

                                      if (widget.index != null &&
                                          widget.data?.student_complain?[
                                          widget.index!]['id'] !=
                                              null) {
                                        bool deleteComp =
                                        await auth.deleteComplaint(
                                            widget.data?.student_complain?[
                                            widget.index!]['id']);
                                        TextInput.finishAutofillContext();
                                        if (deleteComp == true) {
                                          int count = 0;
                                          Navigator.of(context)
                                              .popUntil((_) => count++ >= 2);
                                        }
                                      }
                                    },
                                    child: Text("Ok"),
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
                          Text("  Delete"),
                        ],
                      ),
                    ),
                  if (widget.status == 2)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showFeedbackSection = !_showFeedbackSection;
                          });
                        },
                        child: Text(
                            _showFeedbackSection ? 'Cancel' : 'Give Feedback'),
                      ),
                    ),
                ],
              ),
              if (_showFeedbackSection)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _feedbackController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Enter your feedback',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        String feedback = _feedbackController.text.trim();
                        if (feedback.isNotEmpty) {
                          print('Feedback: $feedback');
                          ComplaintService auth = ComplaintService();
                          Map<String, dynamic> data =
                          widget.data!.student_complain![widget.index!];
                          bool updatefeedback = await auth.updateComplaint(
                              data['id'],
                              data['complaint_date'],
                              data['complaint_finish'],
                              data['complaint_type'],
                              data['location'],
                              data['specific_location'],
                              data['details'],
                              data['status'].toString(),
                              data['remarks'],
                              data['flag'].toString(),
                              data['reason'],
                              feedback,
                              data['comment'],
                              data['complainer'],
                          );
                          _feedbackController.clear();
                          setState(() {
                            _showFeedbackSection = false;
                          });
                          data['feedback'] = feedback;
                        }
                      },
                      child: Text('Submit Feedback'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
