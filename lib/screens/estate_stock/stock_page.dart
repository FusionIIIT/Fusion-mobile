import 'package:flutter/material.dart';
import 'utils.dart';
import 'page-1/stock-management-home.dart';
import 'page-1/fusion-ui-login.dart';
// import 'package:myapp/page-1/stock-management-home.dart';
// import 'package:myapp/page-1/stock-management-2.dart';
// import 'package:myapp/page-1/rectangle-6.dart';
// import 'package:myapp/page-1/fusion-ui-concept-1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}
