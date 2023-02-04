import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import 'package:fusion/Components/appBar.dart';

class LeaveStatus extends StatefulWidget {
  @override
  _LeaveStatusState createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: Drawer(),
      body: Container(
        // leavestatusCw4 (18:823)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 26*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // frame4Uta (18:824)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 9*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 54.5*fem,
                  child: Stack(
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(11*fem, 0*fem, 16*fem, 28*fem),
              width: double.infinity,
              height: 39*fem,
              decoration: BoxDecoration (
                color: Color(0xffff6e40),
                borderRadius: BorderRadius.circular(5*fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'Online Leave Status',
                    textAlign: TextAlign.left,
                    // style: SafeGoogleFont (
                    //   'Inter',
                    //   fontSize: 20*ffem,
                    //   fontWeight: FontWeight.w400,
                    //   height: 1.2125*ffem/fem,
                    //   color: Color(0xffffffff),
                    // ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroup2vtzNCa (GKo8FMWGfkL1AjvrwD2vtz)
              margin: EdgeInsets.fromLTRB(13*fem, 0*fem, 10*fem, 36*fem),
              width: double.infinity,
              height: 205*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle15cci (18:842)
                    left: 1*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 351*fem,
                        height: 202*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // statusVgW (18:1156)
                    left: 13*fem,
                    top: 133.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 61*fem,
                          height: 25*fem,
                          child: Text(
                            'Status',
                            textAlign: TextAlign.left,
                            // style: SafeGoogleFont (
                            //   'Inter',
                            //   fontSize: 20*ffem,
                            //   fontWeight: FontWeight.w400,
                            //   height: 1.2125*ffem/fem,
                            //   color: Color(0xff000000),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // 6gJ (18:1123)
                    left: 132*fem,
                    top: 17*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 13*fem,
                          height: 25*fem,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // Ndp (18:1124)
                    left: 220*fem,
                    top: 16*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 13*fem,
                          height: 25*fem,
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 307.5*fem,
                    top: 17*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 10*fem,
                          height: 25*fem,
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12*fem,
                    top: 169.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 62*fem,
                          height: 25*fem,
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.5*fem,
                    top: 17.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 51*fem,
                          height: 25*fem,
                          child: Text(
                            'S.No.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14.5*fem,
                    top: 55.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 98*fem,
                          height: 25*fem,
                          child: Text(
                            'Applied At',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 13*fem,
                    top: 95.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 65*fem,
                          height: 25*fem,
                          child: Text(
                            'Details',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 129*fem,
                    top: 2*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 203*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 2*fem,
                    top: 44*fem,
                    child: Align(
                      child: SizedBox(
                        width: 350*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 2*fem,
                    top: 82*fem,
                    child: Align(
                      child: SizedBox(
                        width: 350*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line7GKC (18:1111)
                    left: 1*fem,
                    top: 121*fem,
                    child: Align(
                      child: SizedBox(
                        width: 351*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line9A9g (18:1120)
                    left: 0*fem,
                    top: 156*fem,
                    child: Align(
                      child: SizedBox(
                        width: 352*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line10pzv (18:1122)
                    left: 208*fem,
                    top: 1*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 201*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 295*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 201*fem,
                        child: Container(
                          decoration: BoxDecoration (
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
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 17*fem, 28*fem),
              width: double.infinity,
              height: 39*fem,
              decoration: BoxDecoration (
                color: Color(0xffff6e40),
                borderRadius: BorderRadius.circular(5*fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'Offline Leave Status',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 13*fem, 0*fem),
              width: double.infinity,
              height: 205*fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 1*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 351*fem,
                        height: 202*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 13*fem,
                    top: 133.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 61*fem,
                          height: 25*fem,
                          child: Text(
                            'Status',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 132*fem,
                    top: 17*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 13*fem,
                          height: 25*fem,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220*fem,
                    top: 16*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 13*fem,
                          height: 25*fem,
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 307.5*fem,
                    top: 17*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 10*fem,
                          height: 25*fem,
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12*fem,
                    top: 169.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 62*fem,
                          height: 25*fem,
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.5*fem,
                    top: 17.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 51*fem,
                          height: 25*fem,
                          child: Text(
                            'S.No.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14.5*fem,
                    top: 55.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 98*fem,
                          height: 25*fem,
                          child: Text(
                            'Applied At',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 13*fem,
                    top: 95.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 65*fem,
                          height: 25*fem,
                          child: Text(
                            'Details',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 129*fem,
                    top: 2*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 203*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 2*fem,
                    top: 44*fem,
                    child: Align(
                      child: SizedBox(
                        width: 350*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 2*fem,
                    top: 82*fem,
                    child: Align(
                      child: SizedBox(
                        width: 350*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line15xW6 (18:1195)
                    left: 1*fem,
                    top: 121*fem,
                    child: Align(
                      child: SizedBox(
                        width: 351*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 156*fem,
                    child: Align(
                      child: SizedBox(
                        width: 352*fem,
                        height: 1*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 208*fem,
                    top: 1*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 201*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line18Ucr (18:1198)
                    left: 295*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 201*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
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
    );
  }
}