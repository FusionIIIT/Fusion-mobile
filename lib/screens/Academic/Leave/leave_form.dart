import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

import '../../../Components/appBar.dart';

class LeaveForm extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<LeaveForm> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.fromLTRB(13 * fem, 8 * fem, 14 * fem, 13 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 3 * fem),
                      width: double.infinity,
                      height: 39 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffff6e40),
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Leave Application Form',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Leave type ',
                            ),
                            TextSpan(
                              text: '*',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 32 * fem, 5 * fem),
                      padding: EdgeInsets.fromLTRB(
                          19 * fem, 12 * fem, 17 * fem, 13 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // selectoNi (18:710)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 205 * fem, 0 * fem),
                            child: Text(
                              'Select',
                            ),
                          ),
                          Container(
                            width: 14 * fem,
                            height: 8 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-ZG6.png',
                              width: 14 * fem,
                              height: 8 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'From',
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '*',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 32 * fem, 3 * fem),
                      padding: EdgeInsets.fromLTRB(
                          19 * fem, 9 * fem, 17 * fem, 9 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 82 * fem, 1 * fem),
                            child: Text(
                              'Click to select date',
                            ),
                          ),
                          Container(
                            // vectorJeE (18:728)
                            width: 31 * fem,
                            height: 31 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-8Pc.png',
                              width: 31 * fem,
                              height: 31 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'To',
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '*',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 32 * fem, 3 * fem),
                      padding: EdgeInsets.fromLTRB(
                          19 * fem, 9 * fem, 17 * fem, 9 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 82 * fem, 0 * fem),
                            child: Text(
                              'Click to select date',
                            ),
                          ),
                          Container(
                            width: 31 * fem,
                            height: 31 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-Hbp.png',
                              width: 31 * fem,
                              height: 31 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: Text(
                        'Related Document',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 32 * fem, 5 * fem),
                      padding: EdgeInsets.fromLTRB(
                          7 * fem, 12 * fem, 36 * fem, 12 * fem),
                      width: double.infinity,
                      height: 49 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 18 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(
                                17 * fem, 1 * fem, 16 * fem, 0 * fem),
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffeaeaea),
                              borderRadius: BorderRadius.circular(4 * fem),
                            ),
                            child: Text(
                              'Choose File',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'No file chosen',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Address',
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '*',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 0 * fem, 8 * fem),
                      width: 309 * fem,
                      height: 49 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Purpose',
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '*',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 0 * fem, 21 * fem),
                      width: 309 * fem,
                      height: 49 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 119 * fem,
                      height: 41 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffff6e40),
                        borderRadius: BorderRadius.circular(4 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
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
