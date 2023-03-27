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
          child: FilterPage(),
        ),
      ),
    );
  }
}

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // estatemanagementaddstockJe7 (202:108)
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        // group71Lqh (202:148)
        width: double.infinity,
        height: 40 * fem,
        child:
        Stack(
          children: [
            Positioned(
              // estatemanagement411 (202:150)
              left: 93 * fem,
              top: 15 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 147 * fem,
                  height: 18 * fem,
                  child:
                  Text(
                    'Estate Management',
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle1SXM (202:151)
              left: 0 * fem,
              top: 0 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 360 * fem,
                  height: 40 * fem,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff36c35),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // profilepic7tP (202:153)
              left: 316 * fem,
              top: 8 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 24 * fem,
                  height: 24 * fem,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12 * fem),
                      color: Color(0xffdae3ea),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/page-1/images/group-26-4V9.png'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // filter9q5 (202:154)
              left: 54 * fem,
              top: 12 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 30 * fem,
                  height: 15 * fem,
                  child:
                  Text(
                    'Filter',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // arrowbackcyZ (202:155)
              left: 16 * fem,
              top: 8 * fem,
              child:
              Align(
                child:
                SizedBox(
                  width: 24 * fem,
                  height: 24 * fem,
                  child:
                  Image.asset(
                    'assets/page-1/images/image-3.png',
                    fit: BoxFit.cover,
                    width: 20*fem,
                    height: 20*fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        // autogroupv2hqrsu (6J3f6D2ZZqTYodxdLNV2hq)
        padding: EdgeInsets.fromLTRB(20 * fem, 40 * fem, 20 * fem, 45 * fem),
        width: double.infinity,
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Container(
        // textfield96K (202:109)
        margin: EdgeInsets.fromLTRB(0*fem, 0 * fem, 0 * fem, 12 * fem),
        width: double.infinity,
        height: 64 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4 * fem),
            topRight: Radius.circular(4 * fem),
          ),
        ),
        child:
        Container(
          // textfieldpTM (202:110)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xfff36c35)),
          borderRadius: BorderRadius.circular(4 * fem),
        ),
        child:
        Container(
          // statelayerYu9 (202:111)
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 110 * fem, 0 * fem),
          padding: EdgeInsets.fromLTRB(12 * fem, 0 * fem, 12 * fem, 0 * fem),
          width: 210 * fem,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4 * fem),
              topRight: Radius.circular(4 * fem),
            ),
          ),
          child:
          Container(
            // content1nj (202:112)
            width: 67 * fem,
            height: 42.5 * fem,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // labeltextjCw (202:115)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 0 * fem, 11.5 * fem),
                  width: double.infinity,
                  height: 18 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xfffffbfe),
                  ),
                  child:
                  Center(
                    child:
                    Text(
                      ' Sort By:',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xfff36c35),
                      ),
                    ),
                  ),
                ),
                Container(
                  // placeholdertextMk7 (202:114)
                  margin: EdgeInsets.fromLTRB(
                      4 * fem, 0 * fem, 0 * fem, 0 * fem),
                  child:
                  Text(
                    'By Name',
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontSize: 10 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xffdadada),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Container(
    // textfieldEou (202:117)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
    width: double.infinity,
    height: 64*fem,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // textfieldwCX (202:118)
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    border: Border.all(color: Color(0xfff36c35)),
    borderRadius: BorderRadius.circular(4*fem),
    ),
    child:
    Container(
    // statelayerFDD (202:119)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 110*fem, 0*fem),
    padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 0*fem),
    width: 210*fem,
    height: double.infinity,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // contenticb (202:120)
    width: 119*fem,
    height: 42.5*fem,
    child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    // labeltextF6j (202:123)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11.5*fem),
    width: 97*fem,
    height: 18*fem,
    decoration: BoxDecoration (
    color: Color(0xfffffbfe),
    ),
    child:
    Center(
    child:
    Text(
    'Department',
    style: SafeGoogleFont (
    'Montserrat',
    fontSize: 14*ffem,
    fontWeight: FontWeight.w500,
    height: 1.2175*ffem/fem,
    color: Color(0xfff36c35),
    ),
    ),
    ),
    ),
    Container(
    // placeholdertextfgF (202:122)
    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
    child:
    Text(
    'Enter the Department.',
    style: SafeGoogleFont (
    'Montserrat',
    fontSize: 10*ffem,
    fontWeight: FontWeight.w400,
    height: 1.2175*ffem/fem,
    color: Color(0xffdadada),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    Container(
    // textfieldwtf (202:158)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
    width: double.infinity,
    height: 64*fem,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // textfieldqDM (202:159)
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    border: Border.all(color: Color(0xfff36c35)),
    borderRadius: BorderRadius.circular(4*fem),
    ),
    child:
    Container(
    // statelayerxYs (202:160)
    padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 4*fem, 0*fem),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    // contentqcf (202:161)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 167*fem, 16*fem),
    child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    // labeltextYmy (202:165)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
    width: 83*fem,
    height: 14*fem,
    decoration: BoxDecoration (
    color: Color(0xfffffbfe),
    ),
    child:
    Center(
    child:
    Text(
    'Starting Date',
    style: SafeGoogleFont (
    'Roboto',
    fontSize: 12*ffem,
    fontWeight: FontWeight.w400,
    height: 1.3333333333*ffem/fem,
    letterSpacing: 0.400000006*fem,
    color: Color(0xfff36c35),
    ),
    ),
    ),
    ),
    Container(
    // inputtextAHZ (202:162)
    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
    width: 91*fem,
    height: 24*fem,
    child:
    Center(
    child:
    Text(
    '10/10/2023',
    style: SafeGoogleFont (
    'Roboto',
    fontSize: 16*ffem,
    fontWeight: FontWeight.w400,
    height: 1.5*ffem/fem,
    letterSpacing: 0.5*fem,
    color: Color(0xff1c1b1f),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // trailingiconQBu (202:167)
    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
    width: 20*fem,
    height: 20*fem,
    child:
    Image.asset(
    'assets/page-1/images/icons8-calendar-100.png', fit: BoxFit.cover,
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    Container(
    // textfieldHWb (202:208)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
    width: double.infinity,
    height: 64*fem,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // textfieldnCT (202:209)
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    border: Border.all(color: Color(0xfff36c35)),
    borderRadius: BorderRadius.circular(4*fem),
    ),
    child:
    Container(
    // statelayerKCP (202:210)
    padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 4*fem, 0*fem),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    // content1L7 (202:211)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 167*fem, 16*fem),
    child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    // labeltextvxs (202:215)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
    width: 77*fem,
    height: 14*fem,
    decoration: BoxDecoration (
    color: Color(0xfffffbfe),
    ),
    child:
    Center(
    child:
    Text(
    'Ending Date',
    style: SafeGoogleFont (
    'Roboto',
    fontSize: 12*ffem,
    fontWeight: FontWeight.w400,
    height: 1.3333333333*ffem/fem,
    letterSpacing: 0.400000006*fem,
    color: Color(0xfff36c35),
    ),
    ),
    ),
    ),
    Container(
    // inputtextM2b (202:212)
    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
    width: 91*fem,
    height: 24*fem,
    child:
    Center(
    child:
    Text(
    '12/12/2023',
    style: SafeGoogleFont (
    'Roboto',
    fontSize: 16*ffem,
    fontWeight: FontWeight.w400,
    height: 1.5*ffem/fem,
    letterSpacing: 0.5*fem,
    color: Color(0xff1c1b1f),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // trailingiconQFm (202:217)
    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
    width: 20*fem,
    height: 20*fem,
    child:
    Image.asset(
    'assets/page-1/images/icons8-calendar-100.png',
    width: 20*fem,
    height: 20*fem,
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    Container(
    // textfield6eP (202:125)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 114*fem),
    width: double.infinity,
    height: 64*fem,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // textfieldBQw (202:126)
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration (
    border: Border.all(color: Color(0xfff36c35)),
    borderRadius: BorderRadius.circular(4*fem),
    ),
    child:
    Container(
    // statelayerWCK (202:127)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 110*fem, 0*fem),
    padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 0*fem),
    width: 210*fem,
    height: double.infinity,
    decoration: BoxDecoration (
    borderRadius: BorderRadius.only (
    topLeft: Radius.circular(4*fem),
    topRight: Radius.circular(4*fem),
    ),
    ),
    child:
    Container(
    // contentNkK (202:128)
    width: 92*fem,
    height: 42.5*fem,
    child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    // labeltexttyZ (202:131)
    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11.5*fem),
    width: 62*fem,
    height: 18*fem,
    decoration: BoxDecoration (
    color: Color(0xfffffbfe),
    ),
    child:
    Center(
    child:
    Text(
    'Section',
    style: SafeGoogleFont (
    'Montserrat',
    fontSize: 14*ffem,
    fontWeight: FontWeight.w500,
    height: 1.2175*ffem/fem,
    color: Color(0xfff36c35),
    ),
    ),
    ),
    ),
    Container(
    // placeholdertextYoD (202:130)
    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
    child:
    Text(
    'Enter the Section',
    style: SafeGoogleFont (
    'Montserrat',
    fontSize: 10*ffem,
    fontWeight: FontWeight.w400,
    height: 1.2175*ffem/fem,
    color: Color(0xffdadada),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    Container(
    // group50q1d (202:145)
    margin: EdgeInsets.fromLTRB(207*fem, 0*fem, 0*fem, 0*fem),
    width: 113*fem,
    height: 33*fem,
    decoration: BoxDecoration (
    color: Color(0xff7e6ab1),
    borderRadius: BorderRadius.circular(6*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Submit',
    style: SafeGoogleFont (
    'Montserrat',
    fontSize: 16*ffem,
    fontWeight: FontWeight.w700,
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
    );
    }
}