import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';

class DefaultAppBar {
  AppBar buildAppBar(BuildContext context) {
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
        // Make the notification icon clickable
        Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon click, e.g., navigate to the notification screen
              Navigator.pushNamed(context, '/notification_screen');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
