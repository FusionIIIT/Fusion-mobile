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
          child: Report(),
        ),
      ),
    );
  }
}

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // fusionuiestatec27Ce7 (1:2)
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // group927M (1:3)
            padding: EdgeInsets.fromLTRB(
                19.38 * fem, 50.4 * fem, 94 * fem, 5.6 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xd82085d0),
            ),
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // image3gSo (1:5)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 52.54 * fem, 4 * fem),
                  width: 23.08 * fem,
                  height: 18 * fem,
                  child:
                  Image.asset(
                    'assets/page-1/images/image-3-8RR.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  // generatereportxv7 (1:6)
                  'Generate Report',
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.218999958 * ffem / fem,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // autogrouprhjh3Rm (7r71bnfACUaXSZEaGfrhjh)
            padding: EdgeInsets.fromLTRB(
                19 * fem, 33 * fem, 20 * fem, 50 * fem),
            width: double.infinity,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group60Xbq (1:7)
                  margin: EdgeInsets.fromLTRB(
                      3 * fem, 0 * fem, 0 * fem, 33 * fem),
                  width: 318 * fem,
                  height: 45 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffe3eee7),
                    borderRadius: BorderRadius.circular(11 * fem),
                  ),
                  child:
                  Center(
                    child:
                    Text(
                      'Report Generation Successful!',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2189999819 * ffem / fem,
                        color: Color(0xff060606),
                      ),
                    ),
                  ),
                ),
                Container(
                  // group43LJP (1:25)
                  margin: EdgeInsets.fromLTRB(
                      2 * fem, 0 * fem, 1 * fem, 17 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // departmentsectiondYP (1:26)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
                        child:
                        Text(
                          'Department/Section:',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2189999819 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // group106wm (1:27)
                        padding: EdgeInsets.fromLTRB(
                            10.18 * fem, 6.35 * fem, 10.18 * fem, 6.22 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child:
                        Text(
                          'Central Mess',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.2189999989 * ffem / fem,
                            color: Color(0xff3e3d3d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group61L5R (1:30)
                  margin: EdgeInsets.fromLTRB(
                      3 * fem, 0 * fem, 0 * fem, 17 * fem),
                  width: 318 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // generatedbyCtK (1:31)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
                        child:
                        Text(
                          'Generated By:',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2189999819 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // group10uGw (1:32)
                        padding: EdgeInsets.fromLTRB(
                            10.18 * fem, 6.35 * fem, 10.18 * fem, 6.22 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child:
                        Text(
                          'Ayush Kumar',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.2189999989 * ffem / fem,
                            color: Color(0xff3e3d3d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group62YKu (1:35)
                  margin: EdgeInsets.fromLTRB(
                      3 * fem, 0 * fem, 0 * fem, 17 * fem),
                  width: 318 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // dateETd (1:36)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
                        child:
                        Text(
                          'Date:',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2189999819 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // group10iNo (1:37)
                        padding: EdgeInsets.fromLTRB(
                            10.18 * fem, 6.35 * fem, 10.18 * fem, 6.22 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child:
                        Text(
                          '28 - 02 - 2023',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.2189999989 * ffem / fem,
                            color: Color(0xff3e3d3d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group11NiF (1:43)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 3 * fem, 17 * fem),
                  width: 318 * fem,
                  height: 62 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child:
                  Container(
                    // group50suu (1:44)
                    padding: EdgeInsets.fromLTRB(
                        13 * fem, 10.89 * fem, 15 * fem, 10.89 * fem),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x0fff0000),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child:
                    Center(
                      // notemakesuretheabovegeneratedi (1:46)
                      child:
                      Center(
                        child:
                        SizedBox(
                          child:
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 290 * fem,
                            ),
                            child:
                            Text(
                              'NOTE: Make sure the above generated \ninformation is accurate before downloading\nthe stock report',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2190000094 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // group57P15 (1:18)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 3 * fem, 19 * fem),
                  padding: EdgeInsets.fromLTRB(
                      18 * fem, 18 * fem, 37 * fem, 18 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffe3e9ee),
                    borderRadius: BorderRadius.circular(7 * fem),
                  ),
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // svgrepoiconcarrier3rK (1:21)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 33 * fem, 0 * fem),
                        width: 25 * fem,
                        height: 30 * fem,
                        child:
                        Image.asset(
                          'assets/page-1/images/file.png',
                          width: 25*fem,
                          height: 30 * fem,
                        ),
                      ),
                      Text(
                        // messstock28022023pdf8cs (1:20)
                        'MessStock_28022023.pdf',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2189999819 * ffem / fem,
                          color: Color(0xff060606),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group63Rrs (1:40)
                  margin: EdgeInsets.fromLTRB(
                      2 * fem, 0 * fem, 37 * fem, 17 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                  ),
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // rectangle19wKR (1:41)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 10 * fem, 0 * fem),
                        width: 20 * fem,
                        height: 20 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                          color: Color(0x7fd9d9d9),
                        ),
                      ),
                      Container(
                        // sendacopyofthereporttoyouremai (1:42)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 1 * fem),
                        child:
                        Text(
                          'Send a copy of the report to your email id',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2190000216 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group59X2j (1:14)
                  margin: EdgeInsets.fromLTRB(
                      2 * fem, 0 * fem, 1 * fem, 17 * fem),
                  width: double.infinity,
                  height: 55 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7 * fem),
                  ),
                  child:
                  Container(
                    // group552kB (1:15)
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff002a49),
                      borderRadius: BorderRadius.circular(7 * fem),
                    ),
                    child:
                    Center(
                      child:
                      Text(
                        'View',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.218999958 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // group58TqV (1:10)
                  margin: EdgeInsets.fromLTRB(
                      2 * fem, 0 * fem, 1 * fem, 0 * fem),
                  width: double.infinity,
                  height: 55 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7 * fem),
                  ),
                  child:
                  Container(
                    // group55mrB (1:11)
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff002a49),
                      borderRadius: BorderRadius.circular(7 * fem),
                    ),
                    child:
                    Center(
                      child:
                      Text(
                        'Download',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.218999958 * ffem / fem,
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
    );
  }
}