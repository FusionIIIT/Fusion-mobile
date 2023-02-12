import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class RSPCModule extends StatefulWidget {
  String? token;
  RSPCModule(this.token);

  @override
  State<RSPCModule> createState() => _RSPCModuleState();
}

class _RSPCModuleState extends State<RSPCModule> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
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
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                                  context, '/rspc/research_project',
                                  arguments: data.user != null
                                      ? data.user!['username']
                                      : "null");
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Research Projects',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color:
                                      _loading1 ? Colors.black : Colors.black26,
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
                      ],
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                                  context, '/rspc/consultancy_project',
                                  arguments: data.user != null
                                      ? data.user!['username']
                                      : "null");
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Consultancy Projects',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color:
                                      _loading1 ? Colors.black : Colors.black26,
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
                      ],
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                              Navigator.pushNamed(context, '/rspc/patents',
                                  arguments: data.user != null
                                      ? data.user!['username']
                                      : "null");
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Patents',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color:
                                      _loading1 ? Colors.black : Colors.black26,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
