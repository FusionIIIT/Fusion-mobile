import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/screens/FileTracking/Archive_file/archive_file.dart';
import 'package:fusion/screens/FileTracking/Create_file/create_file.dart';
import 'package:fusion/screens/FileTracking/View_drafts/view_drafts.dart';
import 'package:fusion/screens/FileTracking/View_inbox/view_inbox.dart';
import 'package:fusion/screens/FileTracking/View_outbox/view_outbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Complaint/complaint.dart';

class RoundedListView extends StatefulWidget {
  @override
  _RoundedListViewState createState() => _RoundedListViewState();
}

class _RoundedListViewState extends State<RoundedListView> {
  late var curr_desig=service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "File Traking System",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      body: Column(
        children: [
          FutureBuilder(
            future: getUsername(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final username = snapshot.data.toString();
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Divider(thickness: 1.0, color: Colors.grey[300]),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              final items = [
                'Compose File',
                'Drafts',
                'Archive',
                'Outbox',
                'Inbox'
              ];
              final paths = [
                '/create_file',
                '/view_drafts',
                '/archive_file',
                '/view_outbox',
                '/view_inbox',
              ];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCC7231),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(items[index]),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () async {
                            final username = await getUsername();
                            switch (paths[index]) {
                              case '/create_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CreateFilePage(username: username)),
                                );
                                break;
                              case '/view_drafts':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DraftsPage(username: username)),
                                );
                                break;
                              case '/view_inbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InboxPage(username: username)),
                                );
                                break;
                              case '/archive_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ArchivePage(username: username,)),
                                );
                                break;
                              case '/view_outbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OutboxPage(username: username)),
                                );
                                break;
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<String> getUsername() async {
    final userService = UserService();
    final username = await userService.getUsername();
    return username;
  }
}

class UserService {
  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    return username ?? '';
  }
}
