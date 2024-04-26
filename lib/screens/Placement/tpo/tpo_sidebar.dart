import 'package:flutter/material.dart';
import 'package:fusion/screens/Placement/tpo/filter_students.dart';
import 'package:fusion/screens/Placement/tpo/placement_record.dart';
import 'package:fusion/screens/Placement/tpo/tpo_home.dart';
import 'package:fusion/screens/Placement/tpo/alumni_data.dart';
import 'package:fusion/screens/Placement/tpo/placement_schedule.dart';
import 'package:fusion/screens/Placement/tpo/placement_statistics.dart';
import 'package:fusion/screens/Placement/tpo/add_company.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      width: 300,
      child: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 103, 47),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TpoHome()));
              },
            ),

            ListTile(
              title: const Text(
                'Filter Students',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterStudents()));
              },
            ),
            ListTile(
              title: const Text(
                'Placement Schedule',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlacementSchedule()));
              },
            ),
            ListTile(
              title: const Text(
                'Placement Statistics',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlacementStatistics()));
              },
            ),
            ListTile(
              title: const Text(
                'Add Placement Data',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlacementRecord()));
              },
            ),
            ListTile(
              title: const Text(
                'Add Company',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddCompany()));
              },
            ),
            ListTile(
              title: const Text(
                'Alumni Data',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AlumniData()));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
