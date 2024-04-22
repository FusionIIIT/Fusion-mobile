import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class Noticeboard extends StatelessWidget {
  final List<Map<String, dynamic>> notices = [
    {
      "hall": "4",
      "heading": "Annual Sports Meet",
      "madeBy": {
        "name": "John Doe",
        "rollNo": "21bcs001"
      },
      "description": "Get ready for an action-packed day of sports!",
      "content": [
        "Date: April 25, 2024",
        "Venue: Sports Ground",
        "Events: Football, Cricket, Badminton, and more"
      ]
    },
    {
      "hall": "3",
      "heading": "Guest Lecture on AI",
      "madeBy": {
        "name": "Jane Smith",
        "rollNo": "21bcs002"
      },
      "description": "Learn about the latest advancements in Artificial Intelligence.",
      "content": [
        "Speaker: Dr. Michael Johnson",
        "Date: May 5, 2024",
        "Time: 10:00 AM - 12:00 PM",
        "Venue: Lecture Hall 1"
      ]
    },
    {
      "hall": "2",
      "heading": "Web Development Workshop",
      "madeBy": {
        "name": "Alice Lee",
        "rollNo": "21bcs003"
      },
      "description": "Enhance your web development skills with hands-on sessions.",
      "content": [
        "Date: May 15, 2024",
        "Time: 9:00 AM - 5:00 PM",
        "Venue: Computer Lab 3",
        "Topics: HTML, CSS, JavaScript"
      ]
    },
    {
      "hall": "1",
      "heading": "Cultural Night",
      "madeBy": {
        "name": "David Brown",
        "rollNo": "21bcs004"
      },
      "description": "Join us for an evening of music, dance, and fun!",
      "content": [
        "Date: June 10, 2024",
        "Time: 6:00 PM onwards",
        "Venue: Auditorium",
        "Performances: Music bands, Dance groups, Comedy acts"
      ]
    },
    {
      "hall": "5",
      "heading": "Congratulations to Toppers",
      "madeBy": {
        "name": "Emily Taylor",
        "rollNo": "21bcs005"
      },
      "description": "Celebrating the academic excellence of our top performers!",
      "content": [
        "Top Scorers: John Smith, Alice Johnson, Michael Lee",
        "Subject Toppers: Mathematics, Physics, Computer Science",
        "Prize Distribution Ceremony: June 5, 2024"
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Notice Board'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  _showNoticeDetails(context, notices[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notices[index]['heading'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Made By: ${notices[index]['madeBy']['name']} - ${notices[index]['madeBy']['rollNo']}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        notices[index]['description'],
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showNoticeDetails(BuildContext context, Map<String, dynamic> notice) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(notice['heading']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Description: ${notice['description']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ...List<Widget>.from(notice['content']
                  .map((content) => Text(content))),
              SizedBox(height: 8),
              Text(
                'Made By: ${notice['madeBy']['name']} - ${notice['madeBy']['rollNo']}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Noticeboard(),
  ));
}
