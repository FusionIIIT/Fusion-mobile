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
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone13mini1L3m (6:37)
        width: double.infinity,
        height: 812*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(50*fem),
        ),
        child: Container(
          // stockmanagementhomeVzB (102:2)
          width: 390*fem,
          height: 844*fem,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // group9jtX (102:3)
                padding: EdgeInsets.fromLTRB(21*fem, 35*fem, 32*fem, 12*fem),
                width: double.infinity,
                height: 100*fem,
                decoration: BoxDecoration (
                  color: Color(0xd82085d0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup6tikG9h (Eq3kgPKqeeLo79qbf76TiK)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // L35 (7:48)
                            margin: EdgeInsets.fromLTRB(13*fem, 0*fem, 0*fem, 6*fem),
                            child: Text(
                              '1:11',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // image38Dq (102:5)
                            width: 25*fem,
                            height: 25*fem,
                            child: Image.asset(
                              'assets/page-1/images/image-3-oPH.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupoyzfp6f (Eq3krdXmZ61m5w7ED2oYzf)
                      width: 228*fem,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            // estatemanagementv9h (102:6)
                            left: 0*fem,
                            top: 28*fem,
                            child: Align(
                              child: SizedBox(
                                width: 210*fem,
                                height: 25*fem,
                                child: Text(
                                  'Estate Management',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // signalVMD (7:47)
                            left: 205*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 23*fem,
                                height: 29*fem,
                                child: Image.asset(
                                  'assets/page-1/images/signal-hf1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // fullbattery6M1 (7:45)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                      width: 35*fem-35,
                      height: 25*fem,
                      child: Image.asset(
                        'assets/page-1/images/full-battery-XLX.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupl1hu9KH (Eq3k7KSbzU6nZFZaA6L1hu)
                padding: EdgeInsets.fromLTRB(7*fem, 31*fem, 8*fem, 74*fem),
                width: double.infinity,
                height: 744*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupq48tRXh (Eq3jiabVXC9RaYW18Yq48T)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 22*fem),
                      width: double.infinity,
                      height: 566*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // image1iFu (7:42)
                            left: 0*fem,
                            top: 81*fem,
                            child: Align(
                              child: SizedBox(
                                width: 375*fem,
                                height: 485*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-7.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // yourexecutionisconfirmedxAF (6:38)
                            left: 59*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 254*fem,
                                height: 29*fem,
                                child: Text(
                                  'Transaction Successful',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 24*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // succesfultransaction9Vd (6:39)
                            left: 61*fem,
                            top: 17*fem,
                            child: Align(
                              child: SizedBox(
                                width: 226*fem,
                                height: 85*fem,
                                child: Text(
                                  '\nThank you for executing this transaction, Please see your updated section.',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupqvafNdH (Eq3jwVPeWKWEYY25DtQvAf)
                      margin: EdgeInsets.fromLTRB(94*fem, 0*fem, 94*fem, 0*fem),
                      width: double.infinity,
                      height: 51*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff95d0a9),
                        borderRadius: BorderRadius.circular(10*fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Home',
                          style: SafeGoogleFont (
                            'Roboto',
                            fontSize: 30*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.1725*ffem/fem,
                            color: Color(0xfffcfcfc),
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
      ),
          );
  }
}