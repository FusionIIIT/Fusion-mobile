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
        // fusionuiconcept1rDx (19:211)
        width: double.infinity,
        height: 844 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
