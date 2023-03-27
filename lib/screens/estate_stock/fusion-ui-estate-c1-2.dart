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
        // fusionuiestatec12NXu (7:570)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // group9fG7 (7:571)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19.82*fem),
              padding: EdgeInsets.fromLTRB(19.38*fem, 59.02*fem, 62.31*fem, 9.66*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3uw9 (7:573)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 1.58*fem),
                    width: 23.08*fem,
                    height: 23.42*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-Rxf.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementoFq (7:574)
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
              // messVuM (7:575)
              margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
              child: Text(
                'Mess',
                style: SafeGoogleFont (
                  'Montserrat',
                  fontSize: 20*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2175*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroupf6mqPjq (NE53z9ZU5QtJdAsXcZF6mq)
              padding: EdgeInsets.fromLTRB(20*fem, 11.39*fem, 18*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupntvftRh (NE53fjvUMzvSVvxvbJntvf)
                    margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 2.38*fem, 19*fem),
                    width: double.infinity,
                    height: 28.1*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group10apK (7:576)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.85*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(8.31*fem, 5.06*fem, 6.77*fem, 5.05*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // centralmess12RR (7:578)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69.92*fem, 0*fem),
                                child: Text(
                                  'Central Mess - 1',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // vuk7 (7:579)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.95*fem),
                                child: Text(
                                  'v',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group13cPd (7:580)
                          width: 55.38*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xd82085d0),
                            borderRadius: BorderRadius.circular(6*fem),
                          ),
                          child: Center(
                            child: Text(
                              'ADD',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 11*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175*ffem/fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group1152K (7:655)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.77*fem, 11.91*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.08*fem, 4.88*fem),
                    width: 321.23*fem,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogrouprufrTYf (NE54xTGyucmmiFt5gNruFR)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.15*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // chairskGs (7:652)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 192.69*fem, 1.87*fem),
                                child: Text(
                                  'Chairs',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x250pnX (7:653)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x250',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated170822v4s (7:654)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11.05*fem),
                          child: Text(
                            'Last Updated: 17/08/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupnrdmPj9 (NE556HPGakbwV4jkTXNRDm)
                          margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12uSb (7:658)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 163.54*fem, 1.11*fem),
                                width: 94.15*fem,
                                height: 14.44*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7yBZ (7:659)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetails2vX (7:660)
                                      left: 15.6923217773*fem,
                                      top: 0.4368896484*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group41zF5 (10:662)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.11*fem, 0*fem, 0*fem),
                                width: 46.15*fem,
                                height: 14.44*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle72Bm (7:656)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // editJQB (7:657)
                                      left: 12*fem,
                                      top: 0.4368896484*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // group15MtF (7:594)
                    margin: EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.34*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 7.38*fem, 8.98*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroup83abkvP (NE54Q8sVoa4uW57VVG83ab)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.15*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // tablesFcF (7:596)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 202.38*fem, 1.87*fem),
                                child: Text(
                                  'Tables',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x508AF (7:597)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x50',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated170822DSb (7:598)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.93*fem),
                          child: Text(
                            'Last Updated: 17/08/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupqzoqVQ7 (NE54XYpp4QpfJpF2egqZoq)
                          width: double.infinity,
                          height: 14.55*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12D5D (7:602)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.12*fem, 165.23*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7W4K (7:603)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetailsu6T (7:604)
                                      left: 15.6923217773*fem,
                                      top: 0.4368896484*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11tDH (7:599)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.12*fem),
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7mns (7:600)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // editFi3 (7:601)
                                      left: 12*fem,
                                      top: 0.4368896484*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // group168Ww (7:605)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.77*fem, 12.01*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.23*fem, 8.98*fem),
                    width: 321.23*fem,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupaaaf8fM (NE55W2CiTXwVaj9EZbaAaf)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // platese7u (7:607)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 193.69*fem, 1.87*fem),
                                child: Text(
                                  'Plates',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750jf9 (7:608)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated2809222PM (7:609)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupxhqpWJX (NE55dmUorD9ym845RCXHQP)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.08*fem, 0*fem),
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12pKD (7:613)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7v7M (7:614)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetailsCqZ (7:615)
                                      left: 15.6923217773*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11RyD (7:610)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7ViB (7:611)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // edit7Uf (7:612)
                                      left: 12*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // group17BDd (7:616)
                    margin: EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.18*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupj2mhyfH (NE563WJFizVXrnTZXGj2mH)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // drinkingglassHR5 (7:618)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 107.38*fem, 1.87*fem),
                                child: Text(
                                  'Drinking Glass',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750AUs (7:619)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated280922fAj (7:620)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupcxuqWSF (NE569kcr1QdjMkMXm5cxuq)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12phq (7:624)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7iHR (7:625)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetailszEw (7:626)
                                      left: 15.6923217773*fem,
                                      top: 0.4370117188*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11Ssd (7:621)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7NFV (7:622)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // editrRZ (7:623)
                                      left: 12*fem,
                                      top: 0.4370117188*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // group18uud (7:627)
                    margin: EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.18*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroup18c37Vu (NE56YKoZumMj9dXSwY18C3)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // waterfilter1rB (7:629)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 159.38*fem, 1.87*fem),
                                child: Text(
                                  'Water Filter',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x2hyu (7:630)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x2',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated171222cLB (7:631)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                          child: Text(
                            'Last Updated: 17/12/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroup1rdqJTu (NE56ejnYm6jHqRK52S1rdq)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12RYX (7:635)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle78C3 (7:636)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetailsoZ5 (7:637)
                                      left: 15.6923217773*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11g75 (7:632)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7ay9 (7:633)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // edit5Q7 (7:634)
                                      left: 12*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // group19Lqq (7:638)
                    margin: EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 11.49*fem),
                    padding: EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupkqomZCo (NE573oxSND9PBn9wk9kQom)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // spoonsGN7 (7:640)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180.38*fem, 1.87*fem),
                                child: Text(
                                  'Spoons',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750NAF (7:641)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated280922TSb (7:642)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupvxnbwcf (NE57ByPWBBSHLEnvDUVXNb)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12rjd (7:646)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7Z8F (7:647)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 94.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // viewdetailsUPd (7:648)
                                      left: 15.6923217773*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 68*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'View Details',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11Kv3 (7:643)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7Sjm (7:644)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46.15*fem,
                                          height: 14.05*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(3*fem),
                                              color: Color(0xff20d0ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // edit8cb (7:645)
                                      left: 12*fem,
                                      top: 0.4367675781*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 14*fem,
                                          child: Text(
                                            'Edit',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
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
                      ],
                    ),
                  ),
                  Container(
                    // rectangle6PHd (7:649)
                    width: double.infinity,
                    height: 85*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffd9d9d9),
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