import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/models/department.dart';
import 'package:fusion/services/announcement_service.dart';
import 'package:fusion/Components/pdf_view.dart';

class AnnouncementTable extends StatefulWidget {
  @override
  _AnnouncementTableState createState() => _AnnouncementTableState();
}

class _AnnouncementTableState extends State<AnnouncementTable> {
  late Future<List<Announcements>> _announcementsFuture;
  bool _loading = true;
  late ProfileService profileService;
  late String user_type = "";
  late ProfileData data2;
  late AnnouncementService announcementService;
  // late Announcements announcementsData;
  @override
  void initState() {
    super.initState();
    profileService =
        ProfileService(); // calling profile service to get user's data
    announcementService = AnnouncementService();
    getData();
    print(user_type);
    _announcementsFuture = _fetchAnnouncements();
  }

  getData() async {
    try {
      Response response2 = await profileService.getProfile();
      setState(() {
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });

      user_type = data2.profile!['user_type'];
    } catch (e) {
      print(e);
    }
  }

  Future<List<Announcements>> _fetchAnnouncements() async {
    // fetch the announcements from the server
    // replace this with your actual API call
    print("___trying to fetch data");
    late Future<List<Announcements>> data =
        announcementService.fetchAnnouncements();
    print(data);
    await Future.delayed(Duration(seconds: 2)); // simulate network delay
    if (data != null)
      return data;
    else
      return [
        Announcements(
          makerId: "Atul Gupta",
          annDate: DateTime.parse('2023-04-01T12:00:00Z'),
          message: "Lorem ipsum dolor sit amet.",
          batch: "2021",
          department: "Computer Science",
          programme: "B.Tech",
          uploadAnnouncement: "https://example.com/announcement1.pdf",
          id: '1',
        ),
        Announcements(
          makerId: "Irshad Ahmad Ansari",
          annDate: DateTime.parse('2023-04-02T12:00:00Z'),
          message: "Consectetur adipiscing elit.",
          batch: "2022",
          department: "Information Technology",
          programme: "M.Tech",
          uploadAnnouncement: null,
          id: '1',
        ),
        Announcements(
          makerId: "V.K Jain",
          annDate: DateTime.parse('2023-04-03T12:00:00Z'),
          message:
              "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          batch: "2023",
          department: "Data Science",
          programme: "Ph.D",
          uploadAnnouncement: "https://example.com/announcement3.pdf",
          id: '1',
        ),
      ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Center(
        child: Column(children: [
          if (user_type == 'faculty' || user_type == 'Admin') ...[
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 102, 243, 106)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 251, 253, 254)),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "/department_homepage/postannouncement");
                },
                child: Text(
                  "Post Announcement",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
          Expanded(
              child: FutureBuilder<List<Announcements>>(
            future: _announcementsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // show a loading indicator while fetching the announcements
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // show an error message if there was an error fetching the announcements
                return Text("Error: ${snapshot.error}");
              } else {
                // show the table of announcements
                final announcements = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: Text(
                                "Announcement Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: Text(
                                "Announcement By",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: Text(
                                "Programme",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: Text(
                                "Batch",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 200, // set the desired width
                              child: Text(
                                "Message",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: Text(
                                "File",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ),
                          numeric: true,
                        ),
                      ],
                      rows: announcements.map((announcement) {
                        return DataRow(cells: [
                          DataCell(
                            Flexible(
                              child: SizedBox(
                                width: 100, // set the desired width
                                child: Text(
                                  announcement.annDate.toString(),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Flexible(
                              child: SizedBox(
                                width: 100, // set the desired width
                                child: Text(
                                  announcement.makerId,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Flexible(
                              child: SizedBox(
                                width: 100, // set the desired width
                                child: Text(
                                  announcement.programme,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Flexible(
                              child: SizedBox(
                                width: 100, // set the desired width
                                child: Text(
                                  announcement.batch,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Flexible(
                              child: SizedBox(
                                width: 200, // set the desired width
                                child: Text(
                                  announcement.message,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Flexible(
                            child: SizedBox(
                              width: 100, // set the desired width
                              child: announcement.uploadAnnouncement != null
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewerFromUrl(
                                              url: announcement
                                                      .uploadAnnouncement ??
                                                  "",
                                              label: announcement.message,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text('view'),
                                    )
                                  : Text("N/A"),
                            ),
                          )),
                        ]);
                      }).toList(),
                    ),
                  ),
                );
              }
            },
          ))
        ]),
      ),
    );
  }
}
