import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class SideDrawer extends StatefulWidget {
  final String curr_desig;

  const SideDrawer({
    Key? key,
    required this.curr_desig,
  }) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _loading = false;
  int count = 0;
  late String name;
  late String depttype;
  late String type;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    print(service.profileData);
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'];

    type = service.profileData.profile!['user_type'];
    print(depttype);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(right: 50.0),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Card(
                  elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
                  // shadowColor: Colors.black,
                  color: Colors.white,

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0.0),
                        width: 270.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profile_pic.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        name, //Display name of User
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        depttype +
                            " " +
                            widget.curr_desig, // Display Type of User
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ModulesCard(cardLine: 'DashBoard', pageMover: '/dashboard'),

            if ((type != "staff" ||
                widget.curr_desig == "acadmin" ||
                widget.curr_desig == "corelabcaretaker"))
              ModulesCard(
                cardLine: 'Academics Module',
                pageMover: '/academic_home_page',
              ),

            if ((type == "student" || widget.curr_desig == "acadmin"))
              ModulesCard(
                cardLine: 'Programme Curriculum',
                pageMover: '/programme_curriculum_home',
              ),

            if ((type == "student" || type == "faculty"))
              ModulesCard(
                cardLine: 'Department Module',
                pageMover: '/department_home_page',
              ),

            if ((type == "student") ||
                widget.curr_desig == "Dean_s" ||
                widget.curr_desig == "DeanPnD" ||
                widget.curr_desig == "dean_rspc" ||
                widget.curr_desig == "dean_s")
              ModulesCard(
                cardLine: 'Gymkhana Module',
                pageMover: '/gymkhana_homepage',
              ),

            if ((type == "student" ||
                widget.curr_desig == "mess_manager" ||
                widget.curr_desig == "mess_warden"))
              ModulesCard(
                  cardLine: 'Central Mess Module',
                  pageMover: '/central_mess_home'),

            ModulesCard(
              cardLine: 'Health Center Module',
              pageMover: '/health_center',
            ),
            if ((type == "student")) ModulesCard(cardLine: 'Leave Module'),

            if ((type == "student"))
              ModulesCard(cardLine: 'Purchase and Store'),

            if ((type == "student")) ModulesCard(cardLine: 'Human Resource'),

            if (type == "student" ||
                widget.curr_desig == "placement chairman" ||
                widget.curr_desig == "placement officer")
              ModulesCard(cardLine: 'Placement Module'),

            ModulesCard(
                cardLine: 'Visitors Hostel Module',
                pageMover: '/visitor_hostel'),

            if (type != "student")
              ModulesCard(
                  cardLine: 'File Tracking Module', pageMover: '/compose_file'),

            ModulesCard(
                cardLine: 'Establishment Module', pageMover: '/establishment'),

            ModulesCard(
                cardLine: 'Library Module', pageMover: '/library_homepage'),

            if (type == "student" ||
                widget.curr_desig == "spacsconvenor" ||
                widget.curr_desig == "spacsassistant")
              ModulesCard(cardLine: 'Awards & Scholarship Module'),

            ModulesCard(cardLine: 'Complaint Module', pageMover: '/complaint'),

            ModulesCard(cardLine: 'Research Module'),

            ModulesCard(cardLine: 'Counselling Cell'),

            if ((type == "faculty" || widget.curr_desig == "acadadmin"))
              ModulesCard(
                cardLine: 'Examination Module',
                pageMover: '/examination',
              ),

            if ((widget.curr_desig == "Executive Engineer (Civil)" ||
                widget.curr_desig == "EE" ||
                widget.curr_desig == "Admin IWD" ||
                widget.curr_desig == "Electrical_AE" ||
                widget.curr_desig == "mess_manager" ||
                widget.curr_desig == "Electrical_JE" ||
                widget.curr_desig == "Civil_AE" ||
                widget.curr_desig == "Civil_JE" ||
                widget.curr_desig == "Director" ||
                widget.curr_desig == "dean_s" ||
                widget.curr_desig == "Dean_s" ||
                widget.curr_desig == "DeanPnD"))
              ModulesCard(cardLine: 'IWD', pageMover: '/iwd/home_page'),

            ModulesCard(
              cardLine: 'Courses Module',
              pageMover: '/registered_courses',
            ),
            ModulesCard(
              cardLine: 'HR Module',
              pageMover: '/hr_homepage',
            ),

            // ModulesCard(
            //     cardLine: 'Profile',
            //     icon: Icons.account_circle,
            //     pageMover: '/profile'),

            // ModulesCard(cardLine: 'Office Of Dean Students'),
            // ModulesCard(cardLine: 'Office Of Dean Academics'),
            // ModulesCard(cardLine: 'Director Office'),
            // ModulesCard(cardLine: 'Office Of Purchase Officer'),
            // ModulesCard(cardLine: 'Office Of Registrar'),
            // ModulesCard(cardLine: 'Office Of P&D'),
            // ModulesCard(cardLine: 'Office Of HOD (Branch)'),
            // ModulesCard(cardLine: 'Finance & Accounts'),
            // ModulesCard(cardLine: 'Meet Our Team'),
            ModulesCard(cardLine: 'Log Out', icon: Icons.logout),
          ],
        ),
      ),
    );
  }

  String _getGymkhanaPage() {
    // Determine the pageMover based on designation
    print(widget.curr_desig);
    if (widget.curr_desig == 'co-ordinator') {
      return '/gymkhana_coordinator';
    } else if (widget.curr_desig == 'Counsellor') {
      return '/gymkhana_counsellor';
    } else if (widget.curr_desig == 'Convenor') {
      return '/gymkhana_convenor';
    } else if (widget.curr_desig == 'Dean Academic') {
      return '/gymkhana_dean';
    } else
      return '/gymkhana_homepage';
  }
// ignore: must_be_immutable
}

class ModulesCard extends StatelessWidget {
  final String? cardLine;
  final String? pageMover;
  IconData? icon;
  ModulesCard({this.cardLine, this.icon, this.pageMover});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //behaviour to translucent to get Tap even on blank or empty space within container
      behavior: HitTestBehavior.translucent,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardLine!,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              Icon(
                icon,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        var _prefs = await StorageService.getInstance();
        String token = _prefs!.userInDB?.token ?? "";
        if (cardLine == 'Log Out') {
          LoginService auth = LoginService();
          auth.logout();
          Navigator.pushReplacementNamed(context, "/landing");
        }
        if (pageMover != null)
          Navigator.pushReplacementNamed(context, pageMover!, arguments: token);
      },
    );
  }
}
