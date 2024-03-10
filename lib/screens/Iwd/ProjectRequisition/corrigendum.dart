import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';

class CorrigendumpageWidget extends StatefulWidget {
  @override
  _CorrigendumpageWidgetState createState() => _CorrigendumpageWidgetState();
}

class _CorrigendumpageWidgetState extends State<CorrigendumpageWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CorrigendumpageWidget - FRAME

    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: -2,
              left: 0,
              child: Container(
                  width: 381,
                  height: 642,
                  decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 360,
                            height: 80,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 360,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 108, 53, 1),
                                      ))),
                              Positioned(
                                  top: 35,
                                  left: 21,
                                  child: Container(
                                      width: 23.076923370361328,
                                      height: 17,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Image3.png'),
                                            fit: BoxFit.fitWidth),
                                      ))),
                              Positioned(
                                  top: 32,
                                  left: 50,
                                  child: Text(
                                    'Institute Works Department',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 137,
                        left: 27,
                        child: Container(
                            width: 318,
                            height: 53,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Dated',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 318,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                ))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 219,
                        left: 21,
                        child: Container(
                            width: 318,
                            height: 53,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Ref No: Our NIT NO.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 318,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                ))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 305,
                        left: 26,
                        child: Container(
                            width: 318,
                            height: 53,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Name of Work',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 318,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                ))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 601,
                        left: 21,
                        child: Container(
                            width: 353,
                            height: 106,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Date of opening of bid(envelop-1):',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Text(
                                    'dd-mm-yyyy',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 8,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 78,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 78,
                                  left: 3,
                                  child: Text(
                                    '--:--',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 17.5,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 729,
                        left: 21,
                        child: Container(
                            width: 353,
                            height: 106,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Date of opening of bid(envelop-2):',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 25,
                                  left: 2,
                                  child: Text(
                                    'dd-mm-yyyy',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 8,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 78,
                                  left: 0,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 78,
                                  left: 3,
                                  child: Text(
                                    '--:--',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 17.5,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 387,
                        left: 24,
                        child: Text(
                          'This is for information to all: In reference to above work the crucial dates of tender are being changed as under. The other terms & conditions of the tender shall remain the same.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 473,
                        left: 27,
                        child: Container(
                            width: 354,
                            height: 106,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 1,
                                  child: Text(
                                    'Last Date & Time of sumbission of bid',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 25,
                                  left: 1,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 78,
                                  left: 1,
                                  child: Container(
                                      width: 318,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                      ))),
                              Positioned(
                                  top: 78,
                                  left: 4,
                                  child: Text(
                                    '--:--',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 17.5,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 27,
                                  left: 0,
                                  child: Text(
                                    'dd-mm-yyyy',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 8,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 886,
                        left: 242,
                        child: Container(
                            width: 97,
                            height: 28,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 97,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                        ),
                                        color: Color.fromRGBO(243, 108, 53, 1),
                                      ))),
                              Positioned(
                                  top: 6,
                                  left: 33,
                                  child: Text(
                                    'Next',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 13,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 886,
                        left: 21,
                        child: Container(
                            width: 97,
                            height: 28,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 97,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                        ),
                                        color: Color.fromRGBO(96, 97, 98, 1),
                                      ))),
                              Positioned(
                                  top: 6,
                                  left: 20,
                                  child: Text(
                                    'Previous',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Montserrat',
                                        fontSize: 13,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 98,
                        left: 128,
                        child: Text(
                          'Corrigendum',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
        ]));
  }
}