import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:intl/intl.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

class UpdateComplaint extends StatefulWidget {
  final int? id;
  final String? remarks;
  UpdateComplaint(this.id, this.remarks);

  @override
  _UpdateComplaintState createState() => _UpdateComplaintState();
}

class _UpdateComplaintState extends State<UpdateComplaint> {
  @override
  Widget build(BuildContext context) {
    DateTime? complaint_finish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String? finishedDate = formatter.format(complaint_finish);
    String complaint_date = DateTime.now().toString();
    print(finishedDate);
    String? complaint_type;
    String? location;
    String? specific_location;
    String? details;
    String? status = "0";

    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = "2018186";

    return Scaffold(
      appBar: AppBar(title: Text('Update Complaint')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Complaints',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Add a new Complaint',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Complaint Type *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              onChanged: (input) {
                complaint_type = input;
                //print(complaint_type);
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter complaint_type';
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Location *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            TextFormField(
              autofocus: false,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              onChanged: (input) {
                location = input;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter location';
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Specific Location *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              onChanged: (input) {
                specific_location = input;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter specific_location';
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Complaint Details *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              onChanged: (input) {
                details = input;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter details';
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  ComplaintService auth = ComplaintService();
                  bool lodge = await auth.updateComplaint(
                    widget.id!,
                    complaint_date,
                    finishedDate,
                    complaint_type!,
                    location!,
                    specific_location!,
                    details!,
                    status,
                    widget.remarks!,
                    flag,
                    reason,
                    feedback,
                    comment,
                    complainer,
                  );
                  TextInput.finishAutofillContext();
                  if (lodge == true) {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Success"),
                        content: Text("Complaint Updated Successfully"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              int count = 0;
                              Navigator.of(context)
                                  .popUntil((_) => count++ >= 3);
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Failed"),
                        content: Text("Cannot Update Complaint"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.deepOrange;
                      return Colors
                          .deepOrangeAccent; // Use the component's default.
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
