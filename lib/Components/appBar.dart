import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';

class DefaultAppBar {
  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: kPrimaryColor,
      title: Text(
        "Dashboard",
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
}

