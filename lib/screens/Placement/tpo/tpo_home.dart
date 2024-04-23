import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Placement/tpo/add_company.dart';
import 'package:fusion/screens/Placement/tpo/alumni_data.dart';
import 'package:fusion/screens/Placement/tpo/filter_students.dart';
import 'package:fusion/screens/Placement/tpo/placement_statistics.dart';
import 'package:fusion/screens/Placement/tpo/placement_schedule.dart';
import 'package:fusion/screens/Placement/tpo/placement_record.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class TpoHome extends StatefulWidget {
  @override
  State<TpoHome> createState() => TpoHomeState();
}

class TpoHomeState extends State<TpoHome> {

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  Widget build(BuildContext context) {
    final data = '';

    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Central Mess",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            shrinkWrap: true,
            children: List.generate(6, (index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCompany()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterStudents()),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlacementSchedule()),
                    );
                  } else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlacementStatistics()),
                    );
                  } else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlumniData()),
                    );
                  } else if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCompany()),
                    );
                  }else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlacementRecord()),
                    );
                  }
                },
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index == 0)
                          Icon(
                            Icons.add_business,
                            color: Colors.white,
                            size: 30,
                          )
                        else if (index == 1)
                          Icon(
                            Icons.people,
                            color: Colors.white,
                            size: 30,
                          )

                          else if (index == 3)
                              Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 30,
                              )
                            else if (index == 4)
                                Icon(
                                  Icons.pie_chart,
                                  color: Colors.white,
                                  size: 30,
                                )
                                else if (index == 5)
                                Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
              )
                        else if(index==2)
                          Icon(
                            Icons.dataset_sharp,
                            color:Colors.white,
                            size:30,
                          ),
                        Text(
                          index == 0
                              ? 'Add Company'
                              : index == 1
                              ? 'Filter Students'
                              : index == 3
                              ? 'Placement Schedule'
                              : index == 4
                              ? 'Placement Statistics'
                              : index==5
                              ?'Alumni Data'
                              :'Placement Records',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
