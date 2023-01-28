import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 348;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // rectangle6Sg2 (19:210)
        width: double.infinity,
        height: 90 * fem,
        decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
        ),
      ),
    );
  }
}
