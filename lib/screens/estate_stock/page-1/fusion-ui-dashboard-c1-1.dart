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
        // fusionuidashboardc11Nb5 (5:4)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group93x7 (5:10)
              padding: EdgeInsets.fromLTRB(21*fem, 30.5*fem, 123*fem, 24.5*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // image3LAX (5:12)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 78.92*fem, 0*fem),
                    width: 23.08*fem,
                    height: 17*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-jko.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // dashboardDk7 (5:13)
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
              // autogroup9qxfiwm (NE4nWWWpr2gTMtauZe9qxf)
              padding: EdgeInsets.fromLTRB(21*fem, 23*fem, 0*fem, 35*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupbphmQJo (NE4mwrnZc9Wrn431gMBPhM)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 22.5*fem),
                    padding: EdgeInsets.fromLTRB(12*fem, 7*fem, 215*fem, 7*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // image4rgb (7:36)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                          width: 20*fem,
                          height: 20*fem,
                          child: Image.asset(
                            'assets/page-1/images/image-4-D1V.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          // searchm2s (7:37)
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
                    // autogrouprhnjs5u (NE4n7SLwEvGN1Xk2qvRHnj)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 13.5*fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // notificationsyPq (5:14)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                          child: Text(
                            'Notifications',
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
                          // newssEK (5:15)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                          child: Text(
                            'News',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175*ffem/fem,
                              color: Color(0xffbebebe),
                            ),
                          ),
                        ),
                        Text(
                          // announcementsxFm (5:16)
                          'Announcements',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2175*ffem/fem,
                            color: Color(0xffbebebe),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupoawwsNj (NE4nHw3SzjnNmYr9AUoaWw)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 26.5*fem),
                    width: 318*fem,
                    height: 65*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Center(
                      child: Text(
                        'No new notifications',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 13*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2175*ffem/fem,
                          color: Color(0xffbebebe),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // quicklinksUdR (7:24)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 214*fem, 13.5*fem),
                    child: Text(
                      'Quick Links',
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
                    // group271Ws (7:291)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 15*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26epj (7:295)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // profilevnF (7:293)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 164*fem, 2*fem),
                          child: Text(
                            'Profile',
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
                          // QxK (7:294)
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
                  Container(
                    // group28wBZ (7:301)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 15*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26mwH (7:305)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-Lbu.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // academics5BH (7:303)
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
                          // y1m (7:304)
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
                  Container(
                    // group29W1h (7:309)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 15*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26a1Z (7:313)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-62P.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // placementrjm (7:311)
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
                          // YsV (7:312)
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
                  Container(
                    // group30fBR (7:317)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 15*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26XDd (7:321)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-m2s.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // complaintcks (7:319)
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
                          // ujy (7:320)
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
                  Container(
                    // group31eBm (7:325)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 15*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26udV (7:329)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-t1Z.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // departmentCMh (7:327)
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
                          // Uq1 (7:328)
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
                  Container(
                    // group32osH (7:333)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(6*fem, 9*fem, 16*fem, 9*fem),
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group26scF (7:337)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                          width: 42*fem,
                          height: 42*fem,
                          child: Image.asset(
                            'assets/page-1/images/group-26-pfV.png',
                            width: 42*fem,
                            height: 42*fem,
                          ),
                        ),
                        Container(
                          // leaveZV5 (7:335)
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
                          // emR (7:336)
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