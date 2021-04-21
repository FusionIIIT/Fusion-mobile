import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
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
  ProfileData? data;

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;
  }

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
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  data!.user!['first_name'] + ' ' + data!.user!['last_name'],
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  data!.profile!['user_type'],
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Card(
            elevation: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            shadowColor: Colors.black,
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
                        'CPDA Management',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: _first ? Colors.black : Colors.black26,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: _first ? Colors.deepOrangeAccent : Colors.white,
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
                        'LTC Management',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: _second ? Colors.black : Colors.black26,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: _second ? Colors.deepOrangeAccent : Colors.white,
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
              : SizedBox(
                  height: 2,
                ),
          _second
              ? LtcManagement()
              : SizedBox(
                  height: 2,
                )
        ],
      ),
    );
  }
}
