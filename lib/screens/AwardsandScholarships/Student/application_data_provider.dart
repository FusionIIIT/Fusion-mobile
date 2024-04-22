import 'package:flutter/material.dart';

class ApplicationDataProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> submittedapplications = [
   
  ];

  void addApplication(Map<String, dynamic> application) {
    submittedapplications.add(application);
    notifyListeners();
  }

  void removeApplication(Map<String, dynamic>application) {
    submittedapplications.remove(application);
    notifyListeners();
  }
}
