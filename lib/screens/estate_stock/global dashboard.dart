import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'stock-management-2.dart';
import '../utils.dart';
import 'success.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: fem,
      child: Container(
        // stockmanagementhomemiz (8:10)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group94i6 (19:103)
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
                    // image3MBQ (8:16)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 49 * fem, 0 * fem),
                    width: 25 * fem,
                    height: 25 * fem,
                    child: Image.asset('assets/page-1/images/image-3-zfk.png',
                        fit: BoxFit.cover),
                  ),
                  Text(
                    // estatemanagementEkz (8:17)
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
              // autogrouppbrfjBx (BRRnkeCfBNoDmmhY3APBrF)
              padding:
              EdgeInsets.fromLTRB(20 * fem, 76 * fem, 19.99 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouphdnoDcv (BRRn2aaQse7V9HLGqPHdno)
                    width: double.infinity,
                    height: 164 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group17yC (12:52)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 19.99 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              14 * fem, 32 * fem, 14.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xff2085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image4u8N (12:48)
                                margin: EdgeInsets.fromLTRB(
                                    1 * fem, 0 * fem, 0 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-ALJ.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // visitorhostelz9p (10:31)
                                'Visitor Hostel',
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
                          // group25h4 (12:53)
                          padding: EdgeInsets.fromLTRB(
                              49 * fem, 32 * fem, 50.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image56cA (12:60)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-s6A.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // hostelzhY (12:55)
                                'Hostel',
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19 * fem,
                  ),
                  Container(
                    // autogroupz8dm5yt (BRRnCucY4YQ8iUYjJrZ8Dm)
                    width: 165.01 * fem,
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group316r (12:62)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 19.99 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              25 * fem, 32 * fem, 27.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image4Ch8 (12:65)
                                margin: EdgeInsets.fromLTRB(
                                    3 * fem, 0 * fem, 0 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // gymkhanaHia (12:64)
                                'Gymkhana',
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
                          // group4QYJ (12:66)
                          padding: EdgeInsets.fromLTRB(
                              27 * fem, 32 * fem, 24.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image5cPU (12:69)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-ux6.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // academicsVy4 (12:68)
                                'Academics',
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19 * fem,
                  ),
                  Container(
                    // autogroupgdw7CMg (BRRnP9pTxz56hFpMrnGDW7)
                    width: 165.01 * fem/2,
                    height: 164 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group5uWz (12:86)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 19.99 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              53 * fem, 32 * fem, 52.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-2, 0),
                              end: Alignment(-1, 1),
                              colors: <Color>[
                                Color(0xd82085cf),
                                Color(0xff334bc7)
                              ],
                              stops: <double>[-1, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Success()));
                                },
                              ),
                              Container(
                                // image4HGe (12:89)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-WUz.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Container(
                                // messArE (12:88)
                                margin: EdgeInsets.fromLTRB(
                                    1 * fem, 0 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'Mess',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          // group7Fsg (12:94)
                          padding: EdgeInsets.fromLTRB(
                              41 * fem, 32 * fem, 38.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(
                                // image5EzW (12:97)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5-hni.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // requestHht (12:96)
                                'Request',
                                style: SafeGoogleFont(
                                  'Montserrat',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2175 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Success()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19 * fem,
                  ),
                  Container(
                    // autogroupt6pogV8 (BRRnZyqkre3qpvhmsWt6po)
                    width: 47*fem,
                    height: 164 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group6vuG (12:90)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 19.99 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              25 * fem, 32 * fem, 27.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem /2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image4N8z (12:93)
                                margin: EdgeInsets.fromLTRB(
                                    3 * fem, 0 * fem, 0 * fem, 19 * fem),
                                width: 60 * fem,
                                height: double.infinity,
                                child: Image.asset(
                                  'assets/page-1/images/image-4-JUa.png',
                                  fit: BoxFit.cover,
                                ),

                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Success()),
                                  );
                                },
                                child: Text(
                                  // gymkhanaRNA (12:92)
                                  'Gymkhana',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              )

                            ],

                          ),
                        ),
                        Container(
                          // group8vZp (12:98)
                          padding: EdgeInsets.fromLTRB(
                              27 * fem, 32 * fem, 24.01 * fem, 28 * fem),
                          width: 165.01 * fem,
                          height: 165.01 * fem/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0xd82085d0),
                                Color(0xff334bc8)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // image5jnA (12:101)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 19 * fem),
                                width: 60 * fem,
                                height: 60 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-5.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // academicsqKQ (12:100)
                                'Academics',
                                style: SafeGoogleFont(
                                  'Montserrat',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2175 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Success()));
                                },
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