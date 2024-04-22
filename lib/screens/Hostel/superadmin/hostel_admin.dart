import 'package:flutter/material.dart';
import 'package:fusion/screens/Hostel/superadmin/add_hostel.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_warden.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_batch.dart';
import 'package:fusion/screens/Hostel/superadmin/assign_caretaker.dart';
import 'package:fusion/screens/Hostel/superadmin/view_hostel_history.dart';
import 'package:fusion/screens/Hostel/superadmin/view_hostel.dart';
import 'package:fusion/Components/side_drawer.dart';

class HostelAdmin extends StatelessWidget {
  const HostelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Hostel Admin'),
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
