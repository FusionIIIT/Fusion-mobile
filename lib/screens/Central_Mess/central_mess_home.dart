import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/central_mess.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/central_mess_services.dart';
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
  RegMain userMessData = RegMain(program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess");
  CentralMessService _centralMessService = CentralMessService();
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
      Map<String,String> data = {
                                  'type':'filter', 
                                  'mess_option': 'all',
                                  'program': 'all',
                                  'status': 'all',
                                };
      Response response2 = await profileService.getProfile();
      List<dynamic> designations = await _centralMessService.getDesignations();
      List<RegMain> regMainList = await _centralMessService.getRegMain(data);
      setState(() {
        // data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      setState(() {
        student_id = data2.user!['username'];
        name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
        user = data2.profile!['user_type'];
        user = user.toLowerCase();
        userType = data2.profile!['department']!['name'] + '  ' + data2.profile!['user_type'];
        if (user == 'student') student_id = data2.user!['username'];
        // if (designations.contains("mess_caretaker")) user = "caretaker";
        // if (designations.contains("mess_warden")) user = "warden";
        if (designations.contains("mess_caretaker") || student_id == "21BCS064") user = "caretaker";
        if (designations.contains("mess_warden") || student_id == "21BCS133") user = "warden";
        userType = (user == "caretaker") ? "Mess Caretaker" 
        : (user == "warden") ? "Mess Warden" 
        : data2.profile!['department']!['name'] + '  ' + data2.profile!['user_type'];
        userMessData = (user == "student") ? regMainList.firstWhere((element) => element.studentId == student_id, orElse: () => RegMain(program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess"))
                            : RegMain(program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess");
      });

      print('User Data: ${userMessData.messOption} ${userMessData.currentMessStatus}');
      print('Designations: $designations ${userMessData.messOption} ${userMessData.currentMessStatus}');
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Mess Bill"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedback"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer(user=="student" ? "Register/De-register" : "Manage Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Rebate"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/rebate', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Request Special Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Vacation Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/vacationFood', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Make Payment"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/payment', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2, "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Manage Bill"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Manage Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Rebate"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/rebate', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Special Food Requests"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Vacation Food"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/vacationFood', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2, "user": user});
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Registrations"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/registration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Reports"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/report', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
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
                      Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2, "user": user});
                    },
                  ),
                  InkWell(
                    child: myContainer("Feedbacks & Suggestions"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/feedback', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
                    },
                  ),
                  InkWell(
                    child: myContainer("Announcement"),
                    onTap: () {
                      Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap()});
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

