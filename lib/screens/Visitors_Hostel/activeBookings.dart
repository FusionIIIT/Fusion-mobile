import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/Card.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/list_tile.dart';

class ActiveBookings extends StatefulWidget {
  @override
  _ActiveBookingsState createState() => _ActiveBookingsState();
}

class _ActiveBookingsState extends State<ActiveBookings> {
  List<Map<String, dynamic>> bookingData = [
    {
      'Intender': 'Bob',
      'BookingFrom': '21st Jan',
      'BookingTo': '28th Jan',
      'Category': 'B',
      'Status': 'Active'
    },
    {
      'Intender': 'Jane',
      'BookingFrom': '22nd Jan',
      'BookingTo': '29th Jan',
      'Category': 'A',
      'Status': 'Active'
    },
    {
      'Intender': 'Bob',
      'BookingFrom': '21st Jan',
      'BookingTo': '28th Jan',
      'Category': 'B',
      'Status': 'Active'
    },
    {
      'Intender': 'Jane',
      'BookingFrom': '22nd Jan',
      'BookingTo': '29th Jan',
      'Category': 'A',
      'Status': 'Active'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().visitorHostelAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(height: 24.0),
                  Text(
                    'Active Bookings',
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
