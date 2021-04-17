import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/screens/Complaint/LodgeComplaint/dummy_page.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:intl/intl.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: ('Enter City Name'),
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

class LodgeComplaint extends StatefulWidget {
  String? token;
  LodgeComplaint(this.token);

  @override
  _LodgeComplaintState createState() => _LodgeComplaintState();
}

class _LodgeComplaintState extends State<LodgeComplaint> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DateTime? complaint_finish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(complaint_finish);
    print(formattedDate);
    String? complaint_type;
    String? location;
    String? specific_location;
    String? details;
    String? status = "0";
    String? remarks = "Declined";
    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = "2018186";
    String? worker_id = "";

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      shadowColor: Colors.black,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complaints',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Add a new Complaint',
              style: TextStyle(
                fontWeight: FontWeight.w500,
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
                print(complaint_type);
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter Password';
                } else if (value.length < 6) {
                  return 'Password must be  at least 6 characters';
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
                  return 'Please enter Password';
                } else if (value.length < 6) {
                  return 'Password must be  at least 6 characters';
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
                  return 'Please enter Password';
                } else if (value.length < 6) {
                  return 'Password must be  at least 6 characters';
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
                  return 'Please enter Password';
                } else if (value.length < 6) {
                  return 'Password must be  at least 6 characters';
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Attach Files *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  ComplaintService auth = ComplaintService();
                  bool lodge = await auth.lodgeComplaint(
                      widget.token!,
                      formattedDate,
                      complaint_type!,
                      location!,
                      specific_location!,
                      details!,
                      status!,
                      remarks!,
                      flag!,
                      reason!,
                      feedback!,
                      comment!,
                      complainer!,
                      worker_id!);
                  TextInput.finishAutofillContext();
                  if (lodge == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DummyPage()),
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
