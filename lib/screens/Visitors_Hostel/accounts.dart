import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/Card.dart';
import 'package:fusion/screens/Visitors_Hostel/Components/list_tile.dart';

class Accounts extends StatefulWidget {
  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<Map<String, dynamic>> bookingData = [
    {
      'Intender': 'Bob',
      'BookingFrom': '21st Jan',
      'BookingTo': '28th Jan',
      'Category': 'B',
      'Status': 'Active'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().visitorHostelAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 24.0),
                    Text(
                      "Accounts",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 12.0),
                    Text("Income",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
