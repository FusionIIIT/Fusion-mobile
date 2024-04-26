import 'dart:async';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/department_service.dart';
import 'package:fusion/screens/Department/Announcements/make_announcement.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowseAnnouncement extends StatefulWidget {
  @override
  _BrowseAnnouncementState createState() => _BrowseAnnouncementState();
}

enum AnnouncementSortingCriteria { date, announcementBy }

class WebViewer extends StatefulWidget {
  final String url;
  const WebViewer({Key? key, required this.url}) : super(key: key);
  @override
  _WebViewerState createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Viewer'),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
// String _getUsername(String makerId) {
//   var profile = data!.profile;
//   if (profile != null && profile['id'] == makerId) {
//     var user = data!.user;
//     if (user != null) {
//       return user['username'] ?? '';
//     }
//   }
//   return '';
// }

class _BrowseAnnouncementState extends State<BrowseAnnouncement>
    with SingleTickerProviderStateMixin {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  ProfileData? data;
  late TabController _tabController;
  List<String> departmentOptions = ['All', 'CSE', 'ECE', 'ME', 'SM'];
  final StreamController<List<Announcement>> _announcementsController =
      StreamController<List<Announcement>>();
  AnnouncementSortingCriteria? _sortingCriteria;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: departmentOptions.length,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0; // Initialize the index
    var service = locator<StorageService>();
    data = service.profileData;
    _loadAnnouncements();
  }

  void _handleTabSelection() {
    setState(() {
      _loadAnnouncements();
    });
  }

  void _loadAnnouncements() async {
    int selectedIndex = _tabController.index;
    String department = departmentOptions[selectedIndex];
    List<Announcement> announcements =
        await DepartmentService().getDepartmentsAnnouncements(department);
    _sortAnnouncements(announcements);
  }

  void _sortAnnouncements(List<Announcement> announcements) {
    if (_sortingCriteria == AnnouncementSortingCriteria.date) {
      announcements.sort((a, b) =>
          DateTime.parse(a.ann_date).compareTo(DateTime.parse(b.ann_date)));
    } else if (_sortingCriteria == AnnouncementSortingCriteria.announcementBy) {
      announcements.sort((a, b) => a.maker_id.compareTo(b.maker_id));
    }
    if (!_isAscending) {
      announcements = announcements.reversed.toList();
    }
    _announcementsController.add(announcements);
  }

  void _toggleSortOrder() {
    setState(() {
      _isAscending = !_isAscending;
    });
    _loadAnnouncements();
  }

  void _setSortingCriteria(AnnouncementSortingCriteria? criteria) {
    setState(() {
      _sortingCriteria = criteria;
    });
    _loadAnnouncements();
  }

  @override
  void dispose() {
    _announcementsController.close();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? userRole = data?.profile?['user_type'];
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Department",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: departmentOptions
                  .map((department) => Tab(
                        text: department,
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (userRole == 'faculty')
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MakeAnnouncement(),
                      ),
                    );
                  },
                  child: Icon(Icons.add, size: 20),
                ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _loadAnnouncements();
                },
                child: Text(
                  'Announcements',
                  style: TextStyle(fontSize: 18), // Set font size here
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButton<AnnouncementSortingCriteria>(
                    hint: Text('Sort by'),
                    value: _sortingCriteria,
                    onChanged: _setSortingCriteria,
                    items: [
                      DropdownMenuItem(
                        child: Text('Sort by Date'),
                        value: AnnouncementSortingCriteria.date,
                      ),
                      DropdownMenuItem(
                        child: Text('Sort by Announcement By'),
                        value: AnnouncementSortingCriteria.announcementBy,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                    _isAscending ? Icons.arrow_upward : Icons.arrow_downward),
                onPressed: _toggleSortOrder,
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: StreamBuilder<List<Announcement>>(
                      stream: _announcementsController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      'Announcement Date',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Announcement By',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Programme',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Batch',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Message',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'File',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                                rows: snapshot.data!
                                    .map(
                                      (announcement) => DataRow(
                                        cells: [
                                          DataCell(Text(
                                              DateFormat('MMM. dd, yyyy')
                                                  .format(DateTime.parse(
                                                      announcement.ann_date)))),
                                          DataCell(Text(announcement.maker_id)),
                                          // DataCell(Text(_getUsername(announcement
                                          //     .maker_id))), // Updated line
                                          DataCell(
                                              Text(announcement.programme)),
                                          DataCell(Text(announcement.batch)),
                                          DataCell(Container(
                                            width: 250,
                                            child: Text(
                                              announcement.message,
                                              softWrap: true,
                                            ),
                                          )),
                                          DataCell(
                                            announcement.upload_announcement !=
                                                    null
                                                ? TextButton(
                                                    onPressed: () {
                                                      String? fileUrl =
                                                          announcement
                                                              .upload_announcement;
                                                      if (fileUrl != null &&
                                                          fileUrl.isNotEmpty) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    WebViewer(
                                                              url: fileUrl,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      'Open File',
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
