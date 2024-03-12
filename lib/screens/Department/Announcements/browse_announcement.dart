import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/Department/Announcements/make_announcement.dart';
import 'package:fusion/services/department_service.dart';

class BrowseAnnouncementScreen extends StatefulWidget {
  @override
  _BrowseAnnouncementScreenState createState() =>
      _BrowseAnnouncementScreenState();
}

class _BrowseAnnouncementScreenState extends State<BrowseAnnouncementScreen> {
  ProfileData? data;
  final DepartmentService _departmentService = DepartmentService();
  final StreamController<List<Map<String, String>>> _announcementsController =
      StreamController<List<Map<String, String>>>();

  Stream<List<Map<String, String>>> get announcementsStream =>
      _announcementsController.stream;

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;
    _loadAnnouncements();
  }

  void _loadAnnouncements() async {
    try {
      http.Response jsonResponse = await _departmentService.getAnnouncements();

      print('API Response Status Code: ${jsonResponse.statusCode}');
      print('API Response Body: ${jsonResponse.body}');

      List<dynamic> jsonData = json.decode(jsonResponse.body);

      List<Announcement> announcements = jsonData.map((item) {
        return Announcement.fromJson(item);
      }).toList();
      print('Announcements: $announcements');

      _announcementsController.add(announcements.map((announcement) {
        return {
          'ann_date': announcement.ann_date,
          'maker_id': announcement.maker_id,
          'programme': announcement.programme,
          'batch': announcement.batch,
          'message': announcement.message,
          'upload_announcement': announcement.upload_announncement,
        };
      }).toList());
    } catch (error) {
      print('Error loading announcements: $error');
    }
  }

  @override
  void dispose() {
    _announcementsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? userRole = data?.profile?['user_type'];
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (userRole != null && userRole != 'student')
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MakeAnnouncementScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.add, size: 20), // Set font size here
                    ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BrowseAnnouncementScreen(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'Announcements',
                      style: TextStyle(fontSize: 18), // Set font size here
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, String>>>(
              stream: announcementsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 84, 83, 83),
                        ), // Black background for column names
                        columns: [
                          DataColumn(
                            label: Text(
                              'Announcement Date',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Announcement By',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Programme',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Batch',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'File',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        rows: snapshot.data!
                            .map(
                              (announcement) => DataRow(
                                cells: [
                                  DataCell(
                                      Text(announcement['ann_date'] ?? '')),
                                  DataCell(
                                      Text(announcement['maker_id'] ?? '')),
                                  DataCell(
                                      Text(announcement['programme'] ?? '')),
                                  DataCell(Text(announcement['batch'] ?? '')),
                                  DataCell(Text(announcement['message'] ?? '')),
                                  DataCell(Text(announcement['file'] ?? '')),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
