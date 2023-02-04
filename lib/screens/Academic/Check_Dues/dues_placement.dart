import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class PlaccementDues extends StatefulWidget {
  @override
  _PlaccementDuesState createState()=> _PlaccementDuesState();
}

class _PlaccementDuesState extends State<PlaccementDues> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // placementcelldue1cE (18:1294)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 268*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(14*fem, 20*fem, 13*fem, 31*fem),
              width: double.infinity,
              height: 39*fem,
              decoration: BoxDecoration (
                color: Color(0xffff6e40),
                borderRadius: BorderRadius.circular(5*fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'Placement Cell Due History',
                    textAlign: TextAlign.center,

                  ),
                ),
              ),
            ),
            Container(

              margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 10*fem, 0*fem),
              width: double.infinity,
              height: 253*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle15CtJ (18:1366)
                    left: 1*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 351*fem,
                        height: 253*fem,
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

                    left: 8*fem,
                    top: 122.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 108*fem,
                          height: 25*fem,
                          child: Text(
                            'Description',
                            textAlign: TextAlign.left,

                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8*fem,
                    top: 165.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 130*fem,
                          height: 25*fem,
                          child: Text(
                            'Rebate Count',
                            textAlign: TextAlign.left,

                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // totalbillmTY (18:1369)
                    left: 8*fem,
                    top: 211.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 80*fem,
                          height: 25*fem,
                          child: Text(
                            'Total Bill',
                            textAlign: TextAlign.left,

                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // monthov2 (18:1370)
                    left: 8*fem,
                    top: 17.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 61*fem,
                          height: 25*fem,
                          child: Text(
                            'Month',
                            textAlign: TextAlign.left,

                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // amountfSS (18:1371)
                    left: 8*fem,
                    top: 86.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 74*fem,
                          height: 25*fem,
                          child: Text(
                            'Amount',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line4VwG (18:1372)
                    left: 151*fem,
                    top: 1*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 252*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line5nQa (18:1373)
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
                    // line6Gae (18:1374)
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
                    // line7kVp (18:1375)
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
                    // line9f6z (18:1376)
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
                    // line12ZTG (18:1377)
                    left: 1*fem,
                    top: 202*fem,
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
                    // line103NS (18:1378)
                    left: 208*fem,
                    top: 1*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 252*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // line11iDg (18:1379)
                    left: 263*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 1*fem,
                        height: 253*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // yearRNz (18:1385)
                    left: 8*fem,
                    top: 53.5*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 43*fem,
                          height: 25*fem,
                          child: Text(
                            'Year',
                            textAlign: TextAlign.left,
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