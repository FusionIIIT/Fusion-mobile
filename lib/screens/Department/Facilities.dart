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
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:my_app/html_view.dart';

class Facilities extends StatefulWidget {
  @override
  _FacilitiesState createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: HtmlWidget("<h6>hello world</h6>"));
  }
}
