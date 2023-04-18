import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:fusion/screens/Hostelmanagement/hostelmanagement.dart';



class Book_Guest extends StatelessWidget {
  //const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Guest Room Booking"),
        actions: const <Widget>[
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 350,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 58, 58, 58),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(61, 9, 9, 9),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 6,
                child: Text(
                  "Hall",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 29,
                child: Container(
                  width: 302,
                  height: 34,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 200,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Select hall no",
                        style: TextStyle(
                          color: Color(0xffd9d9d9),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 71,
                child: Text(
                  "Arrival date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 90,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 43,
                    top: 5,
                    bottom: 9,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "dd-mm-yy",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 70,
                child: Text(
                  "Departure date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 190,
                top: 87,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 11,
                    right: 38,
                    top: 5,
                    bottom: 9,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "dd-mm-yy",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 128,
                child: Text(
                  "Arrival time",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 196,
                top: 128,
                child: Text(
                  "Departure time",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 147,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 192,
                top: 147,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 184,
                child: Text(
                  "No of guests ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 197,
                top: 184,
                child: Text(
                  "Nationality",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 202,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 203,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 245,
                child: Text(
                  "Number of rooms",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 197,
                top: 245,
                child: Text(
                  "Name of guest",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 264,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 263,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 304,
                child: Text(
                  "Guest email ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 192,
                top: 304,
                child: Text(
                  "Guest phone number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 321,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 322,
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 360,
                child: Text(
                  "Guest Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 383,
                child: Container(
                  width: 297,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 419,
                child: Text(
                  "purpose",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 441,
                child: Container(
                  width: 284,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd9d9d9),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 507,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xfff36c35),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 99,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.5,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
