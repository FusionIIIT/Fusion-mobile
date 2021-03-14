import 'package:flutter/material.dart';

class Clubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clubs'),
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
                            "Name",
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
            TextField()
          ],
        ));
  }
}
