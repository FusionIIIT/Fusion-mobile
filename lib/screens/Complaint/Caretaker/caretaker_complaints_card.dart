import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/get_complaint_by_id.dart';
import 'package:fusion/screens/Complaint/ComplaintHistory/update_complaint.dart';
import 'package:fusion/services/complaint_service.dart';
import '../../../models/complaints.dart';

class CaretakerComplaintCard extends StatefulWidget {
  final ComplaintDataUserStudent? data;
  final int? index;
  final List<Supervisor>? supervisorList;
  CaretakerComplaintCard({
    this.data,
    this.index,
    this.supervisorList,
  });

  @override
  _CaretakerComplaintCardState createState() => _CaretakerComplaintCardState();
}

class _CaretakerComplaintCardState extends State<CaretakerComplaintCard> {
  bool _isResolved = false;
  @override
  Widget build(BuildContext context) {
    int flag = 0;
    bool isNotResolved =
        widget.data!.student_complain![widget.index!]['status'] == 0;
    bool isForwarded =
        widget.data!.student_complain![widget.index!]['forwarded_to'] != null;
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
              SizedBox(height: 5),
              Visibility(
                visible: isNotResolved,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _isResolved ?
                        null : () async {
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
                                  ComplaintService client = ComplaintService();
                                  Map<String, dynamic> data = widget.data!.student_complain![widget.index!];
                                  try {
                                    String? status = '2';
                                    client.updateComplaint(
                                        data['id']!,
                                        data['complaint_data'],
                                        data['complaint_finish'],
                                        data['complaint_type'],
                                        data['location'],
                                        data['specific_location'],
                                        data['details'],
                                        status,
                                        data['remarks'],
                                        data['flag'].toString(),
                                        data['reason'],
                                        data['feedback'],
                                        data['comment'],
                                        data['complainer']
                                    );
                                    Navigator.of(context).pop();
                                    setState(() {
                                      _isResolved = true;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Complaint resolved successfully'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } catch(error) {
                                    print(error);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Failed to resolve complaint. Please try again.'),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
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
                          Text(!_isResolved ? "  Mark as resolved" : " Resolved"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Supervisor? selectedValue;
                        await showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Forward Complaint"),
                            content: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("Select forward destination:"),
                                    DropdownButton<Supervisor>(
                                      hint: Text('Select whom to forward'),
                                      value: selectedValue,
                                      onChanged: (Supervisor? value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                      items: widget.supervisorList!.map<DropdownMenuItem<Supervisor>>((Supervisor value) {
                                        return DropdownMenuItem<Supervisor>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (selectedValue != null) {
                                    ComplaintService client = ComplaintService();
                                    try {
                                      client.forwardComplaint(
                                          selectedValue!.id.toString(),
                                          widget.data!.student_complain![widget.index!]['id'].toString()
                                      );
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Complaint forwarded successfully'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } catch(error) {
                                      print('Error forwarding complaint: $error');
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Error'),
                                          content: Text('Failed to forward complaint. Please try again.'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please select a destination"),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Forward"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.forward,
                            size: 25,
                          ),
                          Text("  Forward"),
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
