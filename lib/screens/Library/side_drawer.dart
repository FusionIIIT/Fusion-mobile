// @dart=2.9

import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _loading = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/unknown.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Samarth Soni',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  'student',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Card(
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  count++;
                  setState(() {
                    count % 2 == 0 ? _loading = false : _loading = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Modules',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            _loading
                ? Card(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Academics Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Gymkhana Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Establishment Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Library Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Awards & Scholarship Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Complaint Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Central Mess Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Feeds Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Health Center Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Leave Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Feeds Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Placement Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Visitors Hostel Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'File Tracking Module',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 2,
                  ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of Dean Students',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of Dean Academics',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Director Office',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of Purchase Officer',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of Registrar',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of P&D',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Office Of HOD (Branch)',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Finance & Accounts',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meet Our Team',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
