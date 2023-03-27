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
        // fusionuidashboardc22Jpj (7:345)
        width: double.infinity,
        height: 800*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // group9a1Z (7:346)
              left: 0*fem,
              top: 0*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  padding: EdgeInsets.fromLTRB(21*fem, 30.5*fem, 123*fem, 24.5*fem),
                  width: 360*fem,
                  height: 80*fem,
                  decoration: BoxDecoration (
                    color: Color(0xd82085d0),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // image3MwR (7:348)
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 78.92*fem, 0*fem),
                          width: 23.08*fem,
                          height: 17*fem,
                          child: Image.asset(
                            'assets/page-1/images/image-3-CUK.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          // dashboardF1D (7:349)
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
                ),
              ),
            ),
            Positioned(
              // group248ao (7:350)
              left: 21*fem,
              top: 90*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  padding: EdgeInsets.fromLTRB(9*fem, 9*fem, 212*fem, 9*fem),
                  width: 318*fem,
                  height: 40*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(10*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // image4Xsq (7:352)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                          width: 20*fem,
                          height: 20*fem,
                          child: Image.asset(
                            'assets/page-1/images/image-4-tNP.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          // searchSV1 (7:353)
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
                ),
              ),
            ),
            Positioned(
              // group25Ynw (7:354)
              left: 21*fem,
              top: 150*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  padding: EdgeInsets.fromLTRB(9*fem, 11.5*fem, 9*fem, 6.5*fem),
                  width: 318*fem,
                  height: 120*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(11*fem),
                    gradient: LinearGradient (
                      begin: Alignment(-1, 4.143),
                      end: Alignment(-1, -1),
                      colors: <Color>[Color(0xff5914ad), Color(0xd82085d0)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupfyybsCw (NE4tqKycax6pN5bmDvFYYB)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 16.5*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // autogroupk2ifm3R (NE4u25AiC9TsuLYMK7K2iF)
                                margin: EdgeInsets.fromLTRB(0*fem, 1.5*fem, 19*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(16*fem, 15*fem, 15*fem, 16*fem),
                                decoration: BoxDecoration (
                                  color: Color(0xffe3e9ee),
                                  borderRadius: BorderRadius.circular(35.5*fem),
                                ),
                                child: Center(
                                  // image5SQT (7:361)
                                  child: SizedBox(
                                    width: 40*fem,
                                    height: 40*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/image-5-mvj.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupkma39Zm (NE4u8V9h3UqSb8KyQ1KmA3)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      // viditjaincse3v3 (7:357)
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
                                      // btech2020YVR (7:358)
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
                                      // sem6E7M (7:359)
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
                                      // studentK8o (7:360)
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
                          // autogroupvnawdfH (NE4uQygDELec4sVaBjvnaw)
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // professionalprofilekzo (7:362)
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
                                // viewfullprofileeKV (7:363)
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
                ),
              ),
            ),
            Positioned(
              // quicklinksZBZ (7:364)
              left: 21*fem,
              top: 290.5*fem,
              child: Align(
                child: SizedBox(
                  width: 121*fem,
                  height: 25*fem,
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
              ),
            ),
            Positioned(
              // group27DG7 (7:365)
              left: 21*fem,
              top: 330*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // notificationsq2b (7:367)
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
                          // JB5 (7:368)
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
                          // group26Zsh (7:369)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-NvF.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group33SwV (7:416)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26eGs (7:420)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-cgj.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // notificationsvkB (7:418)
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
                                      // ooy (7:419)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group28w9V (7:375)
              left: 21*fem,
              top: 405*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // academicswoh (7:377)
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
                          // Cjd (7:378)
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
                          // group26t6f (7:379)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-aZZ.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group34AZy (7:426)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26a7u (7:430)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-i8j.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // academicsff9 (7:428)
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
                                      // ZVd (7:429)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group29HgX (7:383)
              left: 21*fem,
              top: 480*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // placement8BM (7:385)
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
                          // n11 (7:386)
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
                          // group26FfH (7:387)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-6yy.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group35j4f (7:434)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26KYf (7:438)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-oVV.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // placement1wH (7:436)
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
                                      // u15 (7:437)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group30ptj (7:391)
              left: 21*fem,
              top: 555*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // complaintraX (7:393)
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
                          // uoh (7:394)
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
                          // group26NhH (7:395)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-mBZ.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group36GXm (7:442)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26tp3 (7:446)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-4Gb.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // complaintbCf (7:444)
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
                                      // VJ3 (7:445)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group31bby (7:399)
              left: 21*fem,
              top: 630*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // departmentpjd (7:401)
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
                          // gG3 (7:402)
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
                          // group268Nw (7:403)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-E3D.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group37Q5Z (7:450)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26DHu (7:454)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-Q9Z.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // department7PH (7:452)
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
                                      // bJT (7:453)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group32WRR (7:407)
              left: 21*fem,
              top: 705*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // leave8xb (7:409)
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
                          // DDM (7:410)
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
                          // group26g6w (7:411)
                          left: 6*fem,
                          top: 9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-26-8kj.png',
                                width: 42*fem,
                                height: 42*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group38m8P (7:458)
                          left: 0*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                              width: 318*fem,
                              height: 60*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(6*fem),
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur (
                                  sigmaX: 2*fem,
                                  sigmaY: 2*fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group26AwD (7:462)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      width: 42*fem,
                                      height: 42*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-26-hs1.png',
                                        width: 42*fem,
                                        height: 42*fem,
                                      ),
                                    ),
                                    Container(
                                      // leaveGjM (7:460)
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
                                      // NGb (7:461)
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group32hJs (7:467)
              left: 21*fem,
              top: 780*fem,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                  width: 318*fem,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur (
                      sigmaX: 2*fem,
                      sigmaY: 2*fem,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26uvj (7:471)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-na7.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // healthcarecenterQsV (7:469)
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
                          // UcT (7:470)
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
              ),
            ),
            Positioned(
              // group40cCs (7:484)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 271*fem,
                height: 800*fem,
                decoration: BoxDecoration (
                  color: Color(0xfff3f3f3),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0*fem, 4*fem),
                      blurRadius: 2*fem,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // autogroups1r5Rg7 (NE4wKqf9w7WCnNfKvxS1R5)
                      left: 0*fem,
                      top: 0*fem,
                      child: Container(
                        width: 271*fem,
                        height: 121*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle9ifD (7:478)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 271*fem,
                                  height: 80*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      color: Color(0xff2085d0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group391PR (7:481)
                              left: 99.8420410156*fem,
                              top: 50*fem,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16.3*fem, 15*fem, 15.28*fem, 16*fem),
                                width: 72.33*fem,
                                height: 71*fem,
                                decoration: BoxDecoration (
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/page-1/images/ellipse-4.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  // image5G4T (7:483)
                                  child: SizedBox(
                                    width: 40.75*fem,
                                    height: 40*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/image-5.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // profilekVR (7:485)
                      left: 118*fem,
                      top: 123.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 36*fem,
                          height: 14*fem,
                          child: Text(
                            'Profile',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175*ffem/fem,
                              decoration: TextDecoration.underline,
                              color: Color(0xff3179fd),
                              decorationColor: Color(0xff3179fd),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // modulesD87 (7:486)
                      left: 21*fem,
                      top: 159*fem,
                      child: Align(
                        child: SizedBox(
                          width: 71*fem,
                          height: 20*fem,
                          child: Text(
                            'Modules',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // deanstudents4eX (7:519)
                      left: 21*fem,
                      top: 545*fem,
                      child: Align(
                        child: SizedBox(
                          width: 123*fem,
                          height: 20*fem,
                          child: Text(
                            'Dean Students',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // deanacademicsXo1 (7:520)
                      left: 21*fem,
                      top: 578*fem,
                      child: Align(
                        child: SizedBox(
                          width: 139*fem,
                          height: 20*fem,
                          child: Text(
                            'Dean Academics',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // directorofficePaK (7:524)
                      left: 21*fem,
                      top: 611*fem,
                      child: Align(
                        child: SizedBox(
                          width: 121*fem,
                          height: 20*fem,
                          child: Text(
                            'Director Office',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // officeofhodGe7 (7:525)
                      left: 21*fem,
                      top: 644*fem,
                      child: Align(
                        child: SizedBox(
                          width: 114*fem,
                          height: 20*fem,
                          child: Text(
                            'Office of HOD',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // officeofregistrarkJP (7:526)
                      left: 21*fem,
                      top: 677*fem,
                      child: Align(
                        child: SizedBox(
                          width: 150*fem,
                          height: 20*fem,
                          child: Text(
                            'Office of Registrar',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // financeandaccountsRvK (7:528)
                      left: 21*fem,
                      top: 710*fem,
                      child: Align(
                        child: SizedBox(
                          width: 184*fem,
                          height: 20*fem,
                          child: Text(
                            'Finance and Accounts',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // logoutVQP (7:531)
                      left: 196*fem,
                      top: 770*fem,
                      child: Align(
                        child: SizedBox(
                          width: 59*fem,
                          height: 20*fem,
                          child: Text(
                            'Logout',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // academicsmoduleMSb (7:487)
                      left: 43*fem,
                      top: 189.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 106*fem,
                          height: 14*fem,
                          child: Text(
                            'Academics Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // librarymoduleRST (7:495)
                      left: 43*fem,
                      top: 269.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 83*fem,
                          height: 14*fem,
                          child: Text(
                            'Library Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // feedsmoduleGxs (7:503)
                      left: 43*fem,
                      top: 349.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 78*fem,
                          height: 14*fem,
                          child: Text(
                            'Feeds Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // placementmoduleZBH (7:507)
                      left: 43*fem,
                      top: 429.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 106*fem,
                          height: 14*fem,
                          child: Text(
                            'Placement Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // filetracking36T (7:511)
                      left: 43*fem,
                      top: 509.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 73*fem,
                          height: 14*fem,
                          child: Text(
                            'File Tracking ',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // programmecurriculummoduleiCb (7:488)
                      left: 43*fem,
                      top: 209.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 187*fem,
                          height: 14*fem,
                          child: Text(
                            'Programme & Curriculum Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // awardsscholarshipmoduleBby (7:496)
                      left: 43*fem,
                      top: 289.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 163*fem,
                          height: 14*fem,
                          child: Text(
                            'Awards & Scholarship Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // healthcentermoduleEaF (7:504)
                      left: 43*fem,
                      top: 369.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 122*fem,
                          height: 14*fem,
                          child: Text(
                            'Health Center Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // purchasestoremoduleuRV (7:508)
                      left: 43*fem,
                      top: 449.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 139*fem,
                          height: 14*fem,
                          child: Text(
                            'Purchase & Store Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // gymkhanamoduleAcK (7:490)
                      left: 43*fem,
                      top: 229.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 106*fem,
                          height: 14*fem,
                          child: Text(
                            'Gymkhana Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // complaintmodule3RD (7:497)
                      left: 43*fem,
                      top: 309.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 103*fem,
                          height: 14*fem,
                          child: Text(
                            'Complaint Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // leavemodule9sZ (7:505)
                      left: 43*fem,
                      top: 389.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 77*fem,
                          height: 14*fem,
                          child: Text(
                            'Leave Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // visitorhostelmoduleD6j (7:509)
                      left: 43*fem,
                      top: 469.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 118*fem,
                          height: 14*fem,
                          child: Text(
                            'Visitor Hostel Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // iwdmodule4t3 (7:492)
                      left: 43*fem,
                      top: 249.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 70*fem,
                          height: 14*fem,
                          child: Text(
                            'IWD Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // centralmessmoduleLaf (7:498)
                      left: 43*fem,
                      top: 329.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 116*fem,
                          height: 14*fem,
                          child: Text(
                            'Central Mess Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // counsellingcellmoduleCsm (7:506)
                      left: 43*fem,
                      top: 409.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 134*fem,
                          height: 14*fem,
                          child: Text(
                            'Counselling Cell Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // hostelmoduleGMq (7:510)
                      left: 43*fem,
                      top: 489.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 80*fem,
                          height: 14*fem,
                          child: Text(
                            'Hostel Module',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
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
            ),
          ],
        ),
      ),
          );
  }
}