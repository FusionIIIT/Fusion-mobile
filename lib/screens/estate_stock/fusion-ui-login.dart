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
        // fusionuilogin3as (1:2)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group20Hdd (1:8)
              width: double.infinity,
              height: 334*fem,
              child: Stack(
                children: [
                  Positioned(
                    // ellipse1ZLF (1:9)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 412*fem,
                        height: 291*fem,
                        child: Image.asset(
                          'assets/page-1/images/ellipse-1.png',
                          width: 412*fem,
                          height: 291*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse31CF (1:10)
                    left: 120*fem,
                    top: 68*fem,
                    child: Align(
                      child: SizedBox(
                        width: 124*fem,
                        height: 124*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(62*fem),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse23ej (1:11)
                    left: 125*fem,
                    top: 73*fem,
                    child: Align(
                      child: SizedBox(
                        width: 114*fem,
                        height: 114*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(57*fem),
                            color: Color(0xffe3e9ee),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // image2jGf (1:12)
                    left: 142*fem,
                    top: 90*fem,
                    child: Align(
                      child: SizedBox(
                        width: 80*fem,
                        height: 80*fem,
                        child: Image.asset(
                          'assets/page-1/images/image-2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupd2h9d79 (NE4kbjN5RiSYEoMyjyD2H9)
              padding: EdgeInsets.fromLTRB(21*fem, 57*fem, 21*fem, 178*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouppzetKEs (NE4kNVF9JkczuA4bxTPZeT)
                    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 4*fem, 53.5*fem),
                    padding: EdgeInsets.fromLTRB(47*fem, 0*fem, 47*fem, 0*fem),
                    width: double.infinity,
                    height: 61.5*fem,
                    child: Text(
                      'Fusion IIIT',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 40*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // group215dM (1:14)
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // autogroupqe3dzVR (NE4ktyNMAhnr4G31qbqe3d)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                          padding: EdgeInsets.fromLTRB(10.03*fem, 20.57*fem, 10.03*fem, 18.43*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffe3e9ee),
                            borderRadius: BorderRadius.circular(16*fem),
                          ),
                          child: Text(
                            '20bcs243@iiitdmj.ac.in',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupsxq1Pvs (NE4m28q5aAhZ5mL5EPsxq1)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.46*fem),
                          padding: EdgeInsets.fromLTRB(10.03*fem, 16.48*fem, 7.33*fem, 17.22*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffe3e9ee),
                            borderRadius: BorderRadius.circular(16*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // passwordR6s (1:21)
                                margin: EdgeInsets.fromLTRB(0*fem, 2.17*fem, 205.5*fem, 0*fem),
                                child: Text(
                                  'password',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // image1tm9 (1:22)
                                width: 23.14*fem,
                                height: 24.3*fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // forgotpasswordPT1 (1:20)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 37.54*fem),
                          child: Text(
                            'Forgot Password?',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175*ffem/fem,
                              decoration: TextDecoration.underline,
                              color: Color(0xff2085d0),
                              decorationColor: Color(0xff2085d0),
                            ),
                          ),
                        ),
                        Container(
                          // group22edq (1:23)
                          width: double.infinity,
                          height: 58*fem,
                          decoration: BoxDecoration (
                            color: Color(0xff2085d0),
                            borderRadius: BorderRadius.circular(16*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Sign in',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 15*ffem,
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
            ),
          ],
        ),
      ),
          );
  }
}