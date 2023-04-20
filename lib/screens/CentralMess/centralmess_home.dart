import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

import '../../services/service_locator.dart';
import '../../services/storage_service.dart';
class CentralMessHome extends StatefulWidget {
  final String? token;
  static String tag = 'academic-page';
  CentralMessHome(this.token);
  @override
  _CentralMessHomeState createState() =>
      _CentralMessHomeState();
}

class _CentralMessHomeState extends State<CentralMessHome> {
  bool _loading = false;
  int count = 0;
  String? name;
  String? depttype;
  bool isConvener = false;
  bool isManager = false;
  @override
  void initState() {
    super.initState();
    print('inmess${widget.token}');
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];
    print(service.profileData.user!['id']);
    if(service.profileData.current!.length > 1)isConvener = service.profileData.current![1]["designation"]["name"].contains("mess_convener");
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
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  Padding myContainer(String text) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: myText(text),
        ),),
        decoration: new BoxDecoration(
          color: Colors.deepOrangeAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 1.0),
              blurRadius: 2.0,
            )
          ],
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.token;
    print(data);
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                      image: AssetImage('assets/profile_pic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  name!, //Display name of User
                  style:
                  TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  depttype!, // Display Type of User
                  style:
                  TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                child: myContainer("Menu"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/menu',
                      arguments: data);
                },
              ),
              InkWell(
                child: myContainer("Registeration/Payment details"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/registeration',
                      arguments: data);
                },
              ),
              InkWell(
                child: myContainer("Applications"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/applications',
                      arguments: data);
                },
              ),
              InkWell(
                child: myContainer("Feedback"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/feedback',
                      arguments: data);
                },
              ),
              isConvener? InkWell(
                child: myContainer("Request Menu Change"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/menuchangereq',
                      arguments: data);
                },
              ):Container(),
              isConvener? InkWell(
                child: myContainer("View Feedback"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/feedback_stats',
                      arguments: data);
                },
              ):Container(),
              isManager? InkWell(
                child: myContainer("Respond Requests"),
                onTap: () {
                  Navigator.pushNamed(
                      context, '/centralmess_home/respondmanager',
                      arguments: data);
                },
              ):Container(),
            ],
          ),
        ],
      ),
    );
  }
}
