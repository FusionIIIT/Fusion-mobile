import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/RSPC/Staff_form.dart';
import 'package:fusion/screens/RSPC/closure_report.dart';
import 'package:fusion/screens/RSPC/view_inventory.dart';
import 'package:fusion/screens/RSPC/request_requirement.dart';
import 'package:fusion/screens/RSPC/view_project.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

// ignore: must_be_immutable
class RspcHome extends StatefulWidget {
  RspcHome({Key? key}) : super(key: key);

  @override
  State<RspcHome> createState() => _RspcHomeState();
}

class _RspcHomeState extends State<RspcHome> {
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
  // Widget build(BuildContext context) {
  //   // return Scaffold(
  //   //   body: Column(children: [
  //   //     Container(
  //   //        height: 300,
  //   //         width: 300,
  //   //         color: Colors.blue,
  //   //     )
  //   //   ]),
  //   // );

  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              Image.asset(
                'assets/mypic.jpg',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  name!,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  depttype!,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.all(8.0),
              //   child: SizedBox(
              //     width: 10,
              //     height: 50,
              //     child: ElevatedButton(
              //         onPressed: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => Closure_report()));
              //         },
              //         child: Text("Closure report"),
              //         style: ElevatedButton.styleFrom(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(5.0)))),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 10,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => View_project()));
                      },
                      child: Text("View Project"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 10,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Staffform()));
                      },
                      child: Text("Request Staff"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: 10,
              //     height: 50,
              //     child: ElevatedButton(
              //         onPressed: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => Request_Requirement()));
              //         },
              //         child: Text("Inbox"),
              //         style: ElevatedButton.styleFrom(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(5.0)))),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 10,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => View_Inventory()));
                      },
                      child: Text("View Inventory"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
