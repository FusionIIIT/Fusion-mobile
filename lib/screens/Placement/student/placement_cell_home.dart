import 'package:flutter/material.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/placement.dart';
import 'package:fusion/services/placement_service.dart';
import 'package:fusion/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class PlacementHomePage extends StatefulWidget {
  final String? token;
  static String tag = 'placement-page';
  PlacementHomePage(this.token);

  @override
  _PlacementHomePageState createState() => _PlacementHomePageState();
}

class _PlacementHomePageState extends State<PlacementHomePage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  bool _loading1 = true;
  late StreamController _placementController;
  late PlacementService placementService;
  late List<PlacementRecord> list;

  @override
  void initState() {
    super.initState();
    _placementController = StreamController();
    placementService = PlacementService();
    getPlacementDataStream();
  }

  getPlacementDataStream() async {
    try {
      Response response =
          await placementService.getPlacementRecord(widget.token!);
      setState(() {
        // print(response.body);
        var data = json.decode(response.body);
        var rest = data["placementrecord"] as List;
        print(rest);
        list = rest
            .map<PlacementRecord>((json) => PlacementRecord.fromJson(json))
            .toList();
        print(list[0].name);
        // print("list size : ${list.length}");
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getPlacementDataStream().then((res) {
      _placementController.add(res);
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
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: myBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Placement Cell Home",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                        size: Size.fromRadius(100),
                        // Image radius
                        child: Image.asset('assets/profile_pic.png',
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Column(
                children: [
                  Row(children: [
                    ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/profile');
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text("View Profile")),
                  
                  ]),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/placement_cell_home/placement_notification');
                  },
                  icon: const Icon(Icons.notifications),
                  label: const Text("View Notifications")),
                  
                      // Text("View Notification"),
                      // IconButton(
                      //   icon: Icon(Icons.notifications),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, 'notifications-page');
                      //   },
                      //   tooltip: 'View Notifications',
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'placement_cell_home/view_jobs/jobs');
                  },
                  icon: const Icon(Icons.card_travel_rounded),
                  label: const Text("Job Invitation")),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        'placement_cell_home/view_statistics/statistics');
                  },
                  icon: const Icon(Icons.checklist_rtl_rounded),
                  label: const Text("View Statistics")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'placement_cell_home/create_resume/resume_landing');
                  },
                  icon: const Icon(Icons.assignment_rounded),
                  label: const Text("Create Resume")),
                  ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'placement_cell_home/view_schedules/schedule');
                  },
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: const Text("View Schedule")),
            
            ],
          ),
          
        ]),
      ),
    );
  }
}

