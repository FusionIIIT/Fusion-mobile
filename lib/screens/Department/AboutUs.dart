import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: ListView(children: [
          Row(
            children: [
              Text(
                "  Welcome to CSE Department",
                style: TextStyle(
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Row(
            children: [],
          ),
          Row()
        ]));
  }
}
