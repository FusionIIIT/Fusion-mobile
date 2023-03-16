import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';

class DefaultAppBar {
  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: kPrimaryColor,
      title: Text(
        "Dashboard",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }

  AppBar visitorHostelAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "Visitor Hostel",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color.fromARGB(255, 243, 33, 33),
      // ignore: prefer_const_literals_to_create_immutables
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
      elevation: 0,
    );
  }
}
