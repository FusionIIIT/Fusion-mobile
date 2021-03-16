import 'package:fusion/Components/appBar.dart';
import 'ComplaintHistory/complain_history.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:ui';
import 'LodgeComplaint/lodge_complaint.dart';
import 'Feedback/feedback.dart';

class Complaint extends StatefulWidget {
  String? token;
  Complaint(this.token);
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar()
          .buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'KARAN TIWARI',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'student',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _loading1 = true;
                      _loading2 = false;
                      _loading3 = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lodge a Complaint',
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
                TextButton(
                  onPressed: () {
                    setState(() {
                      _loading1 = false;
                      _loading2 = true;
                      _loading3 = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Complaint History',
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
                TextButton(
                  onPressed: () {
                    setState(() {
                      _loading1 = false;

                      _loading2 = false;
                      _loading3 = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Feedback',
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
              ],
            ),
          ),
          _loading1
              ? LodgeComplaint()
              : SizedBox(
                  height: 2,
                ),
          _loading2
              ? ComplainHistory()
              : SizedBox(
                  height: 5,
                ),
          _loading3
              ? FeedBack()
              : SizedBox(
                  height: 2,
                ),
        ],
      ),
    );
  }
}
