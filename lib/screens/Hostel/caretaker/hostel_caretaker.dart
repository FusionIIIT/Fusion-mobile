import 'package:flutter/material.dart';
import 'package:fusion/screens/Hostel/caretaker/guestroom.dart';
import 'package:fusion/screens/Hostel/caretaker/inventory.dart';
import 'package:fusion/screens/Hostel/caretaker/managefines.dart';
import 'package:fusion/screens/Hostel/caretaker/managerooms.dart';
import 'package:fusion/screens/Hostel/caretaker/leaveapplication.dart';
import 'package:fusion/screens/Hostel/caretaker/staffinfo.dart';
import 'package:fusion/screens/Hostel/caretaker/managestudent.dart';
import 'package:fusion/screens/Hostel/caretaker/noticeboard.dart';
import 'package:fusion/screens/Hostel/caretaker/report.dart';
import 'package:fusion/screens/Hostel/caretaker/complaintregister.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
class Hostelcaretaker extends StatefulWidget {
  const Hostelcaretaker({Key? key}) : super(key: key);
@override
  _HostelcaretakerState createState() => _HostelcaretakerState();
}
class _HostelcaretakerState extends State<Hostelcaretaker> {
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
                          Icons.home,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Manage Rooms',
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
                      MaterialPageRoute(builder: (context) => Managefines()),
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
                      MaterialPageRoute(
                          builder: (context) => Complaintregister()),
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
                          Icons.report_problem_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Complaint',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Register',
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Inventory()),
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
                          Icons.inventory,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Inventory',
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
