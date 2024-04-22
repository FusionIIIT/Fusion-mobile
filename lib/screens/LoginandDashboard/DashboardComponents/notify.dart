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
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/notification.dart' as notif;
import 'package:intl/intl.dart';

class Notify extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List<notif.Notification> _notifications = [];
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
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
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
      print("gfsgsgd");
      Response response = await dashboardService.getNotification();
      print("1");
      Response response2 = await profileService.getProfile();
      print("2");
      // print(response);
      print(response2);

      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        _notifications = notif.Notification.fromListJson(jsonDecode(response.body)['notifications']);
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
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
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Notifications",

        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
          MyBottomNavigationBar(), // This is sideDrawer used in all modules
      body: _loading
    ? Center(child: CircularProgressIndicator())
    : ListView.builder(
        itemCount: _notifications.length,
        padding: EdgeInsets.all(8.0), // Add padding around the list for better spacing
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          final formattedDate = notification.timestamp != null
              ? DateFormat('yyyy-MM-dd – kk:mm').format(notification.timestamp!)
              : "No Date";

          return Card(
            elevation: 4.0, // Adjust the shadow's elevation
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0), // Spacing between cards
            child: ListTile(
              leading: Icon(notification.unread ?? false ? Icons.notifications_active : Icons.notifications_off),
              title: Text(notification.verb ?? "No Title"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      notification.description ?? "No Description",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(formattedDate, textAlign: TextAlign.right),
                ],
              ),
              onTap: () {
                // Handle tap
              },
            ),
          );
        },
      ),


    );
  }

  @override
  void dispose() {
    _dashboardController.close();
    super.dispose();
  }
}