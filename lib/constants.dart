import 'package:flutter/material.dart';
import 'package:fusion/api.dart';

Color kPrimaryColor = Color(0xFF2085D0);

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
  return kserverLink;
}
