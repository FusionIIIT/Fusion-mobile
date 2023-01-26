import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget feed = Container(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        TextFormField(
          maxLines: 8,
          cursorHeight: 30,
          decoration: new InputDecoration(
            labelText: "Feedback",
            fillColor: Colors.white,
            border: new OutlineInputBorder(),
            //fillColor: Colors.green
          ),
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Center(
          child: TextButton(
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 15.0),
            ),
            //color: Colors.deepOrangeAccent,
            onPressed: () {},
          ),
        ),
      ],
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Health Center"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 1, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          //color: Colors.deepOrangeAccent,
                          child: TabBar(
                            labelColor: Colors.deepOrange,
                            indicatorColor: Colors.deepOrangeAccent,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Feedback Form",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 520, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              feed,
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
