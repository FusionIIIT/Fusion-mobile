import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin:
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InfoCard(heading: "Scholarship Portal", details: "Invitation to apply for Merit-cum-Means Scholarship-by Dr. YashPalSingh Katharria"),
          InfoCard(heading: "Gymkhana Module", details: "Mega Event by Saaz Club Will be organized in L-102 by Kuhu Pyasi"),
          InfoCard(heading: "Gymkhana Module", details: "Badminton Session Will be organised in SAC"),

        ],
      ),
    );
  }
}
class NewsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin:
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: Colors.black,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InfoCard(heading: "Academics News", details: "End Sem Exams Coming Soon"),


        ],
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  final String heading;
  final String details;
  InfoCard({this.heading,this.details});
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
            heading,
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
              details,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            child: Text('Mark As Read'),
            onPressed: () {
              // Respond to button press
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.deepOrange;
                  return Colors.deepOrangeAccent; // Use the component's default.
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}