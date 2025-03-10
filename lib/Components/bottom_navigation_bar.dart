import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  bool _notificationsBool = false;
  bool _announcementsBool = false;
  bool _newsBool = false;
  bool _homeBool = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Card(
          color: Colors.deepOrangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 13.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _notificationsBool = false;
                    _announcementsBool = false;
                    _newsBool = false;
                    _homeBool = true;
                    setState(() {
                      _notificationsBool = false;
                      _announcementsBool = false;
                      _newsBool = false;
                      _homeBool = true;
                    });
                    Navigator.pushReplacementNamed(context, "/dashboard");

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                        size: _homeBool ? 30.0 : 25.0,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _newsBool = true;
                    _announcementsBool = false;
                    _notificationsBool = false;
                    _homeBool = false;

                    setState(() {
                      _newsBool = true;
                      _announcementsBool = false;
                      _notificationsBool = false;
                      _homeBool = false;
                    });
                    Navigator.pushReplacementNamed(context, "/news");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.newspaper_rounded,
                        color: Colors.white,
                        size: _newsBool ? 30.0 : 25.0,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _announcementsBool = false;
                    _newsBool = false;
                    _notificationsBool = true;
                    _homeBool = false;

                    setState(() {
                      _announcementsBool = false;
                      _newsBool = false;
                      _notificationsBool = true;
                      _homeBool = false;
                    });
                    Navigator.pushReplacementNamed(context, "/notification");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.notifications_active_rounded,
                          color: Colors.white,
                          size: _notificationsBool ? 30.0 : 25.0,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _announcementsBool = true;
                    _newsBool = false;
                    _notificationsBool = false;
                    _homeBool = false;

                    setState(() {
                      _announcementsBool = true;
                      _newsBool = false;
                      _notificationsBool = false;
                      _homeBool = false;
                    });
                    Navigator.pushReplacementNamed(context, "/announcement");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.campaign_rounded,
                          color: Colors.white,
                          size: _announcementsBool ? 30.0 : 25.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}