import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/gymkhana_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class gymkhana_convenor extends StatefulWidget {
  @override
  _gymkhana_convenorState createState() => _gymkhana_convenorState();
}

class _gymkhana_convenorState extends State<gymkhana_convenor> {
  bool _loading1 = true;
  ProfileData? data;
  late StreamController _gymkhanaController;
  late GymkhanaService gymkhanaService;
  late GymkhanaData gymkhanaData;

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
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;
    _gymkhanaController = StreamController();
    gymkhanaService = GymkhanaService();
    //TODO: Check if data is not null, data is accessed with ! operator in build()
    if (data == null) {
      //profileData cannot be not retrieved show error page
    }
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    //TODO: uncomment when API is functioning

    try {
      //Response response = await gymkhanaService.getGymkhanaData();

      setState(() {
        //TODO: uncomment when API is functioning
        // print(response);
        // gymkhanaData = GymkhanaData.fromJson(jsonDecode(response.body));
        gymkhanaData = GymkhanaData(
          clubNames: [
            'Avartan',
            'Saaz',
            'Jazbaat',
            'Abhivyakti',
          ],
          membersDetails: [
            {
              'name': 'Aaaa',
              'rollno': '2019029',
              'club': 'Cricket',
              'category': 'sports'
            },
            {
              'name': 'baaa',
              'rollno': '2019129',
              'club': 'Saaz',
              'category': 'cultural'
            },
          ],
          clubDetails: [
            {
              'club': 'Avartan',
              'coord': '2018037',
              'coco': '2019008',
              'activitycal': ''
            },
            {
              'club': 'Avartan',
              'coord': '2018037',
              'coco': '2019008',
              'activitycal': ''
            },
          ],
          clubSessions: [
            {
              'venue': 'L-201',
              'date': '22 Mar 21',
              'time': '6:00 PM',
              'details': ''
            },
            {
              'venue': 'L-201',
              'date': '22 Mar 21',
              'time': '6:00 PM',
              'details': ''
            },
          ],
          clubEvents: [
            {
              'club': 'Avartan',
              'eventname': 'footloose',
              'incharge': 'Dr Deepmala',
              'date': '23 Aug 20'
            },
            {
              'club': 'Avartan',
              'eventname': 'footloose',
              'incharge': 'Dr Deepmala',
              'date': '23 Aug 20'
            },
          ],
        );

        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _gymkhanaController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body:
          //TODO: uncomment when API is functioning
          _loading1 == true
              // false
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
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
                            data!.user!['first_name'] +
                                ' ' +
                                data!.user!['last_name'],
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Convenor",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
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
                            "Gymkhana",
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shadowColor: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          
                          InkWell(
                            child: myContainer("Club Details"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/gymkhana_convenor/clubs',
                                arguments: gymkhanaData,
                              );
                            },
                          ),
                          InkWell(
                            child: myContainer("Members Record"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/gymkhana_convenor/member_records',
                                arguments: gymkhanaData,
                              );
                            },
                          ),
                           InkWell(
                            child: myContainer("Club Budget Form"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/gymkhana_convenor/budgetFormConvenor',
                                arguments: gymkhanaData,
                              );
                            },
                          ),
                          InkWell(
                            child: myContainer("View Club Budget"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/gymkhana_convenor/budgetdetails',
                                arguments: gymkhanaData,
                              );
                            },
                          ),
                          InkWell(
                            child: myContainer("Update Budget"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/gymkhana_convenor/updatebudgetconvenor',
                                arguments: gymkhanaData,
                              );
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
