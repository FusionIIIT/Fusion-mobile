import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:fusion/screens/HostelManagement/hostelmanagement.dart';

class your_book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title:
            const Text('Your Booking', style: TextStyle(color: Colors.white)),
        actions: const <Widget>[
          Icon(Icons.notifications, color: Colors.white),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 179, 176, 176),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            // const Divider(
            //   height: 20,
            //   thickness: 2,
            //   indent: 20,
            //   endIndent: 0,
            //   color: Colors.black,
            // ),

            padding: const EdgeInsets.only(
              left: 8,
              right: 7,
              top: 7,
              bottom: 81,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 82,
                        top: 10,
                        child: Text(
                          "Room for 3 in aryabhatta",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 41,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 350,
                            height: 205,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffd9d9d9),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              left: 1,
                              right: 10,
                              top: 13,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Requested for       contact       Arrival / Departure",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Pankaj         9404578921          March 28",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 278,
                                  height: 1,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 250,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffd9d9d9),
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 9,
                                    right: 300,
                                    top: 6,
                                    bottom: 7,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Reason",
                                        style: TextStyle(
                                          color: Color(0xffd9d9d9),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Transform.rotate(
                                  angle: 1.58,
                                  child: Container(
                                    width: 71.01,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Transform.rotate(
                                  angle: 1.57,
                                  child: Container(
                                    width: 71,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 78,
                        child: Container(
                          width: 305,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
