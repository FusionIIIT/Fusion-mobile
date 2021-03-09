import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'DashboardComponents/cardItems.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar()
          .buildAppBar(), // This is default app bar used in all modules
      drawer: SideDrawer(), // This is sideDrawer used in all modules
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
                  'Piyush Agrawal',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CSE Student',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _loading = true;
                    setState(() {
                      _loading = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.notifications_active_rounded,
                          color:
                              _loading ? Colors.deepOrangeAccent : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _loading = false;
                    setState(() {
                      _loading = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'News',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.email,
                          color:
                              _loading ? Colors.white : Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _loading ? NotificationCard() : NewsCard(),
        ],
      ),
    );
  }
}
