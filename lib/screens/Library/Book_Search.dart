// @dart=2.9

import 'package:flutter/material.dart';
import 'side_drawer.dart';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'FUSION',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Search By Book Name',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 28),
            Container(
              width: 420,
              child: TextField(
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusColor: Colors.deepOrange,
                    labelText: 'Enter Book Name',
                    labelStyle: TextStyle(color: Colors.deepOrange)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              child: RaisedButton(
                padding: const EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.orangeAccent,
                hoverElevation: 10.0,
                hoverColor: Colors.white,
                onPressed: () => null,
                child: Text('Search', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Search By Author Name',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 28),
            Container(
              width: 420,
              child: TextField(
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusColor: Colors.deepOrange,
                    labelText: 'Enter Author Name',
                    labelStyle: TextStyle(color: Colors.deepOrange)),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 150,
              child: RaisedButton(
                padding: const EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.orangeAccent,
                hoverElevation: 10.0,
                hoverColor: Colors.white,
                onPressed: () => null,
                child: Text('Search', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
