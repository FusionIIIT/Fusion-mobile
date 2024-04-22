// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Hostel/warden/managerooms.dart';
import 'package:fusion/screens/Hostel/warden/managestudent.dart';
import 'package:fusion/screens/Hostel/warden/noticeboard.dart';
import 'package:fusion/screens/Hostel/warden/report.dart';

import 'package:fusion/screens/Hostel/warden/staffinfo.dart';

class Hostelwarden extends StatelessWidget {
  const Hostelwarden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Staffinfo()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Staff Info',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Managerooms()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Staff Info',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Report()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.report,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Report',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                        
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Managestudent()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Manage',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Student',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Noticeboard()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Notice Board',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                
              ]),
        ),
      ),
    );
  }
}
