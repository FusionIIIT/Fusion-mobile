import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';

class CentralMessHome extends StatefulWidget {
  @override
  _CentralMessHomeState createState() => _CentralMessHomeState();
}

class _CentralMessHomeState extends State<CentralMessHome> {
  bool _loading = true;
  late String name;
  late String userType;
  late String user;
  late String student_id;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  @override
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      // Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        // data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      userType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
      user = data2.profile!['user_type'];
      user = "caretaker";
      user = user.toLowerCase();
      // user = "warden";
      if(user == 'student') student_id = data2.user!['username'];
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      // _dashboardController.add(res);
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
          : ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
              elevation: 2.0,
              // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              shadowColor: Colors.black,
              child: Column(
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
                    userType,
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
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
            user == 'student' ?
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Mess Bill"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedback"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer(user=="student" ? "Register/De-register" : "Manage Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Rebate"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/rebate', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Request Special Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Make Payment"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/payment', arguments: data2);
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            )
            : user == 'caretaker' ?
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Manage Bill"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Manage Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Rebate"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/rebate', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Special Food Requests"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Vacation Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/vacationFood', arguments: data2);
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            )
            : user =='warden'  ?
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Reports"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/report', arguments: data2);
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ) :
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: data2);
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: data2);
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

