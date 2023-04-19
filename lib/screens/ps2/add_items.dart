import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils.dart';
import 'add_items.dart';
import 'mess.dart';
import 'SUCCESS.dart';

class AddItems extends StatelessWidget {
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: AddItem(),
        ),
      ),
    );
  }
}


class AddItem extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Form(
      child: Container(
        // fusionuiestatec29r9h (211:2)
        width:  double.infinity,
        decoration:  BoxDecoration (
          color:  Color(0xffffffff),
        ),
        child:
        Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
            Container(
              // group952T (211:3)
              padding:  EdgeInsets.fromLTRB(19.38*fem, 48*fem, 87*fem, 7*fem),
              width:  double.infinity,
              decoration:  BoxDecoration (
                color:  Color(0xd8f57a08),
              ),
              child:
              Row(
                crossAxisAlignment:  CrossAxisAlignment.end,
                children:  [
                  Container(
                    // image3wqM (211:5)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 53.54*fem, 2.6*fem),
                      width:  23.08*fem,
                      height:  20*fem,
                      child: Icon(Icons.menu, size:30)
                  ),
                  Text(
                    // transferrequestEZZ (211:6)
                    'Add Items',
                    style:  TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupz7uvJZR (S8EXp9bk9EM8Jfwtctz7uV)
              padding:  EdgeInsets.fromLTRB(22*fem, 35*fem, 20*fem, 125*fem),
              width:  double.infinity,
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.center,
                children:  [
                  Container(
                    // group43y9m (211:7)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                    width:  double.infinity,
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(8*fem),
                    ),
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // itemname1MM (211:8)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child:
                          Text(
                            'Name of Particular',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10A7m (211:9)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the name of particular',
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group44LAf (211:12)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                    width:  double.infinity,
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(8*fem),
                    ),
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // quantitypLj (211:13)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child:
                          Text(
                            'Inventory No',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Hk7 (211:14)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the inventory no',
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    // group43y9m (211:7)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                    width:  double.infinity,
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(8*fem),
                    ),
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // itemname1MM (211:8)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                          child:
                          Text(
                            'Rate',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10A7m (211:9)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'rate',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    // group51rCB (211:26)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                    width:  double.infinity,
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(8*fem),
                    ),
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Amount:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the amount',
                            ),
                          ),
                        ),
                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Supplier name:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the supplier name',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Bill no:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the bill no',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Buy date:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the buy date',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Issued date:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the issued date',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Head of asset:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the head of asset-',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Section:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the section',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Floor:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the floor no',
                            ),
                          ),

                        ),

                        Container(
                          // tolocationkYT (211:27)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem,6*fem),
                          child:
                          Text(
                            'Receiver name:',
                            style:  TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group10Dgw (211:28)
                          padding:  EdgeInsets.fromLTRB(10*fem, 7*fem, 10*fem, 7*fem),
                          width:  double.infinity,
                          decoration:  BoxDecoration (
                            color:  Color(0xfff4f4f4),
                            borderRadius:  BorderRadius.circular(8*fem),
                          ),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the receiver name',
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group50pgj (211:37)
                    margin:  EdgeInsets.fromLTRB(90*fem, 0*fem, 103*fem, 0*fem),
                    width:  double.infinity,
                    height:  43*fem,
                    decoration:  BoxDecoration (
                      color:  Color(0xff3179fd),
                      borderRadius:  BorderRadius.circular(6*fem),
                    ),
                    child:
                    Center(
                      child:
                      Text(
                        'Submit',
                        style:  SafeGoogleFont (
                          'Montserrat',
                          fontSize:  16*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  1.2175*ffem/fem,
                          color:  Color(0xffffffff),
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
