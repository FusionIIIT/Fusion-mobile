import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';
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

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // fusionuiestatec25n19 (58:18)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group9gMR (58:19)
              padding: EdgeInsets.fromLTRB(19.38*fem, 50.4*fem, 62.31*fem, 4.6*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3AGb (58:21)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 5*fem),
                    width: 23.08*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-EQj.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementSzo (58:22)
                    'Estate Management',
                    style: SafeGoogleFont (
                      'Montserrat',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2175*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupg22wZ3q (NE5KMscJADQgm93V7qg22w)
              padding: EdgeInsets.fromLTRB(21*fem, 21*fem, 21*fem, 90*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupzx6b4WP (NE5KCNt7ouGs85HHsozX6B)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                    padding: EdgeInsets.fromLTRB(31*fem, 84*fem, 27*fem, 183*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(11*fem),
                      gradient: LinearGradient (
                        begin: Alignment(-0.956, -0.98),
                        end: Alignment(1, 0.935),
                        colors: <Color>[Color(0xffff5a3e), Color(0xff5b0e01)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // svgrepoiconcarrier4eo (58:33)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 40*fem),
                          width: 150*fem,
                          height: 150*fem,
                          child: Image.asset(
                            'assets/page-1/images/svgrepoiconcarrier.png',
                            width: 150*fem,
                            height: 150*fem,
                          ),
                        ),
                        Container(
                          // failureM87 (58:29)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                          child: Text(
                            'FAILURE!',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 40*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.2175*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // itemscouldnotbeaddedtryagainRN (58:28)
                          constraints: BoxConstraints (
                            maxWidth: 260*fem,
                          ),
                          child: Text(
                            'Items could not be added.\nTry again',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.2175*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group55tXM (58:39)
                    width: double.infinity,
                    height: 36*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff4197d7),
                      borderRadius: BorderRadius.circular(7*fem),
                    ),
                    child: Center(
                      child: Text(
                        'GO BACK',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2175*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}