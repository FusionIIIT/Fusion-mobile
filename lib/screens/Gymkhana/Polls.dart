import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Polls extends StatefulWidget {
  @override
  _PollsState createState() => _PollsState();
}

class _PollsState extends State<Polls> {
  @override
  Widget build(BuildContext context) {
    return VotingPolls();
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
          title: Text(
              'Voting Polls',
            style: TextStyle(fontSize: 25),),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                            "Voting Polls",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      border: new Border.all(
                        color: Colors.deepOrange,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        )
                      ],
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
            ),
            Text('Test Polls',
            style: TextStyle(fontSize: 10))
          ],
        ));
  }
}
