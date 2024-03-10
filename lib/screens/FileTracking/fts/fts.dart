import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/FileTracking/Create_file/create_file.dart';
import 'package:fusion/screens/FileTracking/View_drafts/view_drafts.dart'; 
import 'package:fusion/screens/FileTracking/View_inbox/view_inbox.dart'; 
import 'package:fusion/screens/FileTracking/View_outbox/view_outbox.dart'; 
import 'package:fusion/screens/FileTracking/Track_file/track_file.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class UserService {
  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    return username ?? '';
  }
}

class RoundedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<String> getUsername() async {
      final userService = UserService();
      final username = await userService.getUsername();
      return username;
    }

    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: [
          // User profile view (modify as needed)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://picsum.photos/id/237/200/300"),
                  radius: 30.0,
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PP", style: TextStyle(fontSize: 18.0,color: Colors.grey, fontWeight: FontWeight.bold,     decoration: TextDecoration.none,
)),
                    Text("21BCS329", style: TextStyle(fontSize: 14.0, color: Colors.grey,     decoration: TextDecoration.none,
)),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          Divider(thickness: 1.0, color: Colors.grey[300]),

          // Rounded list view
          ListView.builder(
            shrinkWrap: true, // Prevent scrolling
            itemCount: 5,
            itemBuilder: (context, index) {
              final items = ['Compose File', 'Drafts', 'Track File', 'Outbox', 'Inbox'];
              final paths = [
                '/create_file', // Path for Compose File
                '/view_drafts', // Path for Drafts
                '/track_file', // Path for Track File
                '/view_outbox', // Path for Outbox
                '/view_inbox', // Path for Inbox
              ];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCC7231), // Color code for #CC7231
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index]),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () async {
                            final username = await getUsername();
                            print(username);
                            switch (paths[index]) {
                              case '/create_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CreateFilePage()),

                                );
                                break;
                              case '/view_drafts':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DraftsPage()),
                                );
                                break;
                              case '/view_inbox':
                                // Navigate to your "Inbox" page here
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InboxPage(username: username)),
                                );
                                break;
                              case '/track_file':
                                // Navigate to your "Track File" page here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FileTrackingPage()),
                                );
                                break;
                              case '/view_outbox':
                                // Navigate to your "Outbox" page here
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OutboxPage()),
                                );
                                break;
                            }
                          },
                        ), // Icon color white
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
}
