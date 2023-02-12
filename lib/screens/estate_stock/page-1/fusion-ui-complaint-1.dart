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
        // fusionuicomplaint1NmH (7:532)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group94e7 (12:2)
              padding: EdgeInsets.fromLTRB(21*fem, 30.5*fem, 126*fem, 24.5*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // image3LrX (12:4)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 81.92*fem, 0*fem),
                    width: 23.08*fem,
                    height: 17*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-UCb.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // complaintS8s (12:5)
                    'Complaint',
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
              // autogroup6bgwLEF (NE4xzi3Qxo17pX2Gam6BGw)
              padding: EdgeInsets.fromLTRB(21*fem, 24*fem, 21*fem, 66*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupajduDJ3 (NE4x6EYrBhR42RViyyAjdu)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
                    width: double.infinity,
                    height: 40*fem,
                    child: Container(
                      // group42viF (12:28)
                      padding: EdgeInsets.fromLTRB(5*fem, 6*fem, 8*fem, 6*fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xfff2f2f2),
                        borderRadius: BorderRadius.circular(8*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupwa8jQNX (NE4xMeGqgbELnoNamdWa8j)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 0*fem),
                            width: 48*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0xffe44b31),
                              borderRadius: BorderRadius.circular(4*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Add',
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // historyRYX (12:21)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                            child: Text(
                              'History',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // feedbackWZy (12:20)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                            child: Text(
                              'Feedback',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            // notificationso3H (12:27)
                            'Notifications',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // group436o5 (12:29)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // complainttypeoSb (12:7)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Complaint Type:',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Gqy (12:9)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 5.06*fem, 12*fem, 4.94*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // selectacomplainttypeMcX (12:11)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 123.82*fem, 0*fem),
                                child: Text(
                                  'Select a complaint type',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffc8c8c8),
                                  ),
                                ),
                              ),
                              Container(
                                // vdK9 (12:12)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.06*fem),
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
                      ],
                    ),
                  ),
                  Container(
                    // group44i5h (12:30)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // locationosq (12:31)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Location:',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10uR5 (12:32)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 5.06*fem, 12*fem, 4.94*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // selectlocationzhR (12:34)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 181.82*fem, 0*fem),
                                child: Text(
                                  'Select Location',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffc8c8c8),
                                  ),
                                ),
                              ),
                              Container(
                                // vVPH (12:35)
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
                      ],
                    ),
                  ),
                  Container(
                    // group45PUf (12:42)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14.9*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // specificlocationuC7 (12:43)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Specific Location:',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10n11 (12:44)
                          padding: EdgeInsets.fromLTRB(12.95*fem, 5.06*fem, 12.95*fem, 5.05*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Text(
                            'Room number, block, floor etc',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.2175*ffem/fem,
                              color: Color(0xffc8c8c8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // detailsdGX (12:49)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 249*fem, 6*fem),
                    child: Text(
                      'Details:',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 18*ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // group10WbD (12:50)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21.7*fem),
                    padding: EdgeInsets.fromLTRB(12.72*fem, 5.5*fem, 12.72*fem, 5.5*fem),
                    width: double.infinity,
                    height: 84.3*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Text(
                      'What is your complaint?',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.2175*ffem/fem,
                        color: Color(0xffc8c8c8),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupkue7Jmy (NE4xXDqDKMyr2H5bwCkUE7)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.5*fem),
                    width: double.infinity,
                    height: 28*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // attachfilesCsM (12:55)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 93*fem, 0*fem),
                          child: Text(
                            'Attach files:',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group48hJK (12:61)
                          width: 115*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffe44b31),
                            borderRadius: BorderRadius.circular(4*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Choose a File',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
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
                    // autogroup8kxkk1h (NE4xhiXj5BVrnJBiFm8kxK)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 46*fem),
                    padding: EdgeInsets.fromLTRB(0*fem, 6.5*fem, 0*fem, 0*fem),
                    width: 310*fem,
                    height: 34.5*fem,
                    child: Container(
                      // group492zo (12:64)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 127*fem, 0*fem),
                      width: 183*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(8*fem),
                      ),
                      child: Center(
                        child: Text(
                          'No file chosen',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 13*ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.2175*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group11Uro (12:71)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 22*fem),
                    width: double.infinity,
                    height: 48*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Container(
                      // group50C27 (12:74)
                      padding: EdgeInsets.fromLTRB(13*fem, 6.5*fem, 13*fem, 6.5*fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(8*fem),
                      ),
                      child: Center(
                        // complaintwillberegisteredwithy (12:73)
                        child: SizedBox(
                          child: Container(
                            constraints: BoxConstraints (
                              maxWidth: 272*fem,
                            ),
                            child: Text(
                              'Complaint will be registered with your user id: 20BCS243',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group50jAT (12:75)
                    margin: EdgeInsets.fromLTRB(221*fem, 0*fem, 0*fem, 0*fem),
                    width: 97*fem,
                    height: 28*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff3179fd),
                      borderRadius: BorderRadius.circular(4*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 13*ffem,
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
          ],
        ),
      ),
          );
  }
}