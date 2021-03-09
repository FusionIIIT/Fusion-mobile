import 'package:flutter/material.dart';
import 'side_drawer.dart';
import 'dart:ui';

class LibraryHomeScreen extends StatefulWidget {
  @override
  _LibraryHomeScreenState createState() => _LibraryHomeScreenState();
}

class _LibraryHomeScreenState extends State<LibraryHomeScreen> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'FUSION',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 350,
                  height: 170,
                  decoration: BoxDecoration(),
                ),
                SizedBox(height: 10),
                Text(
                  'Samarth Soni',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'STUDENT | CSE',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            color: Colors.red[200],
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'DUES',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '24.00 Rs',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/library_homepage/book_search');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Book Search',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
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
                      Navigator.pushNamed(context, '/library_homepage/issued_items');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Issue Items',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, '/library_homepage/dues');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dues ',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
