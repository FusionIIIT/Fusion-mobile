import 'package:flutter/material.dart';
import 'package:fusion/screens/Hostel/student/allottedrooms.dart';
import 'package:fusion/screens/Hostel/student/fines.dart';
import 'package:fusion/screens/Hostel/student/guestroom.dart';
import 'package:fusion/screens/Hostel/student/leaveapplication.dart';
import 'package:fusion/screens/Hostel/student/noticeboard.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class Hostelstudent extends StatefulWidget {
  const Hostelstudent({Key? key}) : super(key: key);

  @override
  _HostelstudentState createState() => _HostelstudentState();
}


class _HostelstudentState extends State<Hostelstudent> {
  late String curr_desig;

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    curr_desig = service.getFromDisk("Current_designation") ?? ""; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Central Mess",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
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
                      MaterialPageRoute(builder: (context) => Guestroom()),
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
                          Icons.add_home,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Guest Room',
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
                      MaterialPageRoute(builder: (context) => Allottedrooms()),
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
                          Icons.home,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Alloted rooms',
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
                      MaterialPageRoute(builder: (context) => Fines()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 245, 103, 47),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Manage Fines',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ), 
              
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Leaveapplication()),
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
                          Icons.card_travel,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Leave',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Application',
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
      );
  
  }
}
