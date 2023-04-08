import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
// import 'ScholarshipAwardsHistory/complain_history.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:ui';
// import 'LodgeScholarshipAwards/lodge_ScholarshipAwards.dart';
// import 'Feedback/feedback.dart';
import 'package:provider/provider.dart';

class ScholarshipAwards extends StatefulWidget {
  String? token;
  ScholarshipAwards(this.token);
  @override
  _ScholarshipAwardsState createState() => _ScholarshipAwardsState();
}

main() async {
  late ProfileService profileService;
  late ProfileData data;
  bool _loading = true;
  late String studentType;
  profileService = ProfileService();
  try {
    Response response = await profileService.getProfile();

    data = ProfileData.fromJson(jsonDecode(response.body));

    print(data.user!['username']);
    _loading = false;
    studentType = data.profile!['department']!['name'] +
        '  ' +
        data.profile!['user_type'];
    print(studentType);
  } catch (e) {
    print(e);
  }
}

class _ScholarshipAwardsState extends State<ScholarshipAwards> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading = true;

  late StreamController _profileController;
  late String studentType;
  late ProfileService profileService;
  late ProfileData data;
  @override
  void initState() {
    super.initState();

    _profileController = StreamController();
    profileService = ProfileService();

    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));

        print(data.user!['username']);
        _loading = false;
      });
      studentType = data.profile!['department']!['name'] +
          '  ' +
          data.profile!['user_type'];
      // print(studentType);
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _profileController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white60,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shadowColor: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/profile_pic.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.user != null
                              ? (data.user!['first_name'] +
                                  ' ' +
                                  data.user!['last_name'])
                              : "User does not exist on data",
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.profile != null
                              ? (data.profile!['department']!['name'] +
                                  '  ' +
                                  data.profile!['user_type'])
                              : "No Profile",
                          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 6.0,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    shadowColor: Colors.black,
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                          onPressed: () {
                            setState(() {
                              _loading1 = true;
                              _loading2 = false;
                              _loading3 = false;
                              if (data.profile!['user_type'] == 'faculty') {
                                Navigator.pushNamed(context,
                                    '/scholarship_awards/manage_award_catalogue_fac',
                                    arguments: data.user != null
                                        ? data.user!['username']
                                        : "null");
                              } else {
                                Navigator.pushNamed(context,
                                    '/scholarship_awards/browse_award_catalogue',
                                    arguments: data.user != null
                                        ? data.user!['username']
                                        : "null");
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.profile!['user_type'] == 'faculty'
                                    ? "Manage Catalogue"
                                    : "Browse Award Catalogue",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                          onPressed: () {
                            setState(() {
                              _loading1 = false;
                              _loading2 = true;
                              _loading3 = false;
                              if (data.profile!['user_type'] == 'faculty') {
                                Navigator.pushNamed(
                                  context,
                                  '/scholarship_awards/invite_application',
                                );
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  '/scholarship_awards/apply_for_awards',
                                );
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.profile!['user_type'] == 'faculty'
                                    ? "Invite Application"
                                    : "Apply For Awards",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
