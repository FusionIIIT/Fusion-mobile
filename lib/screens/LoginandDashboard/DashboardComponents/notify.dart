import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/models/notification.dart' as notif;
import 'package:fusion/services/dashboard_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

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
      final response = await dashboardService.getNotification();
      final response2 = await profileService.getProfile();

      if (response != null && response2 != null) {
        setState(() {
          data = DashboardData.fromJson(jsonDecode(response.body!));
          _notifications = notif.Notification.fromListJson(
              jsonDecode(response.body!)['notifications']);
          data2 = ProfileData.fromJson(jsonDecode(response2.body!));
          _loading = false;
        });
        name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
        studentType = data2.profile!['department']!['name']! +
            '  ' +
            data2.profile!['user_type']!;
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void markAsRead(int index) {
    setState(() {
      _notifications[index].unread = false;
    });
  }

  void markAsUnread(int index) {
    setState(() {
      _notifications[index].unread = true;
    });
  }

  Future<void> deleteNotification(String id) async {
    try {
      final response = await dashboardService.deleteNotification(id);

      if (response != null && response.statusCode == 200) {
        // If deletion successful, remove the notification from the list
        // Show a snackbar to indicate successful deletion
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification deleted successfully'),
          ),
        );
        setState(() {
          _notifications.removeWhere((notification) => notification.id.toString() == id);

        }); // Trigger a rebuild to reflect the changes
      } else {
        throw Exception('Failed to delete notification');
      }
    } catch (e) {
      print(e);
      // Show a snackbar to indicate deletion failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete notification'),
        ),
      );
    }
  }

  Future<void> toggleNotificationReadStatus(int index, String id, bool currentStatus) async {
    try {
      // Toggle the unread status
      final newStatus = !currentStatus;

      final response = await dashboardService.markNotificationAsRead(id);
      if (response != null && response.statusCode == 200) {
        // Show a snackbar to indicate successful marking
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification marked as ${newStatus ? 'unread' : 'read'}'),
          ),
        );

        // Update the unread status in the notifications list
        setState(() {
          _notifications[index].unread = newStatus;
        });
      } else {
        throw Exception('Failed to mark notification as ${newStatus ? 'unread' : 'read'}');
      }
    } catch (e) {
      print(e);
      // Show a snackbar to indicate marking failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to mark notification'),
        ),
      );
    }
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
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : AnimatedSwitcher(
        key: UniqueKey(), // Ensure the key is unique
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _notifications.isEmpty
            ? Center(
          child: Text(
            'No notifications',
            style: TextStyle(fontSize: 18),
          ),
        )
            : ListView.builder(
          itemCount: _notifications.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            final notification = _notifications[index];
            final formattedDate = notification.timestamp != null
                ? DateFormat('yyyy-MM-dd – kk:mm').format(notification.timestamp!)
                : "No Date";

            final title = notification.data?['module'] ?? "No Module";
            final description = notification.verb ?? "No Verb";

            return Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
              child: ListTile(
                leading: Icon(
                  notification.unread ?? false ? Icons.notifications_active : Icons.notifications_off,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description),
                    SizedBox(height: 4),
                    Text(
                      formattedDate,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await deleteNotification(notification.id.toString());
                      },
                    ),
                    IconButton(
                      icon: notification.unread ?? false
                          ? Icon(Icons.mark_email_unread)
                          : Icon(Icons.mark_email_read),
                      onPressed: () {
                        toggleNotificationReadStatus(
                          index,
                          notification.id.toString(),
                          notification.unread ?? false,
                        );
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Handle tap
                },
              ),
            );
          },
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
