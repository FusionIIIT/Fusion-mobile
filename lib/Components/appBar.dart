import 'package:flutter/material.dart';

class DefaultAppBar {
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "FUSION",
        style: TextStyle(color: Colors.white),
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

