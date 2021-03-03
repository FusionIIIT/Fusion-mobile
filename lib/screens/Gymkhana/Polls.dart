import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Polls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Voting_Polls(),
    );
  }
}

 // ignore: camel_case_types
 class Voting_Polls extends StatefulWidget {
   @override
   _Voting_PollsState createState() => _Voting_PollsState();
 }

 class _Voting_PollsState extends State<Voting_Polls> {
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
                 child:Container(
                   margin: EdgeInsets.all(10.0),
                   color: Colors.grey[300],
                   padding:EdgeInsets.all(5.0),
                   child: Text("Voting Polls",
                       style: TextStyle(fontSize: 25.0)),
                 ),  ),
             ),
             TextField()
           ],
         ));
   }
 }


