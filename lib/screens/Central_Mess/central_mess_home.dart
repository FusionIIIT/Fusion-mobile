import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';

class CentralMessHome extends StatefulWidget {
  @override
  _CentralMessHomeState createState() => _CentralMessHomeState();
}

class _CentralMessHomeState extends State<CentralMessHome> {
  bool _loading = true;
  late String name;
  late String studentType;
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;

  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              shadowColor: Colors.black,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile_pic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        studentType,
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Central Mess",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              shadowColor: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    child: myContainer("Mess Menu"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Mess Bill"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedback"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Register/De-register"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Apply for Rebate"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/rebate', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Request Special Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood', arguments: data);
                    },
                  ),
                  InkWell(
                    child: myContainer("Make Payment"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/payment', arguments: data);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // (/mess/vacationFoodApi) Vacation Food Api  - Partially working☑️
// // Mess Info Api - Implemented/ Not required ✅
// // (/mess/rebateApi) Rebate Api - Implemented ✅
// // (/mess/menuApi ) Menu Api - Implemented ✅
// // (/mess/paymentsApi) Payments Api - Not Implemented
// // (/mess/monthlyBillApi) Monthly Bill Api - Not Implemented❌
// // (/mess/messBillBaseApi) Mess Bill Base Api  - Implemented✅
// // (/mess/messRegApi) Mess Reg Api - Partially working / De registration needs to be implemented ☑️
// // (/mess/feedbackApi) Feedback Api - Implemented ✅
// // (/mess/menuChangeRequestApi) Menu Change Request Api - Implemented ✅
// // Mess Minutes Api - Not required
// // Non Veg Api - Not required
// // (/mess/specialRequestApi) Special Requests Api - Partially working ☑️
// // Mess Meetings Api - Not required
// // Non Veg Menu Api - Not required
// // Respond Rebate Request - Not Implemented ❌
// // Announcements Api - Not Implemented ❌
// // Generate reports Api - Not Implemented ❌
