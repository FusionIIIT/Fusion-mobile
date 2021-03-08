import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Polls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VotingPolls(),
    );
  }
}

class VotingPolls extends StatefulWidget {
  @override
  VotingPollsState createState() => VotingPollsState();
}

class VotingPollsState extends State<VotingPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Voting Polls'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(5.0),
                  child: Text("Voting Polls", style: TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
            TextField()
          ],
        ));
  }
}
