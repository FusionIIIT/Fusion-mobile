import 'package:flutter/material.dart';
import 'package:fusion/screens/LoginandDashboard/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/login_page.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
   var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StorageService.getInstance(),
      builder: (context, AsyncSnapshot? snapshot) {
        if (snapshot?.hasData ?? false) {
          if (snapshot?.data.userInDB != null) return Dashboard();
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
