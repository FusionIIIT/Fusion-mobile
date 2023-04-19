import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils.dart';
import 'add_items.dart';
import 'mess.dart';
import 'transfer_request.dart';
import 'transfer_table.dart';
import 'pdf_viewer.dart';

class PS2Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Dashboards(),
        ),
      ),
    );
  }
}

class Dashboards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Card(
      child: Container(
        // This is default app bar used in all modules
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // group9w6b (7:534)
              margin:
              EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 29.5 * fem),
              padding: EdgeInsets.fromLTRB(
                  19.38 * fem, 50.4 * fem, 62.31 * fem, 4.6 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff36c35),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // image3PUP (7:536)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 40.23 * fem, 5 * fem),
                    width: 23.08 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/page-1/images/image-3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // estatemanagementV1d (7:537)
                    'Estate Management',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              // stocksummarymessNr7 (17:29)
              child: Container(
                width: double.infinity,
                child: Text(
                  'Stock Summary - PS2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2175 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Container(
              padding:
              EdgeInsets.fromLTRB(16 * fem, 9.5 * fem, 21 * fem, 252 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 0 * fem, 0 * fem, 28.5 * fem),
                    padding: EdgeInsets.fromLTRB(
                        10 * fem, 10 * fem, 10 * fem, 10 * fem),
                    width: 318 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          // numberofitemsinstock98131Xh (17:33)
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Number of Items in stock:  9813',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8 * fem,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Last Verified on:  28/02/2023',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    // actionscvo (17:30)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 11.5 * fem),
                      width: double.infinity,
                      child: Text(
                        'Actions',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2175 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group27u9D (17:37)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6Zuu (17:46)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // viewstock4wD (17:39)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MessView()),
                                    );
                                  },
                                  child: Text(
                                    'View Stock',
                                    textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26kN7 (17:49)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.view_list,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vyR (17:40)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w900,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    // group28Gfu (17:45)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6Zuu (17:46)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // addstockFXq (17:47)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddItems()),
                                    );
                                  },
                                  child: Text(
                                    'Add Stock',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          // 74F (17:48)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26kN7 (17:49)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.add_shopping_cart,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    // group28Gfu (17:45)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6Zuu (17:46)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // addstockFXq (17:47)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StockViewePDF()),
                                    );
                                  },
                                  child: Text(
                                    'Generate stock report',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          // 74F (17:48)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26kN7 (17:49)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.report,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    // group28Gfu (17:45)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6Zuu (17:46)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // addstockFXq (17:47)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TransferViewePDF()),
                                    );
                                  },
                                  child: Text(
                                    'Generate Transfer Report',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          // 74F (17:48)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26kN7 (17:49)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.transfer_within_a_station_sharp,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group29RDM (17:53)
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6kFd (17:54)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // generatereportpmH (17:55)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyAppTransfer()),
                                    );
                                  },
                                  child: Text(
                                    'Transfer Request',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // 5x7 (17:56)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26Z6b (17:57)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.document_scanner,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group29RDM (17:53)
                    width: double.infinity,
                    height: 64 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle6kFd (17:54)
                          left: 5 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6 * fem),
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // generatereportpmH (17:55)
                          left: 71 * fem,
                          top: 20 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 152 * fem,
                                height: 22 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TransferTable()),
                                    );
                                  },
                                  child: Text(
                                    'Transfer Table',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2175 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // 5x7 (17:56)
                          left: 294 * fem,
                          top: 19.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 13 * fem,
                                height: 25 * fem,
                                child: Text(
                                  '>',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group26Z6b (17:57)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 64 * fem,
                              height: 64 * fem,
                              child: Icon(
                                Icons.table_chart,
                                size: 50.0,
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
    );
  }
}
