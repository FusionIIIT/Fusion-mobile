import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/gymkhana_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class DepartmentHomepage extends StatefulWidget {
  @override
  _DepartmentHomepageState createState() => _DepartmentHomepageState();
}

class _DepartmentHomepageState extends State<DepartmentHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Text("DepartHomePage"),
    );
  }
}
