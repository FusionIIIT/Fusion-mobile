import 'package:flutter/material.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';

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
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  String tab1 = 'Placement';
  String tab2 = 'PBI';
  String tab3 = 'Higher Studies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Alumni Data",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      bottomNavigationBar:
      MyBottomNavigationBar(),
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