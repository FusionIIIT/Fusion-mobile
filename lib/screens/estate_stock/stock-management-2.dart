import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';

class SecondScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // stockmanagement2N6v (19:102)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // group9e4S (19:108)
              margin:
              EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 22.5 * fem),
              padding:
              EdgeInsets.fromLTRB(21 * fem, 63 * fem, 85 * fem, 12 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image36SE (19:110)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 49 * fem, 0 * fem),
                    width: 25 * fem,
                    height: 25 * fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementz1p (19:111)
                    'Estate Management',
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // messg9Y (19:112)
              margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
              child: Text(
                'Mess',
                style: SafeGoogleFont(
                  'Montserrat',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2175 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroup1tpxLjt (BRRpCgcxWPZ1SLVEXB1tpX)
              padding:
              EdgeInsets.fromLTRB(21 * fem, 12.5 * fem, 20 * fem, 29 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup8pzmpf4 (BRRozmo8vmaPbJK5WN8pZm)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 1 * fem, 20 * fem),
                    width: double.infinity,
                    height: 30 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group10W26 (19:117)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 67 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              9 * fem, 6.5 * fem, 8 * fem, 5.5 * fem),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // centralmess1wdC (19:114)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 85 * fem, 0 * fem),
                                child: Text(
                                  'Central Mess - 1',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // vpS6 (19:115)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'v',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group134LS (19:128)
                          width: 60 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xd82085d0),
                            borderRadius: BorderRadius.circular(6 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'ADD',
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 11 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group14jhU (19:131)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 1 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 7 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1, -0),
                        end: Alignment(-1, -0),
                        colors: <Color>[Color(0xffefefef), Color(0xffffffff)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupatxw7xv (BRRpXFvLnikEkQHVPWatxw)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // chairsDm4 (19:118)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 220 * fem, 0 * fem),
                                child: Text(
                                  'Chairs',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Text(
                                // x2506pr (19:119)
                                'x250',
                                style: SafeGoogleFont(
                                  'Montserrat',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2175 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated200123coC (19:121)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 20/01/23',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupjr956iN (BRRpbqd3PxanP7GwASJr95)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 2 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12nr6 (19:125)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group111Tx (19:124)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
                  Container(
                    // group15eWv (19:143)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 8 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                          // autogroupzugfSBt (BRRpsqAPt4hrJNmaQuZUgF)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // tablesweS (19:145)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 229 * fem, 2 * fem),
                                child: Text(
                                  'Tables',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x50R3p (19:146)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'x50',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated170822J7c (19:147)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 17/08/22',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroup3qfuxxr (BRRpx5YKMU5fZRyiVf3qFu)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group124kz (19:151)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group11WN6 (19:148)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
                  Container(
                    // group168uG (19:155)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 8 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                          // autogroupsrru9ZU (BRRqEzDoxcyF1EsSu7SrRu)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // platesF6i (19:157)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 220 * fem, 2 * fem),
                                child: Text(
                                  'Plates',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750t9g (19:158)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated280922bpn (19:159)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupqqcxofx (BRRqKuFHhhGX1beCNDQQCX)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12qce (19:163)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group11ipr (19:160)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
                  Container(
                    // group17Zaa (19:177)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 8 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                          // autogroupwe6sJAn (BRRqayeW4kd5QKjkThWe6s)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // drinkingglasscBU (19:179)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 134 * fem, 2 * fem),
                                child: Text(
                                  'Drinking Glass',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750gh8 (19:180)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated280922myU (19:181)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupsbxurV8 (BRRqf9CEFhPD4y14cuSbXu)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12Mwg (19:185)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group111FY (19:182)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
                  Container(
                    // group18TNS (19:188)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 8 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                          // autogroupzshd2pr (BRRqv8mFLJ85sH9nnqzSHd)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // waterfilterjUN (19:190)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 186 * fem, 2 * fem),
                                child: Text(
                                  'Water Filter',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x2DPY (19:191)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'x2',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated171222hpW (19:192)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 17/12/22',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupvpifyn2 (BRRqzJJyXEtDXvR6x3vPif)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12te6 (19:196)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group11KjQ (19:193)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
                  Container(
                    // group19Zdk (19:199)
                    margin:
                    EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        9 * fem, 7.5 * fem, 8 * fem, 10 * fem),
                    width: 348 * fem,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                          // autogroupy1zwVfp (BRRrGi1JRe5hRFdspEy1zw)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // spoonsoAi (19:201)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 207 * fem, 2 * fem),
                                child: Text(
                                  'Spoons',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // x750tT4 (19:202)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'x750',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // lastupdated280922yjQ (19:203)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 9.5 * fem),
                          child: Text(
                            'Last Updated: 28/09/22',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogrouptyryGCi (BRRrLsZ2caqq5tuByStyRy)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          width: double.infinity,
                          height: 15 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group12ZSi (19:207)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 178 * fem, 0 * fem),
                                width: 102 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group11beJ (19:204)
                                width: 50 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff20d0ba),
                                  borderRadius: BorderRadius.circular(3 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: SafeGoogleFont(
                                      'Montserrat',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2175 * ffem / fem,
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
          ],
        ),
      ),
    );
  }
}