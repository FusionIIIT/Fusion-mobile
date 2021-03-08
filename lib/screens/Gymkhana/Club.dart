// @dart=2.9

import 'package:flutter/material.dart';

 class Clubs extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title : Text('Clubs'),
           backgroundColor: Colors.black,
         ),
         body: Column(
           children: <Widget>[
             Padding(
               padding: EdgeInsets.all(5.0),
               child: Center(
                 child:Container(
                   margin: EdgeInsets.all(10.0),
                   color: Colors.grey[300],
                   padding:EdgeInsets.all(5.0),
                   child: Text("Name",
                       style: TextStyle(fontSize: 25.0)),
                 ),  ),
             ),
            TextField()
          ],
         )

     );
   }
 }