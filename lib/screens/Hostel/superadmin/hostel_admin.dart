import 'package:flutter/material.dart';
import 'package:fusion/screens/Hostel/superadmin/add_hostel.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_warden.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_batch.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_caretaker.dart';
import 'package:fusion/screens/Hostel/superadmin/view_hostel_history.dart';
import 'package:fusion/screens/Hostel/superadmin/view_hostel.dart';
// import 'package:fusion/Components/side_drawer.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class Hosteladmin extends StatefulWidget {
  const Hosteladmin({Key? key}) : super(key: key);
@override
  _Hosteladminstate createState() => _Hosteladminstate();
}
class _Hosteladminstate extends State<Hosteladmin> {
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
                    MaterialPageRoute(builder: (context) => AddHostelScreen()),
                  );
                },
                child: buildCard(Icons.add, 'Add Hostel', context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AssignWardenScreen()),
                  );
                },
                child: buildCard(Icons.person_add_alt_1, 'Assign Warden', context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AssignBatchScreen()),
                  );
                },
                child: buildCard(Icons.batch_prediction, 'Assign Batch', context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AssignCaretakerScreen()),
                  );
                },
                child: buildCard(Icons.person_add, 'Assign Caretaker', context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewHostelHistoryScreen()),
                  );
                },
                child: buildCard(Icons.history, 'View Hostel History', context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewHostelScreen()),
                  );
                },
                child: buildCard(Icons.home, 'View Hostel', context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(IconData icon, String title, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 245, 103, 47),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
