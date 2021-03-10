import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'cpda_management.dart';
import 'ltc_management.dart';
import 'package:fusion/Components/appBar.dart';


class Establishment extends StatefulWidget {
  @override
  _EstablishmentState createState() => _EstablishmentState();
}

class _EstablishmentState extends State<Establishment> {
  bool _first = true;
  bool _second = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width:170,
                  height:170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/2018238_lat.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'SHUBHAM RAJ',
                  style: TextStyle(color: Colors.black, fontSize: 16
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  ' CSE   Student',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Card(
            elevation: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               TextButton(
                  onPressed: () {
                    setState(() {
                      _first = true;
                      _second = false;

                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CPDA  Management',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: _first ? Colors.black : Colors.deepOrange,
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
                      _first = false;
                      _second = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'LTC  Management',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: _second ? Colors.black : Colors.deepOrange,
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
          _first
               ? CpdaManagement()
              :SizedBox(
            height: 2,
          ),
          _second
               ?LtcManagement()
              :SizedBox(
            height: 2,
          )
      ],
      ),
    );
  }
}




