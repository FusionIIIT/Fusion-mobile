import 'package:flutter/material.dart';
import 'package:fusion/screens/Gymkhana/Homepage.dart';
import 'package:fusion/screens/Gymkhana/Polls.dart';
import 'package:fusion/screens/Gymkhana/Apply.dart';
import 'package:fusion/screens/Gymkhana/Record.dart';
import 'package:fusion/screens/Gymkhana/Club.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => Homepage(),
        '/first': (context) =>Applyy(),
        '/second': (context) => Home(),
        '/third': (context) => Clubs(),
        '/fourth': (context) => Records(),
      },
    );
  }
}