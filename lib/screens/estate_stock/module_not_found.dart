import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';
import 'success.dart';


const String _url = 'https://www.amazon.com/';
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
        // fusionuiestatec26QCB (58:40)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group9JYT (58:41)
              padding: EdgeInsets.fromLTRB(19.38*fem, 50.4*fem, 62.31*fem, 4.6*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3C83 (58:43)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 5*fem),
                    width: 23.08*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-PDD.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagement5hd (58:44)
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
              // autogroupswsjnc3 (NE5L8w9YgUEzkVSVZCswSj)
              padding: EdgeInsets.fromLTRB(21*fem, 21*fem, 20*fem, 50*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupeujfVFZ (NE5KvXLZQ6aHLybP18eUJF)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 17*fem),
                    padding: EdgeInsets.fromLTRB(24*fem, 84*fem, 24*fem, 24*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(11*fem),
                      gradient: LinearGradient (
                        begin: Alignment(-1, -1),
                        end: Alignment(1, 1),
                        colors: <Color>[Color(0xff7288fd), Color(0xff011164)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // framegL3 (58:67)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                          width: 150*fem,
                          height: 150*fem,
                          child: Image.asset(
                            'assets/page-1/images/frame.png',
                            width: 150*fem,
                            height: 150*fem,
                          ),
                        ),
                        Text(
                          // uhohy4F (58:65)
                          'Uh oh!',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 40*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2175*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Container(
                          // seemslikeyoudonothaveaccesstot (58:66)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 167*fem),
                          constraints: BoxConstraints (
                            maxWidth: 270*fem,
                          ),
                          child: Text(
                            'Seems like you do not have\naccess to this module',
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
                        Container(
                          // ifyouthinkthisisamistakecontac (58:71)
                          margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                          child: Text(
                            'if you think this is a mistake, contact admin',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
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
                    // group54G5R (58:38)
                    width: double.infinity,
                    height: 36*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff4197d7),
                      borderRadius: BorderRadius.circular(7*fem),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Success()),
                        );
                      },
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