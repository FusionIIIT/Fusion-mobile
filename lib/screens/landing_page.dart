import 'package:flutter/material.dart';
import 'package:fusion/screens/LoginandDashboard/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/login_page.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/Complaint/complaint.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StorageService.getInstance(),
      builder: (context, AsyncSnapshot? snapshot) {
        if (snapshot?.hasData ?? false) {
          if (snapshot?.data.userInDB != null) return Complaint(snapshot?.data.userInDB.token);
          return LoginPage();
        }
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
        // return Dashboard();
      },
    );
  }
}
