import 'package:flutter/material.dart';
import 'package:fusion/models/profile.dart';

class CaretakerWidget extends StatefulWidget {
  final Function(bool) setLoading;
  final Function(String) navigateToComplaint;
  final ProfileData data;

  const CaretakerWidget({
    required this.setLoading,
    required this.navigateToComplaint,
    required this.data,
  });

  @override
  _CaretakerWidgetState createState() => _CaretakerWidgetState();
}

class _CaretakerWidgetState extends State<CaretakerWidget> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Widget for caretaker
      elevation: 2.0,
      margin:
      EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextButton(
          //   onPressed: () {
          //     setState(() {
          //       _loading1 = true;
          //       _loading2 = false;
          //       _loading3 = false;
          //       Navigator.pushNamed(
          //           context, '/complaint/lodge_complaint',
          //           arguments: data.user != null
          //               ? data.user!['username']
          //               : "null");
          //     });
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Lodge Complaint",
          //         style: TextStyle(
          //           fontWeight: FontWeight.w800,
          //           fontSize: 18,
          //           color: _loading1
          //               ? Colors.black
          //               : Colors.black26,
          //         ),
          //       ),
          //       Icon(
          //         Icons.arrow_forward,
          //         color: _loading1
          //             ? Colors.deepOrangeAccent
          //             : Colors.white,
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              setState(() {
                _loading1 = false;
                _loading2 = true;
                _loading3 = false;
                Navigator.pushNamed(
                  context,
                  '/complaint/caretaker/resolved_complaints',
                );
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
                _loading1 = true;
                _loading2 = true;
                _loading3 = true;
                Navigator.pushNamed(
                  context,
                  '/complaint/caretaker/unresolved_complaints',
                );
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unresolved Complaint',
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
        ],
      ),
    );
  }
}
