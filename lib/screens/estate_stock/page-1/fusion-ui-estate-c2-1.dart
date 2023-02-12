import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // fusionuiestatec21qpF (17:2)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // group9w6b (7:534)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29.5*fem),
              padding: EdgeInsets.fromLTRB(19.38*fem, 50.4*fem, 62.31*fem, 4.6*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3PUP (7:536)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 5*fem),
                    width: 23.08*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementV1d (7:537)
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
            Center(
              // stocksummarymessNr7 (17:29)
              child: Container(
                width: double.infinity,
                child: Text(
                  'Stock Summary - Mess',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Montserrat',
                    fontSize: 20*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2175*ffem/fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupxvbr4U3 (NE5Hckr7f8XxTwUQPHXVbR)
              padding: EdgeInsets.fromLTRB(16*fem, 9.5*fem, 21*fem, 252*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // autogroupmeaoxJX (NE5HNBS4zpsVdh3oq4meao)
                    margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 69.5*fem),
                    padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 10*fem, 10*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          // numberofitemsinstock98131Xh (17:33)
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Number of Items in stock:  9813',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8*fem,
                        ),
                        Center(
                          // lastverifiedon28022023Teb (17:88)
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Last Verified on:  28/02/2023',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8*fem,
                        ),
                        Center(
                          // numberofitemsinstock9813XeT (17:90)
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Number of Items in stock:  9813',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    // actionscvo (17:30)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11.5*fem),
                      width: double.infinity,
                      child: Text(
                        'Actions',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2175*ffem/fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group27u9D (17:37)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                    width: double.infinity,
                    height: 64*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle61CF (17:38)
                          left: 5*fem,
                          top: 2*fem,
                          child: Align(
                            child: SizedBox(
                              width: 318*fem,
                              height: 60*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(6*fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // viewstock4wD (17:39)
                          left: 71*fem,
                          top: 20*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 101*fem,
                                height: 22*fem,
                                child: Text(
                                  'View Stock',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // vyR (17:40)
                          left: 294*fem,
                          top: 19.5*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13*fem,
                                height: 25*fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // group26nkj (17:41)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 64*fem,
                              height: 64*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-7eK.png',
                                width: 64*fem,
                                height: 64*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group28Gfu (17:45)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                    width: double.infinity,
                    height: 64*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6Zuu (17:46)
                          left: 5*fem,
                          top: 2*fem,
                          child: Align(
                            child: SizedBox(
                              width: 318*fem,
                              height: 60*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(6*fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // addstockFXq (17:47)
                          left: 71*fem,
                          top: 20*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 94*fem,
                                height: 22*fem,
                                child: Text(
                                  'Add Stock',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // 74F (17:48)
                          left: 294*fem,
                          top: 19.5*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13*fem,
                                height: 25*fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // group26kN7 (17:49)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 64*fem,
                              height: 64*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-UxB.png',
                                width: 64*fem,
                                height: 64*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group29RDM (17:53)
                    width: double.infinity,
                    height: 64*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6kFd (17:54)
                          left: 5*fem,
                          top: 2*fem,
                          child: Align(
                            child: SizedBox(
                              width: 318*fem,
                              height: 60*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(6*fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // generatereportpmH (17:55)
                          left: 71*fem,
                          top: 20*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152*fem,
                                height: 22*fem,
                                child: Text(
                                  'Generate Report',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // 5x7 (17:56)
                          left: 294*fem,
                          top: 19.5*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13*fem,
                                height: 25*fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
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
                        ),
                        Positioned(
                          // group26Z6b (17:57)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 64*fem,
                              height: 64*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-dfq.png',
                                width: 64*fem,
                                height: 64*fem,
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
          );
  }
}