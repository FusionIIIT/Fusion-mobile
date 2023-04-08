import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/Gymkhana/clubsession.dart';
import 'package:fusion/models/gymkhana.dart';

class Club extends StatefulWidget {
  const Club({Key? key}) : super(key: key);

  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  // static const IconData attachment_sharp =
  // IconData(0xeb6a, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final GymkhanaData data =
        ModalRoute.of(context)!.settings.arguments as GymkhanaData;

    return DefaultTabController(
      length: 3, // length of tabs
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('View Club Details'),
          bottom: TabBar(
            labelColor: Colors.deepOrange,
            indicatorColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Club Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Tab(
                child: Text(
                  "Club Session",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Tab(
                child: Text(
                  "Club Event",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
          child: TabBarView(
            children: <Widget>[
              
              clubDetails(data.clubDetails),
              //DropDownDemo(),
              //Center(child: Text("Working on...."),),
              ClubSession(data: data.clubSessions),
              clubEvents(data.clubEvents),
            ],
          ),
        ),
      ),
    );
  }

  Widget clubEvents(data) {
    
    TableRow header = TableRow(children: [

      Center(
        child: Text("\nClub\n",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis)),
      ),
      Center(
        child: Text("\nEvent Name\n",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis)),
      ),
      Center(
        child: Text("\nIncharge\n",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis)),
      ),
      Center(
        child: Text("\nDate\n",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis)),
      ),
    ]);
    List<TableRow> rows = data!
        .map<TableRow>((srecord) => TableRow(children: [
              Center(
                  child: Text(
                "\n" + srecord['club'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  child: Text(
                "\n" + srecord['eventname'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  child: Text(
                "\n" + srecord['incharge'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  child: Text(
                "\n" + srecord['date'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
            ]))
        .toList();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          [header],
          rows
        ].expand((x) => x).toList(),
      ),
    );
  }

  Widget clubDetails(data) {
    
    TableRow header = TableRow(children: [
      Center(
        child: Text("\nClub\n",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis)),
      ),
      Center(
          child: Column(
        children: [
          Center(
            child: Text("\nCo-",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
          Center(
            child: Text("Ordinator\n",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
        ],
      )),
      Center(
          child: Column(
        children: [
          Center(
            child: Text("\nCo-",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
          Center(
            child: Text("Coordinator\n",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
        ],
      )),
      Center(
          child: Column(
        children: [
          Center(
            child: Text("\nActivity",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
          Center(
            child: Text("Calender\n",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
        ],
      )),
    ]);

    List<TableRow> rows = data!
        .map<TableRow>((srecord) => TableRow(children: [
              Center(
                  child: Text(
                "\n" + srecord['club'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  child: Text(
                "\n" + srecord['coord'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  child: Text(
                "\n" + srecord['coco'] + "\n",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
              Center(
                  // child: Text("\n"+srecord['activitycal']+"\n", style: TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,)),
                  child: IconButton(
                      icon: Icon(Icons.attachment_sharp), onPressed: null)),
            ]))
        .toList();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          [header],
          rows
        ].expand((x) => x).toList(),
      ),
    );
  }
}
