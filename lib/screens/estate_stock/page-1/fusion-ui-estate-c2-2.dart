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
        // fusionuiestatec22CfV (17:91)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group96Vy (17:92)
              padding: EdgeInsets.fromLTRB(19.38*fem, 50.4*fem, 62.31*fem, 4.6*fem),
              width: double.infinity,
              height: 80*fem,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3Mwh (17:94)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 5*fem),
                    width: 23.08*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-whV.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementF1V (17:95)
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
              // autogroups1abw9D (NE59youWYnofAQULwgs1Ab)
              padding: EdgeInsets.fromLTRB(20*fem, 34.5*fem, 18*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupmkf9pTu (NE59TpmUPbKuZnAtbomKf9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 269*fem, 11.39*fem),
                    width: 53*fem,
                    height: 25*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // messuVM (17:96)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 53*fem,
                              height: 25*fem,
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
                          ),
                        ),
                        Positioned(
                          // messkVy (17:313)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 53*fem,
                              height: 25*fem,
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
                          ),
                        ),
                        Positioned(
                          // messpVq (17:314)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 53*fem,
                              height: 25*fem,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroup9cpmJR1 (NE59eKTz9QqvKoGzvN9cPM)
                    margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 19*fem),
                    width: double.infinity,
                    height: 28.11*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group101KR (17:97)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(8.29*fem, 5.06*fem, 6.74*fem, 5.05*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // centralmess1sMd (17:99)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69.58*fem, 0*fem),
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
                                // vMXh (17:100)
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
                          // group52RGf (17:172)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.11*fem, 0*fem, 0*fem),
                          width: 97*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(6*fem),
                          ),
                          child: Container(
                            // group13vjD (17:101)
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0xd82085d0),
                              borderRadius: BorderRadius.circular(6*fem),
                            ),
                            child: Center(
                              child: Text(
                                'DETAILED VIEW',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w600,
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
                    // group11aom (17:116)
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
                          // autogroupclpdZQo (NE5B4hGPoFJ487AAwVcLPD)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.15*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // chairsruh (17:119)
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
                                // x2509P1 (17:120)
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
                          // lastupdated170822pk3 (17:118)
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
                          // autogroupmttqi4j (NE5BC2PWmdS8LSLtBNmTTq)
                          margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12DXH (17:124)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 163.54*fem, 1.11*fem),
                                width: 94.15*fem,
                                height: 14.44*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle76b5 (17:125)
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
                                      // viewdetailsNYb (17:126)
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
                                // group413ej (17:121)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.11*fem, 0*fem, 0*fem),
                                width: 46.15*fem,
                                height: 14.44*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle79hm (17:122)
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
                                      // editcbM (17:123)
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
                    // group15t35 (17:104)
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
                          // autogroupftwhgzX (NE5AXdKpx5pRp7ZybYFTwh)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.15*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // tablesCT5 (17:106)
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
                                // x50gd9 (17:107)
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
                          // lastupdated170822yMM (17:108)
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
                          // autogrouprbshEo5 (NE5Aescke1LpS2orusrBsh)
                          width: double.infinity,
                          height: 14.55*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group129v3 (17:112)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.12*fem, 165.23*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle73Ej (17:113)
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
                                      // viewdetailsv3d (17:114)
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
                                // group11NwD (17:109)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.12*fem),
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7Txf (17:110)
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
                                      // editZF1 (17:111)
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
                    // group16qTR (17:127)
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
                          // autogroupszs53Jb (NE5BcM2Kdd5TazN9kFszs5)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // plateskio (17:129)
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
                                // x750qkF (17:130)
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
                          // lastupdated2809228zF (17:131)
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
                          // autogroup37wh243 (NE5Bjg9Sc1DXoKYrz937wh)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.08*fem, 0*fem),
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group128My (17:135)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7ER1 (17:136)
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
                                      // viewdetailsXf1 (17:137)
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
                                // group1114P (17:132)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7vBM (17:133)
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
                                      // editQsD (17:134)
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
                    // group175TZ (17:138)
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
                          // autogroupmg7d4aP (NE5C8kKLD7dd9gPjhrmg7d)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // drinkingglassAdR (17:140)
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
                                // x750FPy (17:141)
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
                          // lastupdated280922YP5 (17:142)
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
                          // autogroup5bq5bMM (NE5CGzabJYYCtYyY6j5Bq5)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12WUK (17:146)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle71fy (17:147)
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
                                      // viewdetailsVr3 (17:148)
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
                                // group11Zb1 (17:143)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7HX1 (17:144)
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
                                      // edityej (17:145)
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
                    // group18SoD (17:149)
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
                          // autogroupgwbyGGT (NE5CgjQ3BKskzDP2CoGwBy)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // waterfilteraH9 (17:151)
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
                                // x2sGF (17:152)
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
                          // lastupdated171222AWF (17:153)
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
                          // autogrouphfdmFnb (NE5Co9P22fFKg1AeHhHfdm)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12P87 (17:157)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle75Wj (17:158)
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
                                      // viewdetailsksm (17:159)
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
                                // group11RDD (17:154)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7wST (17:155)
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
                                      // editRsR (17:156)
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
                    // group19Wts (17:160)
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
                          // autogroupacsxwDV (NE5DD8h3kpRvYuQcAQAcSX)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // spoonsEyH (17:162)
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
                                // x750Kzj (17:163)
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
                          // lastupdated280922pRh (17:164)
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
                          // autogroupkjx9uT9 (NE5DLTpAjCZzmEbKQHKjX9)
                          width: double.infinity,
                          height: 14.44*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1221y (17:168)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                                width: 94.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7K15 (17:169)
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
                                      // viewdetailsPWj (17:170)
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
                                // group11fUF (17:165)
                                width: 46.15*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(3*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle7yzj (17:166)
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
                                      // edit52B (17:167)
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
                    // rectangle6MEb (17:171)
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