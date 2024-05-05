import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/RSPC/uppload_pro.dart';
import 'package:fusion/screens/RSPC/uppload_pro.dart';
import 'package:fusion/screens/RSPC/view_request.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class Dean_rspchome extends StatefulWidget {
  const Dean_rspchome({Key? key}) : super(key: key);

  @override
  State<Dean_rspchome> createState() => _Dean_rspchomeState();
}

class _Dean_rspchomeState extends State<Dean_rspchome> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => View_request()));
                },
                child: Text(
                  'View request',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 81, 152, 210)),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Upload_project()));
                },
                child: Text(
                  'Upload Project',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 81, 152, 210)),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //    Padding(
          //   padding: const EdgeInsets.all(40.0),
          //   child: SizedBox(
          //     width: 30,
          //     child: ElevatedButton(
          //           onPressed: () {},
          //           child: Text(
          //             'Issue NOC',
          //             style: TextStyle( color: Colors.white),
          //           ),
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: Color.fromARGB(255, 81, 152, 210)
          //           ),
          //         ),
          //   ),
          // ),
        ]));
  }
}
