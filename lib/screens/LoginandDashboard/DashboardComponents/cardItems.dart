import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion/models/notification.dart' as notif;

class NotificationCard extends StatelessWidget {
  final List<notif.Notification>? notifications;

  const NotificationCard({Key? key, required this.notifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getCards(),
      ),
    );
  }

  getCards() {
    List<Widget> cards = [];
    for (int i = 0; i < notifications!.length; i++) {
      cards.add(InfoCard(
        notification: notifications![i],
      ));
    }
    return cards;
  }
}

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 3.0,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Work in progress'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final notif.Notification notification;

  InfoCard({
    required this.notification,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      shadowColor: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            notification.data!["module"],
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              notification.verb!,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          notification.unread!
              ? ElevatedButton(
                  child: Text('Mark As Read'),
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.deepOrange;
                        return Colors
                            .deepOrangeAccent; // Use the component's default.
                      },
                    ),
                  ),
                )
              : ElevatedButton(
                  child: Text('Mark As Unead'),
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.deepOrange.shade50;
                        return Colors
                            .deepOrangeAccent; // Use the component's default.
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
