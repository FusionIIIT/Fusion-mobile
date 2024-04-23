import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';

class AlumniData extends StatefulWidget {
  @override
  State<AlumniData> createState() => AlumniDataState();
}

class Student {
  final String name;
  final int year;

  Student({required this.name, required this.year});
}

class AlumniDataState extends State<AlumniData> {
  //String _value = 'Alumni Data';
  // var _currentSelectedValue;

  String tab1 = 'Placement';

  String tab2 = 'PBI';

  String tab3 = 'Higher Studies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Alumni Data'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: Sidebar(),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: TabBarView(
              children: [
                SingleChildScrollView(child: PlacementTab()),
                PlacementTab1(),
                PlacementTab1(),
              ],
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(
                labelColor: Colors.black,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 20.0),
                tabs: [Tab(text: tab1), Tab(text: tab2), Tab(text: tab3)]),
          ),
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
              padding:const EdgeInsets.fromLTRB(10, 30, 0, 0),
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