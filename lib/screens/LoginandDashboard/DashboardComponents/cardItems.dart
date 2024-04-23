import 'package:flutter/material.dart';
import 'package:fusion/models/notification.dart' as notif;
import 'package:fusion/services/dashboard_service.dart';

class NotificationCard extends StatelessWidget {
  final List<notif.Notification>? notifications;

  const NotificationCard({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,
      child: SingleChildScrollView( // Added to allow scrolling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getCards(),
        ),
      ),
    );
  }

  List<Widget> getCards() {
    // Transforming the notifications into InfoCard widgets
    return notifications!.map((notif.Notification notification) {
      return InfoCard(
        notification: notification,
      );
    }).toList();
  }
}

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
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

  const InfoCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      shadowColor: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Text(
            widget.notification.data!["module"],
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.notification.verb!,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            child: Text(widget.notification.unread! ? 'Mark As Read' : 'Mark As Unread'),
            onPressed: () {
              // Respond to button press
              DashboardService service = DashboardService();
              setState(() {
                try {
                  service.markNotificationAsRead(widget.notification.id!.toString());
                } catch (e) {
                  print(e);
                }
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) return Colors.deepOrange;
                  return Colors.deepOrangeAccent; // Default Color
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
