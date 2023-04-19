import 'package:flutter/material.dart';

class Utils {
  final primarycolor = Colors.purple;
  final primarybackgroundcolor = Colors.white;
  final lightgrey = Colors.grey;
  Decoration containerBorder(Color col) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primarycolor));
  }

  Widget leadingPopIconsButton(Color cc, BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }
}
