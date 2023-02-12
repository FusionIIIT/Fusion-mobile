import 'package:flutter/material.dart';
import '../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // fusionuiconcept1login3ge (5:90)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupmuafRai (BRRkx2YJm25pZERkXkmuAf)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 45 * fem),
              width: double.infinity,
              height: 334 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // ellipse1TnJ (8:5)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 412 * fem,
                        height: 291 * fem,
                        child: Image.asset(
                          'assets/page-1/images/ellipse-1.png',
                          width: 412 * fem,
                          height: 291 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse3Jnv (8:9)
                    left: 135 * fem,
                    top: 65 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 124 * fem,
                        height: 124 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(62 * fem),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse29oY (8:6)
                    left: 140 * fem,
                    top: 70 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 114 * fem,
                        height: 114 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(57 * fem),
                            color: Color(0xffe3e9ee),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // image2pPt (8:8)
                    left: 157 * fem,
                    top: 87 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 80 * fem,
                        height: 80 * fem,
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
              // fusioniiitFVC (5:91)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 2 * fem, 0 * fem),
              child: Text(
                'Fusion IIIT',
                style: SafeGoogleFont(
                  'Montserrat',
                  fontSize: 36 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2175 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogrouphakorUz (BRRmVBK4teB8TdxmoFhAko)
              padding:
                  EdgeInsets.fromLTRB(21 * fem, 56 * fem, 21 * fem, 234 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // autogroupta1uK7g (BRRmAGguUUXAmvPDEjta1u)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 20 * fem),
                    padding: EdgeInsets.fromLTRB(
                        13 * fem, 22 * fem, 13 * fem, 21 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffe3e9ee),
                      borderRadius: BorderRadius.circular(16 * fem),
                    ),
                    child: Text(
                      '20bcs243@iiitdmj.ac.in',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupcwgfWT4 (BRRmFghYvJWYLkpvF7CWgF)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                    padding: EdgeInsets.fromLTRB(
                        13 * fem, 18 * fem, 8 * fem, 18 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffe3e9ee),
                      borderRadius: BorderRadius.circular(16 * fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // passwordjqc (5:95)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 1 * fem, 230 * fem, 0 * fem),
                          child: Text(
                            'password',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // image1h3g (5:100)
                          width: 25 * fem,
                          height: 26 * fem,
                          child: Image.asset(
                            'assets/page-1/images/image-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // forgotpasswordBzS (8:2)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 41 * fem),
                    child: Text(
                      'Forgot Password?',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2175 * ffem / fem,
                        decoration: TextDecoration.underline,
                        color: Color(0xff2085d0),
                        decorationColor: Color(0xff2085d0),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupsqix3Fx (BRRmNS1JuULqQCPr2BSqiX)
                    width: double.infinity,
                    height: 62 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff2085d0),
                      borderRadius: BorderRadius.circular(16 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
