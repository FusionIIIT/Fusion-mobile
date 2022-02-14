import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(),
  ),
);

getLink() {
  // String localLink = "127.0.0.1:8000";
  String serverLink = "172.27.16.216:80";
  return serverLink;
}
