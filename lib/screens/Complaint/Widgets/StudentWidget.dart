import 'package:flutter/material.dart';
import 'package:fusion/models/profile.dart';

class StudentWidget extends StatefulWidget {
  final Function(bool) setLoading;
  final Function(String) navigateToComplaint;
  final ProfileData data;

  const StudentWidget({
    required this.setLoading,
    required this.navigateToComplaint,
    required this.data,
  });

  @override
  _StudentWidgetState createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin:
      EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                Navigator.pushNamed(
                    context, '/complaint/lodge_complaint',
                    arguments: widget.data.user != null
                        ? widget.data.user!['username']
                        : "null");
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lodge Complaint",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: _loading1
                        ? Colors.black
                        : Colors.black26,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: _loading1
                      ? Colors.deepOrangeAccent
                      : Colors.white,
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
                Navigator.pushNamed(
                  context,
                  '/complaint/complaint_history',
                );
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
                    color: _loading2
                        ? Colors.black
                        : Colors.black26,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: _loading2
                      ? Colors.deepOrangeAccent
                      : Colors.white,
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
                Navigator.pushNamed(
                  context,
                  '/complaint/feedback',
                );
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
                    color: _loading3
                        ? Colors.black
                        : Colors.black26,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: _loading3
                      ? Colors.deepOrangeAccent
                      : Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}