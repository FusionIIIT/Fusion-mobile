import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsAssistant/Homepage.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/convener_homepage.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/student_homepage.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';

class SholarshipHomePage extends StatefulWidget {
  const SholarshipHomePage({Key? key}) : super(key: key);

  @override
  State<SholarshipHomePage> createState() => _SholarshipHomePageState();
}

class _SholarshipHomePageState extends State<SholarshipHomePage> {
  String? name;
  String? depttype;
  String? type;
  late String curr_desig = "";
  final List<Widget> pages = [
    StudentHomePage(),
    ConvenerHomePage(),
    SpacsAssistantHomePage()
  ];
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    curr_desig = service.getFromDisk("Current_designation");
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];

    type = service.profileData.profile!['user_type'];
  
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: "Awards & Scholarships",
          onDesignationChanged: (newValue) {
            setState(() {
              curr_desig = newValue;
            });
          },
        ), // This is default app bar used in all modules
        // drawer: SideDrawer(curr_desig: curr_desig),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          children: [
            if (curr_desig == 'spacsconvenor') pages[1],
            if (curr_desig== 'spacsassistant') pages[2],
            if (type == 'student') pages[0]
          ],
        ),
      ),
    );
  }
}
