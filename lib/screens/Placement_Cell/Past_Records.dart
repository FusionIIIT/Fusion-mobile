import 'package:flutter/material.dart';

class PastRecords extends StatefulWidget {
  @override
  State<PastRecords> createState() => _PastRecordsState();
}

class _PastRecordsState extends State<PastRecords> {
  String tab1 = 'Placement';

  String tab2 = 'PBI';

  String tab3 = 'Higher Studies';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              labelColor: Colors.black,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 20.0),
              tabs: [Tab(text: tab1), Tab(text: tab2), Tab(text: tab3)]),
        ),
        body: TabBarView(
          children: [
            PlacementTab(),
            PlacementTab(),
            PlacementTab1(),
          ],
        ),
      ),
    );
  }
}

class PlacementTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Text(
                'Search a Student!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Student Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Year',
            ),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)))),
          onPressed: () {
            print('Search Pressed');
          },
          icon: Icon(Icons.arrow_right),
          label: Text('Search'),
        )
      ],
    );
  }
}

class PlacementTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Text(
                'Search a Student!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Student Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Year',
            ),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)))),
          onPressed: () {
            Navigator.pushNamed(context, '/add_placement_record');
            print('Search Pressed');
          },
          icon: Icon(Icons.arrow_right),
          label: Text('Search'),
        )
      ],
    );
  }
}