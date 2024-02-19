import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'ComplaintHistory/complain_history.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:ui';
import 'package:fusion/services/storage_service.dart';
import 'LodgeComplaint/lodge_complaint.dart';
import 'Feedback/feedback.dart';
import 'package:provider/provider.dart';

class Complaint extends StatefulWidget {
  String? token;
  Complaint(this.token);
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading = true;

  late StreamController _profileController;
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
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _profileController.add(res);
    });
  }

  String customContent = "";
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
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data.profile != null
                        ? (data.profile!['department']!['name'] +
                        '  ' +
                        data.profile!['user_type'])
                        : "No Profile",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            if (data.profile!["user_type"] == "student")
              Card(
                elevation: 2.0,
                margin:
                EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shadowColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = true;
                          _loading2 = false;
                          _loading3 = false;
                          Navigator.pushNamed(
                              context, '/complaint/lodge_complaint',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lodge Complaint",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading1
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading1
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = false;
                          _loading2 = true;
                          _loading3 = false;
                          Navigator.pushNamed(
                            context,
                            '/complaint/complaint_history',
                          );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Complaint History',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading2
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading2
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = false;
                          _loading2 = false;
                          _loading3 = true;
                          Navigator.pushNamed(
                            context,
                            '/complaint/feedback',
                          );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Feedback',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading3
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading3
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            else if (data.profile!["user_type"] == "student")
              Card(
                // Widget for caretaker
                elevation: 2.0,
                margin:
                EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shadowColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = true;
                          _loading2 = false;
                          _loading3 = false;
                          Navigator.pushNamed(
                              context, '/complaint/lodge_complaint',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lodge Complaint",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading1
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading1
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = false;
                          _loading2 = true;
                          _loading3 = false;
                          Navigator.pushNamed(
                            context,
                            '/complaint/caretaker/resolved_complaints',
                          );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Resolved Complaints',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading2
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading2
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _loading1 = true;
                          _loading2 = true;
                          _loading3 = true;
                          Navigator.pushNamed(
                            context,
                            '/complaint/unresolved_complaints',
                          );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Unresolved Complaint',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: _loading3
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _loading3
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else if (data.profile!["user_type"] == "faculty")
                Card(
                  // Widget for staff
                  elevation: 2.0,
                  margin:
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _loading1 = true;
                            _loading2 = false;
                            _loading3 = false;
                            Navigator.pushNamed(context, '/complaint/supe',
                                arguments: data.user != null
                                    ? data.user!['username']
                                    : "null");
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lodge Complaint",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: _loading1
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: _loading1
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _loading1 = false;
                            _loading2 = true;
                            _loading3 = false;
                            Navigator.pushNamed(
                              context,
                              '/complaint/supervisor/view_caretaker',
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'View Caretaker',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: _loading2
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: _loading2
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _loading1 = false;
                            _loading2 = false;
                            _loading3 = true;
                            Navigator.pushNamed(
                              context,
                              '/complaint/supervisor/resolved_complaints',
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resolved Complaints',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: _loading3
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: _loading3
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _loading1 = false;
                            _loading2 = false;
                            _loading3 = true;
                            Navigator.pushNamed(
                              context,
                              '/complaint/supervisor/unresolved_complaints',
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Unresolved Complaints',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: _loading3
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: _loading3
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _loading1 = false;
                            _loading2 = false;
                            _loading3 = true;
                            Navigator.pushNamed(
                              context,
                              '/complaint/supervisor/overdue_complaints',
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Overdue Complaints',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: _loading3
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: _loading3
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}