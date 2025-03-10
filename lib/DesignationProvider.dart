import 'package:flutter/material.dart';

class DesignationProvider extends ChangeNotifier {
  late String _designation;

  String get designation => _designation;

  void updateDesignation(String newDesignation) {
    _designation = newDesignation;
    notifyListeners(); // Notify listeners about the change
  }
}