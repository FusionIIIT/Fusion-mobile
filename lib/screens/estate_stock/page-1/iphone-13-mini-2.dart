import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone13mini2niF (102:53)
        width: double.infinity,
        height: 812*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(50*fem),
        ),
        child: Container(
          // stockmanagementhomesUo (102:54)
          width: 390*fem,
          height: 844*fem,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // group9gBM (102:60)
                padding: EdgeInsets.fromLTRB(21*fem, 35*fem, 32*fem, 12*fem),
                width: double.infinity,
                height: 100*fem,
                decoration: BoxDecoration (
                  color: Color(0xd82085d0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogrouppdgfavw (Eq3n2GFjyha4sAg9prPdgf)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // AeF (102:66)
                            margin: EdgeInsets.fromLTRB(13*fem, 0*fem, 0*fem, 6*fem),
                            child: Text(
                              '1:11',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // image39m5 (102:62)
                            width: 25*fem,
                            height: 25*fem,
                            child: Image.asset(
                              'assets/page-1/images/image-3.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupqy2wrfV (Eq3nBRf9CBFA8af3NhqY2w)
                      width: 228*fem,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            // estatemanagementMs9 (102:63)
                            left: 0*fem,
                            top: 28*fem,
                            child: Align(
                              child: SizedBox(
                                width: 210*fem,
                                height: 25*fem,
                                child: Text(
                                  'Estate Management',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // signali5R (102:65)
                            left: 205*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 23*fem,
                                height: 29*fem,
                                child: Image.asset(
                                  'assets/page-1/images/signal.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // fullbatteryATD (102:64)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                      width: 35*fem,
                      height: 25*fem,
                      child: Image.asset(
                        'assets/page-1/images/full-battery.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupfvtjET5 (Eq3mYMtZuyUP6s1MZaFvtj)
                padding: EdgeInsets.fromLTRB(21*fem, 31*fem, 25*fem, 74*fem),
                width: double.infinity,
                height: 744*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupix5uhrT (Eq3mEY4wBmpJ8WiY18iX5u)
                      margin: EdgeInsets.fromLTRB(45*fem, 0*fem, 38*fem, 40*fem),
                      width: double.infinity,
                      height: 102*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // yourexecutionisconfirmedBmd (102:58)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 208*fem,
                                height: 29*fem,
                                child: Text(
                                  'Transaction Failure',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 24*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // succesfultransactionmjq (102:59)
                            left: 2*fem,
                            top: 17*fem,
                            child: Align(
                              child: SizedBox(
                                width: 259*fem,
                                height: 85*fem,
                                child: Text(
                                  '\nDue to some issue, we can’t execute the transaction. Please, retry again.',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725*ffem/fem,
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
                      // pngtreepaymentfailurevectorico (102:73)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 101*fem),
                      width: 344*fem,
                      height: 345*fem,
                      child: Image.asset(
                        'assets/page-1/images/pngtreepayment-failure-vector-icon3783064-1-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // autogroupfdudQgK (Eq3mNHM2aT2nJudNrjfdud)
                      margin: EdgeInsets.fromLTRB(80*fem, 0*fem, 77*fem, 0*fem),
                      width: double.infinity,
                      height: 51*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff95d0a9),
                        borderRadius: BorderRadius.circular(10*fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Home',
                          style: SafeGoogleFont (
                            'Roboto',
                            fontSize: 30*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.1725*ffem/fem,
                            color: Color(0xfffcfcfc),
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
      ),
          );
  }
}