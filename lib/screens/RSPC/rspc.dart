import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

import '../../Components/utils.dart';

class RSPCModule extends StatefulWidget {
  String? token;
  RSPCModule(this.token);

  @override
  State<RSPCModule> createState() => _RSPCModuleState();
}

class _RSPCModuleState extends State<RSPCModule> {
  Utils utils = Utils();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu,
                color: utils.primarycolor,
              ));
        }),
        backgroundColor: utils.primarybackgroundcolor,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Fusion",
            style: TextStyle(
                color: utils.primarycolor, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: utils.lightgrey)),
          )
        ],
      ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/rspc/research_project',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: Container(
                            decoration: utils.containerBorder(Colors.grey),
                            alignment: Alignment.center,
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 60,
                                  // shadows: [],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Add Research Project",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 6,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/rspc/consultancy_project',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: Container(
                            decoration: utils.containerBorder(Colors.grey),
                            alignment: Alignment.center,
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box,
                                  size: 60,
                                  // shadows: [],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Add Consultancy Project",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 6,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/rspc/patents',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: Container(
                            decoration: utils.containerBorder(Colors.grey),
                            alignment: Alignment.center,
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  size: 60,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Patents",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 6,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/rspc/view_research_project',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: Container(
                            decoration: utils.containerBorder(Colors.grey),
                            alignment: Alignment.center,
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.border_color_outlined,
                                  size: 60,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Research Projects",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 6,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/rspc/view_consultancy_project',
                              arguments: data.user != null
                                  ? data.user!['username']
                                  : "null");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: Container(
                            decoration: utils.containerBorder(Colors.grey),
                            alignment: Alignment.center,
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.border_color_outlined,
                                  size: 60,
                                  // shadows: [],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Consultancy Projects",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 6,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }

  Widget buttonwidget(String name, IconData icons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icons,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
