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
        // fusionuiestatec23YjV (17:173)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group9EsD (17:174)
              padding: EdgeInsets.fromLTRB(19.38*fem, 49.4*fem, 126*fem, 5.6*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xd82085d0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // image3vV9 (17:176)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 84.54*fem, 4*fem),
                    width: 23.08*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3-dT9.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // additemsc75 (17:177)
                    'Add Items',
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
              // autogrouprrph7Jj (NE5Fnj4TQyMxAP8aBdRRPH)
              padding: EdgeInsets.fromLTRB(21*fem, 35*fem, 20*fem, 124*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group43QHq (58:75)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 17*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // currentlyinVKH (58:76)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Currently In:',
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
                          // group10mnb (58:77)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 7.07*fem, 12*fem, 6.93*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // selectalocationEw5 (58:79)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 173.82*fem, 0*fem),
                                child: Text(
                                  'Select a location',
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
                                // vX9V (58:80)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.07*fem),
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
                    // group44Qyy (58:81)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 17*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // itemnamehy5 (58:82)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Item Name:',
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
                          // group10zSP (58:83)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 7.07*fem, 10.18*fem, 6.93*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Text(
                            'Enter name',
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
                    // group45pRR (58:87)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 17*fem),
                    width: 318*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // dateKsy (58:88)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Date:',
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
                          // group10RAK (58:89)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 7.5*fem, 6.13*fem, 6.5*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // JV1 (58:91)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 192.94*fem, 0*fem),
                                child: Text(
                                  '20 - 03 - 2023',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // frameoAs (58:92)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                width: 15.75*fem,
                                height: 15.75*fem,
                                child: Image.asset(
                                  'assets/page-1/images/frame-Hgf.png',
                                  width: 15.75*fem,
                                  height: 15.75*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group46V3h (58:95)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 17*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // quantityaaw (58:96)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Quantity:',
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
                          // group104m1 (58:97)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 5.06*fem, 10.18*fem, 8.94*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Text(
                            'Enter quantity',
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
                    // group47Wd1 (58:100)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 52*fem),
                    width: 318*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // priceD1d (58:101)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child: Text(
                            'Price:',
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
                          // group10uf9 (58:102)
                          padding: EdgeInsets.fromLTRB(10.18*fem, 5.06*fem, 10.18*fem, 8.94*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Text(
                            'Enter price',
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
                    // group11mST (58:109)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 24*fem),
                    width: 318*fem,
                    height: 74*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Container(
                      // group505T9 (58:110)
                      padding: EdgeInsets.fromLTRB(10*fem, 13*fem, 11*fem, 13*fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0x0fff0000),
                        borderRadius: BorderRadius.circular(8*fem),
                      ),
                      child: Center(
                        // noteitemsonceaddedcannotbemodi (58:112)
                        child: Center(
                          child: SizedBox(
                            child: Container(
                              constraints: BoxConstraints (
                                maxWidth: 297*fem,
                              ),
                              child: Text(
                                'NOTE: Items once added cannot be modified\nor removed. Make sure the entered details\nare accurate',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 13*ffem,
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
                  ),
                  Container(
                    // group50mUP (58:113)
                    margin: EdgeInsets.fromLTRB(206*fem, 0*fem, 0*fem, 0*fem),
                    width: 113*fem,
                    height: 43*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff3179fd),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 16*ffem,
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
          );
  }
}