import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/Card.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/list_tile.dart';

class CompletedBookings extends StatefulWidget {
  @override
  _CompletedBookingsState createState() => _CompletedBookingsState();
}

class _CompletedBookingsState extends State<CompletedBookings> {
  List<Map<String, dynamic>> bookingData = [
    {
      'Intender': 'Bob',
      'BookingFrom': '21st Jan',
      'BookingTo': '28th Jan',
      'Category': 'B',
      'Status': 'Completed'
    },
    {
      'Intender': 'Jane',
      'BookingFrom': '22nd Jan',
      'BookingTo': '29th Jan',
      'Category': 'A',
      'Status': 'InComplete'
    },
    {
      'Intender': 'Bob',
      'BookingFrom': '21st Jan',
      'BookingTo': '28th Jan',
      'Category': 'B',
      'Status': 'Completed'
    },
    {
      'Intender': 'Jane',
      'BookingFrom': '22nd Jan',
      'BookingTo': '29th Jan',
      'Category': 'A',
      'Status': 'InComplete'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().visitorHostelAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(height: 24.0),
                  Text(
                    'Completed Bookings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: List.generate(bookingData.length, (index) {
                      return Column(
                        children: [
                          SizedBox(height: 20.0),
                          BookingInfoCard(
                            bookingInfoTiles: [
                              CardListTile(
                                iconData: Icons.person,
                                label: 'Intender',
                                value: bookingData[index]['Intender'],
                                color: Colors.white,
                              ),
                              CardListTile(
                                iconData: Icons.today,
                                label: "BookingFrom",
                                value: bookingData[index]['BookingFrom'],
                                color: Color.fromARGB(255, 206, 205, 205),
                              ),
                              CardListTile(
                                iconData: Icons.event,
                                label: "BookingTo",
                                value: bookingData[index]['BookingTo'],
                                color: Colors.white,
                              ),
                              CardListTile(
                                iconData: Icons.category,
                                label: "Category",
                                value: bookingData[index]['Category'],
                                color: Color.fromARGB(255, 206, 205, 205),
                              ),
                              CardListTile(
                                iconData: Icons.info,
                                label: "Status",
                                value: bookingData[index]['Status'],
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
