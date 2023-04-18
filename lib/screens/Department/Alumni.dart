import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart';

class Alumni extends StatefulWidget {
  @override
  _AlumniState createState() => _AlumniState();
}

class _AlumniState extends State<Alumni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Text(
        "Welcome to Alumni",
        style: TextStyle(
          fontSize: 35,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
