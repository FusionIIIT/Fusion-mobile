import 'package:flutter/material.dart';
import '../Constants/constants.dart';

class ComplainHistory extends StatefulWidget {
  @override
  _ComplainHistoryState createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shadowColor: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    _loading1 = true;
                    _loading2 = false;
                    _loading3 = false;
                    _loading4 = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pending Complaints',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: _loading1 ? Colors.black : Colors.black26,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _loading1 = false;
                    _loading2 = true;
                    _loading3 = false;
                    _loading4 = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On-Hold Complaints',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: _loading2 ? Colors.black : Colors.black26,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _loading1 = false;
                    _loading2 = false;
                    _loading3 = true;
                    _loading4 = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Resolved Complaints',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: _loading3 ? Colors.black : Colors.black26,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _loading1 = false;
                    _loading2 = false;
                    _loading3 = false;
                    _loading4 = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Declined Complaints',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: _loading4 ? Colors.black : Colors.black26,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feedback For Complaints',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Date',
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
                  'Complaint Type',
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
                  'Location',
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
                  'Status',
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
                  'Workers Name',
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
                  'FeedBack',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 6,
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
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
