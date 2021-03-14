

import 'package:flutter/material.dart';

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
  @override
  _LodgeComplaintState createState() => _LodgeComplaintState();
}

class _LodgeComplaintState extends State<LodgeComplaint> {
  @override
  Widget build(BuildContext context) {
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
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
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
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
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
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
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
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
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
