import 'package:flutter/material.dart';
import 'package:fusion/screens/home.dart';
import 'package:fusion/Academic/academic_home_page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Complete WebView in Flutter',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: AcademicHomePage(),
    );
  }
}