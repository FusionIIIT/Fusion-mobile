import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'utils.dart';
import 'page-1/global dashboard.dart';
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Scene(),
      ),
    ),
	);
	}
}

