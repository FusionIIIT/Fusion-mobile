import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/Gymkhana/clubsession.dart';
//import 'ClubSession.dart';

class Club extends StatefulWidget {
  const Club({Key? key}) : super(key: key);

  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  static const IconData attachment_sharp =
      IconData(0xeb6a, fontFamily: 'MaterialIcons');

  //_ClubState(this.dropdownValue);

  Widget clube = new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Center(
            child: Text("\nClub\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text("\nEvent Name\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text("\nIncharge\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text("\nDate\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Text("\nAvartan\n",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Center(
            child: Text("\nFootloose\n", style: TextStyle(fontSize: 16)),
          ),
          Center(
            child: Text("\nDr Deepmala\n",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Center(
            child: Text("\n23 Aug, 20\n", style: TextStyle(fontSize: 16)),
          ),
        ])
      ],
    ),
  );

  Widget clubd = new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Center(
            child: Text("\nClub\n",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Center(
              child: Column(
            children: [
              Center(
                child: Text("\nCo-",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text("Ordinator\n",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
          Center(
              child: Column(
            children: [
              Center(
                child: Text("\nCo-",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text("Coordinator\n",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
          Center(
              child: Column(
            children: [
              Center(
                child: Text("\nActivity",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text("Calender\n",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
        ]),
        TableRow(children: [
          Center(
            child: Text("\nAvartan\n",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Center(
            child: Text("\n2018037\n", style: TextStyle(fontSize: 16)),
          ),
          Center(
            child: Text("\n2019008\n",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Center(
            child:
                IconButton(icon: Icon(Icons.attachment_sharp), onPressed: null),
          ),
        ])
      ],
    ),
  );

////////////

  ////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('View Club Details'),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 3, // length of tabs
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
                                  "Club Details",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Club Session",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Club Event",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 400, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              clubd,
                              //DropDownDemo(),
                              //Center(child: Text("Working on...."),),
                              ClubDropDown(),
                              clube,
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
