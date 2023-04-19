import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion/models/notification.dart' as notif;
import 'package:fusion/services/dashboard_service.dart';

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

class InfoCard extends StatefulWidget {
  final notif.Notification notification;

  InfoCard({
    required this.notification,
  });

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
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
            widget.notification.data!["module"],
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
              widget.notification.verb!,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            child: widget.notification.unread!
                ? Text('Mark As Read')
                : Text('Mark As Unread'),
            onPressed: () {
              // Respond to button press
              DashboardService service = DashboardService();
              setState(() {
                try {
                  service.markRead(widget.notification.id!.toString());
                } catch (e) {}
              });
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
        ],
      ),
    );
  }
}
