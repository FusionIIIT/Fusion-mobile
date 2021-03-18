import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Bonafide extends StatefulWidget {
  @override
  _BonafideState createState() => _BonafideState();
}

class _BonafideState extends State<Bonafide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body:Container(),
    );
  }
}
