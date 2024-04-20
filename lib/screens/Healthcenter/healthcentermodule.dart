import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/health.dart';
import 'package:fusion/services/health_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class HealthCenterMod extends StatefulWidget {
  String? token;
  HealthCenterMod(this.token);
  @override
  _HealthCenterModState createState() => _HealthCenterModState();
}

class _HealthCenterModState extends State<HealthCenterMod> {
  bool _loading1 = true;
  late StreamController _healthController;
  late HeathService healthService;
  late HealthData data;
  String? name;
  String? depttype;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];
    _healthController = StreamController();
    healthService = HeathService();
    print(healthService);
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await healthService.getHealth(widget.token!);
      setState(() {
        // print(response);
        data = HealthData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _healthController.add(res);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.deepOrangeAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
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
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading1 == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 170.0,
                        height: 170.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/unknown.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        name!,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        depttype!,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.0,
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
                        "Health Center",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        )
                      ],
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5.0)),
                    ),
                  ),
                ),
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        child: myContainer("Medical Profile"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/medicalprofile',
                              arguments: data);
                        },
                      ),
                        InkWell(
                        child: myContainer("Announcements"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/announcement',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Health Records"),
                        onTap: () {
                          Navigator.pushNamed(context, '/health_center/history',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Feedback"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/feedback',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Doctor Schedule"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/viewdoctorschedule',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Pathologist Schedule"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/viewschedule',
                              arguments: data);
                        },
                      ),
                      InkWell(
                        child: myContainer("Medical Reimbursement"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/health_center/reimbursement',
                              arguments: data);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
