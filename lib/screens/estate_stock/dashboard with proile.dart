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
        // fusionuidashboardc21BBZ (7:110)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group9Tum (7:111)
              padding: EdgeInsets.fromLTRB(21*fem, 30.5*fem, 123*fem, 24.5*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // image3k8B (7:113)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 78.92*fem, 0*fem),
                    width: 23.08*fem,
                    height: 17*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-mN3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // dashboarddhm (7:114)
                    'Dashboard',
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
              // autogroupdmskXo9 (NE4pahZZLCSWXddChoDmSK)
              padding: EdgeInsets.fromLTRB(21*fem, 10*fem, 21*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group241TR (7:115)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                    padding: EdgeInsets.fromLTRB(9*fem, 9*fem, 212*fem, 9*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // image44gb (7:117)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                          width: 20*fem,
                          height: 20*fem,
                          child: Image.asset(
                            'assets/page-1/images/image-4-1Th.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          // searchNSP (7:118)
                          'Search',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 17*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2941176471*ffem/fem,
                            letterSpacing: -0.4079999924*fem,
                            color: Color(0xffbebebe),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group25GXm (7:119)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20.5*fem),
                    padding: EdgeInsets.fromLTRB(9*fem, 11.5*fem, 9*fem, 6.5*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(11*fem),
                      gradient: LinearGradient (
                        begin: Alignment(-1, 4.143),
                        end: Alignment(-1, -1),
                        colors: <Color>[Color(0xff5914ad), Color(0xd82085d0)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x7f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 4*fem,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogrouphrcbDrK (NE4q5wDqwGP7nYRDjnHrcB)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 16.5*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // group398TV (7:480)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.5*fem, 19*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(16*fem, 15*fem, 15*fem, 16*fem),
                                decoration: BoxDecoration (
                                  color: Color(0xffe3e9ee),
                                  borderRadius: BorderRadius.circular(35.5*fem),
                                ),
                                child: Center(
                                  // image5RBh (7:126)
                                  child: SizedBox(
                                    width: 40*fem,
                                    height: 40*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/image-5-puy.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupmmj3L3m (NE4qFr6zhsbMPfuYbXmMJ3)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      // viditjaincsepDq (7:122)
                                      text: TextSpan(
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 20*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Vidit Jain ',
                                          ),
                                          TextSpan(
                                            text: '- CSE',
                                            style: SafeGoogleFont (
                                              'Montserrat',
                                              fontSize: 20*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2175*ffem/fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // btech2020R79 (7:123)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                      child: Text(
                                        'B-Tech 2020',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2175*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // sem6hqM (7:124)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.5*fem),
                                      child: Text(
                                        'Sem - 6',
                                        style: SafeGoogleFont (
                                          'Montserrat',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2175*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // studentzpT (7:125)
                                      'Student',
                                      style: SafeGoogleFont (
                                        'Montserrat',
                                        fontSize: 11*ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2175*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupqzuuvCK (NE4qZ1H5AQKycidkmcqZuu)
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // professionalprofile2WF (7:127)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 111*fem, 0*fem),
                                child: Text(
                                  'Professional Profile >',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 10*ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Text(
                                // viewfullprofile71u (7:128)
                                'View Full Profile >',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // quicklinkscDZ (7:129)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 197*fem, 14.5*fem),
                    child: Text(
                      'Quick Links',
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
                    // group27hVu (7:130)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // notificationsn1Z (7:132)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 117*fem,
                              height: 22*fem,
                              child: Text(
                                'Notifications',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // eJf (7:133)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26iZR (7:134)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-rv7.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group33b7R (7:240)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group262Cj (7:244)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-HLw.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // notificationsJvw (7:242)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 106*fem, 2*fem),
                                  child: Text(
                                    'Notifications',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // oMu (7:243)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group28WXD (7:150)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // academicsoFR (7:152)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 101*fem,
                              height: 22*fem,
                              child: Text(
                                'Academics',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // UMZ (7:153)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26kK5 (7:154)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-cVy.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group34Rw1 (7:250)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group26VAB (7:254)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-bKR.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // academicsNjm (7:252)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 122*fem, 2*fem),
                                  child: Text(
                                    'Academics',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // ruq (7:253)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group29NdH (7:160)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // placementr2f (7:162)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 100*fem,
                              height: 22*fem,
                              child: Text(
                                'Placement',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // 7jH (7:163)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26asm (7:164)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-LBu.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group35rqH (7:258)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group26iMh (7:262)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-Kko.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // placementcCB (7:260)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 123*fem, 2*fem),
                                  child: Text(
                                    'Placement',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // hjR (7:261)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group30dd5 (7:171)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // complaintKko (7:173)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 96*fem,
                              height: 22*fem,
                              child: Text(
                                'Complaint',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // zrw (7:174)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26V31 (7:175)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-bfR.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group36NMh (7:266)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group261vT (7:270)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-UzP.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // complaintJef (7:268)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 127*fem, 2*fem),
                                  child: Text(
                                    'Complaint',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // yF1 (7:269)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group31JHH (7:181)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // departmentyuD (7:183)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 114*fem,
                              height: 22*fem,
                              child: Text(
                                'Department',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // 3PH (7:184)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26X3Z (7:185)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-Zvj.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group37CQb (7:274)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group26T5d (7:278)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-T8f.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // departmentk4j (7:276)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 109*fem, 2*fem),
                                  child: Text(
                                    'Department',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // dPR (7:277)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group32kU3 (7:191)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // leaveqkP (7:193)
                          left: 66*fem,
                          top: 18*fem,
                          child: Align(
                            child: SizedBox(
                              width: 53*fem,
                              height: 22*fem,
                              child: Text(
                                'Leave',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // v19 (7:194)
                          left: 289*fem,
                          top: 17.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 13*fem,
                              height: 25*fem,
                              child: Text(
                                '>',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26CUT (7:195)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-kx3.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group38Uwm (7:282)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                            width: 318*fem,
                            height: 60*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group26x6F (7:286)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  width: 42*fem,
                                  height: 42*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-26-n7d.png',
                                    width: 42*fem,
                                    height: 42*fem,
                                  ),
                                ),
                                Container(
                                  // leave3tP (7:284)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 170*fem, 2*fem),
                                  child: Text(
                                    'Leave',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // kH1 (7:285)
                                  '>',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group325KH (7:211)
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26wsH (7:215)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-fSb.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // healthcarecentereFu (7:213)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 56*fem, 2*fem),
                          child: Text(
                            'Healthcare Center',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          // jHM (7:214)
                          '>',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.2175*ffem/fem,
                            color: Color(0xff000000),
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
          );
  }
}