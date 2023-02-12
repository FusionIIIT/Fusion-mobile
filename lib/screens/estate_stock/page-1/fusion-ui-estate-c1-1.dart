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
        // fusionuiestatec11XsZ (7:533)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group923d (17:13)
              padding: EdgeInsets.fromLTRB(19.38*fem, 60.31*fem, 62.31*fem, 10.42*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3JG3 (17:15)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 1.07*fem),
                    width: 23.08*fem,
                    height: 23.93*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-Tv3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementz8s (17:16)
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
              // autogroupv7xxgGb (NE521NXP357d2GGwUmV7xX)
              padding: EdgeInsets.fromLTRB(18.46*fem, 72.75*fem, 18.46*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup6v5rn4j (NE513Q8eLhgtJq3h786v5R)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18.19*fem),
                    width: double.infinity,
                    height: 156.99*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group15Jj (7:538)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.46*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(7.54*fem, 30.63*fem, 7.77*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xff2085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image4GPD (7:541)
                                margin: EdgeInsets.fromLTRB(0.38*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-VfR.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // visitorhostelMfZ (7:540)
                                'Visitor Hostel',
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
                          // group2fw9 (7:554)
                          padding: EdgeInsets.fromLTRB(42.77*fem, 30.63*fem, 43.54*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image572T (7:557)
                                margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-CZR.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // hostelPVm (7:556)
                                'Hostel',
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
                      ],
                    ),
                  ),
                  Container(
                    // autogroup3b1mJcj (NE51Gouy2ajnqJEijj3B1M)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18.19*fem),
                    width: double.infinity,
                    height: 156.99*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group3o3h (7:546)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.46*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(19.54*fem, 30.63*fem, 19.77*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image41Qf (7:549)
                                margin: EdgeInsets.fromLTRB(0.38*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-2XM.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // gymkhana6BD (7:548)
                                'Gymkhana',
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
                          // group4oLX (7:562)
                          padding: EdgeInsets.fromLTRB(18.77*fem, 30.63*fem, 19.54*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image52UB (7:565)
                                margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-Dzb.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // academicsXfq (7:564)
                                'Academics',
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
                      ],
                    ),
                  ),
                  Container(
                    // autogroupyrwh4Qs (NE51WDhHiTnhMmRkNKyRwH)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18.19*fem),
                    width: double.infinity,
                    height: 156.99*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group5Mum (7:542)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.46*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(48.54*fem, 30.63*fem, 48.39*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image4NK5 (7:545)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                // messGfM (7:544)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.38*fem, 0*fem),
                                child: Text(
                                  'Mess',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group7xYB (7:558)
                          padding: EdgeInsets.fromLTRB(32.77*fem, 30.63*fem, 33.54*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image5yy5 (7:561)
                                margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-jt7.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // requestgsV (7:560)
                                'Request',
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
                      ],
                    ),
                  ),
                  Container(
                    // autogroupsvgfQHh (NE51ixq48fv98w4AcaSVgF)
                    width: double.infinity,
                    height: 156.99*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group6KfZ (7:550)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.46*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(23.08*fem, 30.63*fem, 16.24*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image48N7 (7:553)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.92*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-Zjq.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // gymkhanaRc7 (7:552)
                                'Gymkhana',
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
                          // group89Y7 (7:566)
                          padding: EdgeInsets.fromLTRB(24.92*fem, 30.63*fem, 13.39*fem, 25.73*fem),
                          width: 152.31*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(12*fem),
                            gradient: LinearGradient (
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[Color(0xd82085d0), Color(0xff334bc8)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image5adR (7:569)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.46*fem, 18.19*fem),
                                width: 55.38*fem,
                                height: 57.44*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-C7M.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // academics5aB (7:568)
                                'Academics',
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