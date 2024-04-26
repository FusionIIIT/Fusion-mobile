import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

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
  late DateTime startDate;
  RegMain userMessData = RegMain(
      program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess");
  CentralMessService _centralMessService = CentralMessService();
  late List<bool> _expanded;

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    _expanded = [false]; // Initialize expansion state
    getData();
  }

  getData() async {
    try {
      // Response response = await dashboardService.getDashboard();
      Map<String, String> data = {
        'type': 'filter',
        'mess_option': 'all',
        'program': 'all',
        'status': 'all',
      };
      Response response2 = await profileService.getProfile();
      // List<dynamic> designations =
      // await _centralMessService.getDesignations();
      List<RegMain> regMainList =
      await _centralMessService.getRegMain(data);

      List<RegRecords> regRecords = await _centralMessService.getRegRecords(
          ProfileData.fromJson(jsonDecode(response2.body)).user!["username"]);

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
        userType = data2.profile!['department']!['name'] +
            '  ' +
            data2.profile!['user_type'];
        if (user == 'student') student_id = data2.user!['username'];

        if (curr_desig == "mess_manager") user = "caretaker";
        if (curr_desig == "mess_warden") user = "warden";
        userType = (user == "caretaker") ? "Mess Caretaker"
        : (user == "warden") ? "Mess Warden"
        : data2.profile!['department']!['name'] + '  ' + data2.profile!['user_type'];
        userMessData = (user == "student") ? regMainList.firstWhere((element) => element.studentId == student_id, orElse: () => RegMain(program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess", studentId: student_id))
                            : RegMain(program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess", studentId: student_id);
        startDate = (user == "student") ? (regRecords.length > 0) ? regRecords.last.startDate : DateTime.now() : DateTime.now() ;
      });
      // print(student_id);
      // regMainList.forEach((element) => print({'${element.studentId} ${element.currentMessStatus}'}));
      print('User Data: ${userMessData.messOption} ${userMessData.currentMessStatus} ${userMessData.studentId} ${startDate}');
      // print('Designations: $designations ${userMessData.messOption} ${userMessData.currentMessStatus}');
    } catch (e) {
      print(e);
    }
  }
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
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
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
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
  Padding myContainerWithWidget(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Central Mess",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
          if (curr_desig.toLowerCase() != "student" && curr_desig.toLowerCase() != "mess_manager" && curr_desig.toLowerCase() != "mess_warden") {
            Navigator.pushReplacementNamed(context, "/dashboard"); // Redirect to home ("/dashboard")
          }
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
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
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if(user == "student")
                  ...[
                    InkWell(
                      child: myContainer("View Menu"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("View Bill & Payments"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer(userMessData.currentMessStatus.toLowerCase()=="deregistered" ? "Registration" :  "DeRegistration" ),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/registration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("Make Payment"),
                      onTap: (){
                        _launchURL('https://services.sabpaisa.in/pages/iitdm.html');
                      }
                    ),
                    if (userMessData.currentMessStatus.toLowerCase() == "registered" && startDate.isBefore(DateTime.now()))
                      ...[
                        InkWell(
                          child: myContainer("Update Payment" ),
                          onTap: () {
                            Navigator.pushNamed(context, '/central_mess_home/updatePayment', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                          },
                        ),
                        InkWell(
                          child: myContainer("Feedback Form/History"),
                          onTap: () {
                            Navigator.pushNamed(context, '/central_mess_home/feedback',
                                arguments: {
                                  "profileData": data2.toJson(),
                                  "user": user,
                                  "userMessData": userMessData.toMap()
                                });
                          },
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _expanded[0] = !_expanded[0];
                            });
                          },
                          child: myContainerWithWidget(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText(
                                  'Applications',
                                ),
                                Icon(
                                  _expanded[0]
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (_expanded[0]) ...[
                          Card(
                            elevation: 2.0,
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            shadowColor: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                  child: myContainer("Rebate Form/History"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/rebate',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Request Special Food"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Vacation Food"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/vacationFood',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ],
                  ],
                if(user == "caretaker")
                  ...[
                    InkWell(
                      child: myContainer("View & Update Menu"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("Manage Mess Bills"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("Manage Registrations" ),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/manageRegistration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("View Feedback"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/feedback',
                            arguments: {
                              "profileData": data2.toJson(),
                              "user": user,
                              "userMessData": userMessData.toMap()
                            });
                      },
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _expanded[0] = !_expanded[0];
                          });
                        },
                        child: myContainerWithWidget(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              myText(
                                'Respond to Requests',
                              ),
                              Icon(
                                _expanded[0]
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                              ),
                            ],
                          ),
                        ),
                      ),

                        if (_expanded[0]) ...[
                          Card(
                            elevation: 2.0,
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            shadowColor: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                  child: myContainer("Reg/DeReg Requests" ),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/registration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Update Payment Requests" ),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/updatePayment', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Rebate Requests"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/rebate',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Special Food Requests"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/reqSpecialFood',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                                InkWell(
                                  child: myContainer("Vacation Food Requests"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/central_mess_home/vacationFood',
                                        arguments: {
                                          "profileData": data2.toJson(),
                                          "user": user,
                                          "userMessData": userMessData.toMap()
                                        });
                                  },
                                ),
                              ],
                            ),
                          )
                      ],
                  ],
                // InkWell(
                //   child: myContainer("Announcement"),
                //   onTap: () {
                //     Navigator.pushNamed(context, '/central_mess_home/announcement', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                //   },
                // ),
                if(user == "warden")
                  ...[
                    InkWell(
                      child: myContainer("View Menu"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/menu', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("View Feedback"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/feedback',
                            arguments: {
                              "profileData": data2.toJson(),
                              "user": user,
                              "userMessData": userMessData.toMap()
                            });
                      },
                    ),
                    InkWell(
                      child: myContainer("View Mess Bills"),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/messBill', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    InkWell(
                      child: myContainer("View Registrations" ),
                      onTap: () {
                        Navigator.pushNamed(context, '/central_mess_home/manageRegistration', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                      },
                    ),
                    // InkWell(
                    //   child: myContainer("Reports"),
                    //   onTap: () {
                    //     Navigator.pushNamed(context, '/central_mess_home/report', arguments: {"profileData": data2.toJson(), "user": user, "userMessData": userMessData.toMap(), "startDate": startDate});
                    //   },
                    // ),
                  ],
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}