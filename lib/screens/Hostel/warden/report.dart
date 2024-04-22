import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
class Report  extends StatelessWidget {
const Report ({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:SideDrawer(),
      appBar: AppBar(
        title: const Text('Report'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
    );
  }
}

