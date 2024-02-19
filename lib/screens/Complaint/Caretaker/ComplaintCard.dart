import 'package:flutter/material.dart';
import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;

class CtCardComponent extends StatefulWidget {
  @override
  _CtCardComponentState createState() => _CtCardComponentState();
}

class _CtCardComponentState extends State<CtCardComponent> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CtCardComponent - GROUP

    return Container(
        width: 320,
        height: 213,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 47.99999237060547,
                  left: 62,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Pending Complaints', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Calibri',
                        fontSize: 22,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 0,
                  left: 0,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Container(
                        width: 320,
                        height: 213,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          boxShadow : [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0,4),
                              blurRadius: 4
                          )],
                          color : Color.fromRGBO(153, 53, 232, 1),
                          border : Border.all(
                            color: Color.fromRGBO(153, 53, 232, 1),
                            width: 2,
                          ),
                        )
                    ),
                  )
              ),Positioned(
                  top: 16.00000762939453,
                  left: 94,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Complaint No: 1', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Calibri',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 74.99999237060547,
                  left: 51.00001525878906,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Complaint Type: Electricity', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Calibri',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 46.00000762939453,
                  left: 41.00000762939453,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Date: Jan. 21,2023, 8:05 p.m.', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Calibri',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 114.0000228881836,
                  left: 114.99999237060547,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Container(
                        width: 90,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color : Color.fromRGBO(153, 53, 232, 1),
                        )
                    ),
                  )
              ),Positioned(
                  top: 165.00003051757812,
                  left: 33.00000762939453,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Container(
                        width: 253,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color : Color.fromRGBO(153, 53, 232, 1),
                        )
                    ),
                  )
              ),Positioned(
                  top: 119.0000228881836,
                  left: 126.00000762939453,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Details', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Calibri',
                        fontSize: 23,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 169,
                  left: 37.00000762939453,
                  child: Transform.rotate(
                    angle: 2.4848083448933725e-17 * (math.pi / 180),
                    child: Text('Change status as resolved', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Calibri',
                        fontSize: 23,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),
            ]
        )
    );
  }
}