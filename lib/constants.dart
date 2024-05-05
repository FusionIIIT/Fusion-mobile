import 'package:flutter/material.dart';
import 'package:fusion/api.dart';

Color kPrimaryColor = Color(0xFFF36C35);

InputDecoration kFormFieldDecoration = InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  labelStyle: TextStyle(color: Color(0xFF808080), fontSize: 12),
);

List<BoxShadow> kBoxShadowList = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 10,
    offset: Offset(2, 2),
  ),
];

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(),
  ),
);

String getLink() {
  return klocalLink;
}
