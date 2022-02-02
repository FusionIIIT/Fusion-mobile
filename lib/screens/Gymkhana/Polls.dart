import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Polls extends StatelessWidget {
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
  final List<String> Manu = ["Name", "Result", "Expired"];
  String selected = "Name";
  String select = "Test Polls";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Voting Polls',
            style: TextStyle(fontSize: 25),
          ),
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
                        "Active Polls",
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
            Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButton<String>(
                              hint: Text(" Name"),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                              onChanged: (value) {
                                setState(() {});
                              },
                              items:
                                  Manu.map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButton<String>(
                              hint: Text(" Test "),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                              onChanged: (value) {
                                setState(() {});
                              },
                              items:
                                  Manu.map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButton<String>(
                              hint: Text(" Test Polls"),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                              onChanged: (value) {
                                setState(() {});
                              },
                              items:
                                  Manu.map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
