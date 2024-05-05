
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/screens/LoginandDashboard/DashboardComponents/cardItems.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/appBar_services.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class FlowChartPage extends StatefulWidget {
  static String tag = 'home-page';
  FlowChartPage();
  @override
  _FlowChartPageState createState() => _FlowChartPageState();
}

class _FlowChartPageState extends State<FlowChartPage> {
  bool _notificationsBool = false;
  bool _newsBool = false;
  bool _announcementsBool = false;
  bool _homeBool = true;

  bool _loading = true;
  late String name;
  late String studentType;
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  late List<String> designationsArray;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool isStudent = false;

  final appBarServices _appBarServices = appBarServices();
  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {

      Response response = await dashboardService.getDashboard();
      print("1");
      Response response2 = await profileService.getProfile();
      print("2");
      print(response);
      print(response2);

      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      print(data2.user!);
      print(
          '-----------------------------------=---------------------------------------');
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'];

      if (data2.profile!['user_type'] == 'student') {
        isStudent = true;
      }
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  fetchDesignations() async {
    try {
      designationsArray = await _appBarServices.getDesignations();
    } catch (e) {
      print("Error fetching designations: $e");
      return null;
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('New Content Loaded'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

     if (curr_desig == "ps_admin") {
    Future.delayed(Duration.zero, () {
    Navigator.pushNamed(
    context,
    '/purchase_store/psadmin',
    arguments: data,
    );
    });
    }


   else if (curr_desig.contains('admin')) {
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(
          context,
          '/purchase_store/admin',
          arguments: data,
        );
      });
    }


    // Check if the current designation is "professor" and navigate automatically
    else if (curr_desig.contains("Professor")) {
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(
          context,
          '/purchase_store/employee',
          arguments: data,
        );
      });
    }

    // Check if the current designation is "professor" and navigate automatically



    // Check if the current designation is "professor" and navigate automatically
    else if (curr_desig.contains("HOD") || curr_desig == "Director") {
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(
          context,
          '/purchase_store/head',
          arguments: data,
        );
      });
    }


    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Purchase And Store",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Appropriate Designation",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/purchase_store_homepage',
                  arguments: data,
                );
              },
              child: Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }




  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}