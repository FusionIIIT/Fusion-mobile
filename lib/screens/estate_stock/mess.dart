import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';

class MessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // fusionuiestatec22sZV (4:2)
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // group96SF (4:3)
            padding:  EdgeInsets.fromLTRB(19.38*fem, 50.4*fem, 62.31*fem, 4.6*fem),
            width:  double.infinity,
            height:  80*fem,
            decoration:  BoxDecoration (
              color:  Color(0xd82085d0),
            ),
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.end,
              children:  [
                Container(
                  // image3jEK (4:5)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 45.23*fem, 5*fem),
                  width:  23.08*fem,
                  height:  20*fem,
                  child:
                  Image.asset(
                    'assets/page-1/images/image-3.png'
                    , fit: BoxFit.cover,
                  ),
                ),
                Text(
                  // estatemanagementP3y (4:6)
                  'Estate Management',
                  style:  SafeGoogleFont (
                    'Montserrat',
                    fontSize:  20*ffem,
                    fontWeight:  FontWeight.w600,
                    height:  1.2175*ffem/fem,
                    color:  Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // autogroupkxuuTZd (4gqX8c2S7Ceqtxt2irKXuu)
            padding:  EdgeInsets.fromLTRB(20*fem, 34.5*fem, 18*fem, 0*fem),
            width:  double.infinity,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // autogroupils79BZ (4gqWUnn7GsLvXXiubpiLS7)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 269*fem, 11.39*fem),
                  width:  53*fem,
                  height:  25*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        // mess1zT (4:7)
                        left:  0*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  53*fem,
                            height:  25*fem,
                            child:
                            Text(
                              'Mess',
                              style:  SafeGoogleFont (
                                'Montserrat',
                                fontSize:  20*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.2175*ffem/fem,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // messFto (4:8)
                        left:  0*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  53*fem,
                            height:  25*fem,
                            child:
                            Text(
                              'Mess',
                              style:  SafeGoogleFont (
                                'Montserrat',
                                fontSize:  20*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.2175*ffem/fem,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // messuCf (4:9)
                        left:  0*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  53*fem,
                            height:  25*fem,
                            child:
                            Text(
                              'Mess',
                              style:  SafeGoogleFont (
                                'Montserrat',
                                fontSize:  20*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.2175*ffem/fem,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupwndhZHD (4gqWk2qiCqvr75i7YPwNdh)
                  margin:  EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 19*fem),
                  width:  double.infinity,
                  height:  28.11*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // group10Eu9 (4:10)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                        padding:  EdgeInsets.fromLTRB(8.29*fem, 5.06*fem, 6.74*fem, 5.05*fem),
                        height:  double.infinity,
                        decoration:  BoxDecoration (
                          color:  Color(0xffd9d9d9),
                          borderRadius:  BorderRadius.circular(8*fem),
                        ),
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // centralmess1gFM (4:12)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 69.58*fem, 0*fem),
                              child:
                              Text(
                                'Central Mess - 1',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  14*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // vazw (4:13)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.95*fem),
                              child:
                              Text(
                                'v',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  12*ffem,
                                  fontWeight:  FontWeight.w900,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group523dd (4:14)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0.11*fem, 0*fem, 0*fem),
                        width:  97*fem,
                        height:  double.infinity,
                        decoration:  BoxDecoration (
                          borderRadius:  BorderRadius.circular(6*fem),
                        ),
                        child:
                        Container(
                          // group13k2F (4:15)
                          width:  double.infinity,
                          height:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xd82085d0),
                            borderRadius:  BorderRadius.circular(6*fem),
                          ),
                          child:
                          Center(
                            child:
                            Text(
                              'DETAILED VIEW',
                              style:  SafeGoogleFont (
                                'Montserrat',
                                fontSize:  10*ffem,
                                fontWeight:  FontWeight.w600,
                                height:  1.2175*ffem/fem,
                                color:  Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group11C99 (4:30)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.77*fem, 11.91*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.08*fem, 4.88*fem),
                  width:  321.23*fem,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.15*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // chairsqbR (4:33)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 192.69*fem, 1.87*fem),
                              child:
                              Text(
                                'Chairs',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x250XDM (4:34)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x250',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated170822bU7 (4:32)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11.05*fem),
                        child:
                        Text(
                          'Last Updated: 17/08/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroup4jgx4cb (4gqYRZsXWCMDtXdfaZ4jgX)
                        margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.end,
                          children:  [
                            Container(
                              // group12Afd (4:38)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 163.54*fem, 1.11*fem),
                              width:  94.15*fem,
                              height:  14.44*fem,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7EfV (4:39)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsVrK (4:40)
                                    left:  15.6923217773*fem,
                                    top:  0.4369506836*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group41jEs (4:35)
                              width:  46.15*fem,
                              height:  14.44*fem,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle72jm (4:36)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // editHfh (4:37)
                                    left:  12*fem,
                                    top:  0.4368896484*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
                  // group15jGo (4:18)
                  margin:  EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.34*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 7.38*fem, 8.98*fem),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupxamhhN3 (4gqXhb5UUvHArTDEJKXamh)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1.15*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // tablesoAB (4:20)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 202.38*fem, 1.87*fem),
                              child:
                              Text(
                                'Tables',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x505dV (4:21)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x50',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated170822xhH (4:22)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.93*fem),
                        child:
                        Text(
                          'Last Updated: 17/08/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroup8jhhRas (4gqXpqNQAqoZUNT7cf8Jhh)
                        width:  double.infinity,
                        height:  14.55*fem,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // group12XP1 (4:26)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0.12*fem, 165.23*fem, 0*fem),
                              width:  94.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7bdm (4:27)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsr3u (4:28)
                                    left:  15.6923217773*fem,
                                    top:  0.4369506836*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group114vf (4:23)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.12*fem),
                              width:  46.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7Mes (4:24)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // editQd9 (4:25)
                                    left:  12.0000076294*fem,
                                    top:  0.4369506836*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
                  // group16TbR (4:41)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.77*fem, 12.01*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.23*fem, 8.98*fem),
                  width:  321.23*fem,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupwgvh3Zd (4gqYqZBZEMXpmRsdTFwgVH)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // plates9cf (4:43)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 193.69*fem, 1.87*fem),
                              child:
                              Text(
                                'Plates',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x750DMd (4:44)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x750',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated2809226gK (4:45)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                        child:
                        Text(
                          'Last Updated: 28/09/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupjopoz11 (4gqYxU9hnSbV1hLD5RJopo)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.08*fem, 0*fem),
                        width:  double.infinity,
                        height:  14.44*fem,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // group12t6P (4:49)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                              width:  94.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7Apb (4:50)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsSXD (4:51)
                                    left:  15.6923217773*fem,
                                    top:  0.4368133545*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group11VEb (4:46)
                              width:  46.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7Ceo (4:47)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // editUcK (4:48)
                                    left:  12.0000076294*fem,
                                    top:  0.4368133545*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
                  // group17X4o (4:52)
                  margin:  EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.18*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupgxbdJDy (4gqZMseNXPUJjhxPVKGxbD)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // drinkingglassC4T (4:54)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 107.38*fem, 1.87*fem),
                              child:
                              Text(
                                'Drinking Glass',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x750Gq1 (4:55)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x750',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated280922MLf (4:56)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                        child:
                        Text(
                          'Last Updated: 28/09/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupcv5m2So (4gqZUsSiMw9eaPMo32CV5M)
                        width:  double.infinity,
                        height:  14.44*fem,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // group12wJs (4:60)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                              width:  94.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7beK (4:61)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsqoZ (4:62)
                                    left:  15.6923217773*fem,
                                    top:  0.4370193481*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group11W91 (4:57)
                              width:  46.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7D3R (4:58)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // edit55d (4:59)
                                    left:  12.0000076294*fem,
                                    top:  0.4370193481*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
                  // group18iuH (4:63)
                  margin:  EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 12.18*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupsra7JsV (4gqZrSf6rnVTFKBo8wsra7)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // waterfilterQvX (4:65)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 159.38*fem, 1.87*fem),
                              child:
                              Text(
                                'Water Filter',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x2JW7 (4:66)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x2',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated171222zdq (4:67)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                        child:
                        Text(
                          'Last Updated: 17/12/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupszax59V (4gqZxwUGzaUhXWvF9PSzAX)
                        width:  double.infinity,
                        height:  14.44*fem,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // group12o5V (4:71)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                              width:  94.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7HFZ (4:72)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsYxB (4:73)
                                    left:  15.6923217773*fem,
                                    top:  0.4368801117*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group11ot7 (4:68)
                              width:  46.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7ikB (4:69)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // editzhh (4:70)
                                    left:  12.0000076294*fem,
                                    top:  0.4368801117*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
                  // group19TLP (4:74)
                  margin:  EdgeInsets.fromLTRB(0.31*fem, 0*fem, 0.46*fem, 11.49*fem),
                  padding:  EdgeInsets.fromLTRB(8.31*fem, 5.99*fem, 8.31*fem, 8.98*fem),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    gradient:  LinearGradient (
                      begin:  Alignment(1, -0),
                      end:  Alignment(-1, -0),
                      colors:  <Color>[Color(0xffefefef), Color(0x00d9d9d9)],
                      stops:  <double>[0, 1],
                    ),
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupukz1e9y (4gqaM1fqCBWbkvRCnaUkZ1)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.23*fem, 5.98*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // spoonswPy (4:76)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 180.38*fem, 1.87*fem),
                              child:
                              Text(
                                'Spoons',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // x7502wD (4:77)
                              margin:  EdgeInsets.fromLTRB(0*fem, 1.87*fem, 0*fem, 0*fem),
                              child:
                              Text(
                                'x750',
                                style:  SafeGoogleFont (
                                  'Montserrat',
                                  fontSize:  20*ffem,
                                  fontWeight:  FontWeight.w400,
                                  height:  1.2175*ffem/fem,
                                  color:  Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // lastupdated2809228DZ (4:78)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.05*fem),
                        child:
                        Text(
                          'Last Updated: 28/09/22',
                          style:  SafeGoogleFont (
                            'Montserrat',
                            fontSize:  11*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.2175*ffem/fem,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupkfvsCUK (4gqaUWTLjUt3A5VZsYkfvs)
                        width:  double.infinity,
                        height:  14.44*fem,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // group12iBm (4:82)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164.31*fem, 0*fem),
                              width:  94.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7QKV (4:83)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  94.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // viewdetailsfFR (4:84)
                                    left:  15.6923217773*fem,
                                    top:  0.4367370605*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  68*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'View Details',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group11A5h (4:79)
                              width:  46.15*fem,
                              height:  double.infinity,
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(3*fem),
                              ),
                              child:
                              Stack(
                                children:  [
                                  Positioned(
                                    // rectangle7g43 (4:80)
                                    left:  0*fem,
                                    top:  0*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  46.15*fem,
                                        height:  14.05*fem,
                                        child:
                                        Container(
                                          decoration:  BoxDecoration (
                                            borderRadius:  BorderRadius.circular(3*fem),
                                            color:  Color(0xff20d0ba),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // editx1Z (4:81)
                                    left:  12.0000076294*fem,
                                    top:  0.4367370605*fem,
                                    child:
                                    Align(
                                      child:
                                      SizedBox(
                                        width:  23*fem,
                                        height:  14*fem,
                                        child:
                                        Text(
                                          'Edit',
                                          style:  SafeGoogleFont (
                                            'Montserrat',
                                            fontSize:  11*ffem,
                                            fontWeight:  FontWeight.w400,
                                            height:  1.2175*ffem/fem,
                                            color:  Color(0xffffffff),
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
              ],
            ),
          ),
        ],
      ),
    )
    ;
  }
}