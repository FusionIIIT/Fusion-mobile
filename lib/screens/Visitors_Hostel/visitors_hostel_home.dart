import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/RulesAndRegulation.dart';
import 'package:fusion/screens/Visitors_Hostel/activeBookings.dart';
import 'package:fusion/screens/Visitors_Hostel/cancelRequest.dart';
import 'package:fusion/screens/Visitors_Hostel/completedBookings.dart';
import 'package:fusion/screens/Visitors_Hostel/place_request.dart';
import 'package:fusion/screens/Visitors_Hostel/viewBookings.dart';

class VisitorHostel extends StatefulWidget {
  @override
  _VisitorHostelState createState() => _VisitorHostelState();
}

class _VisitorHostelState extends State<VisitorHostel> {
  bool _isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DefaultAppBar().visitorHostelAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      height: 60.0,
                      onPressed: () {
                        setState(() {
                          _isDropdownVisible = !_isDropdownVisible;
                        });
                      },
                      color: Colors.white,
                      textColor: Color.fromARGB(255, 59, 59, 59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Manage Bookings',
                              style: TextStyle(fontSize: 18.0)),
                          Icon(
                              _isDropdownVisible
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _isDropdownVisible
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 9.0),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewBookings()),
                                      );
                                    },
                                    child: Text("View Bookings"),
                                  ),
                                  SizedBox(height: 9.0),
                                  Divider(
                                    thickness: 1.0,
                                  ),
                                  SizedBox(height: 9.0),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CancelledBookings()),
                                      );
                                    },
                                    child: Text("Cancellation Requests"),
                                  ),
                                  SizedBox(height: 9.0),
                                  Divider(
                                    thickness: 1.0,
                                  ),
                                  SizedBox(height: 9.0),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActiveBookings()),
                                      );
                                    },
                                    child: Text("Active Bookings"),
                                  ),
                                  SizedBox(height: 9.0),
                                  Divider(
                                    thickness: 1.0,
                                  ),
                                  SizedBox(height: 9.0),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompletedBookings()),
                                      );
                                    },
                                    child: Text("Completed Bookings"),
                                  ),
                                  SizedBox(height: 9.0),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                        height: 60.0,
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Text('Booking Form',
                            style: TextStyle(fontSize: 18.0))),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                        height: 60.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPdfViewer()),
                          );
                        },
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Text('Rules and Regulations',
                            style: TextStyle(fontSize: 18.0))),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: MaterialButton(
                        height: 60.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlaceRequest()),
                          );
                        },
                        color: Color.fromARGB(255, 243, 33, 33),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Text('Place Request',
                            style: TextStyle(fontSize: 18.0))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
