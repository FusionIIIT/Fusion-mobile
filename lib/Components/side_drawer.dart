import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _loading = false;
  int count = 0;
  String? name;
  String? depttype;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(right: 50.0),
        color: Colors.black,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  name!,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  depttype!,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
            ModulesCard(cardLine: 'DashBoard', pageMover: '/dashboard'),
            Card(
              color: Colors.black,
              child: GestureDetector(
                //behaviour to translucent to get Tap even on blank or empty space within container
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  count++;
                  setState(() {
                    count % 2 == 0 ? _loading = false : _loading = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Modules',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.deepOrangeAccent,
                      ),
                    ],
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
                        // ModulesPadding(
                        //     line: 'DashBoard', pageMover: '/dashboard'),
                        ModulesPadding(
                          line: 'Academics Module',
                          pageMover: '/academic_home_page',
                          isActive: true,
                        ),
                        ModulesPadding(
                          line: 'Programme Curriculum',
                          pageMover: '/programme_curriculum_home',
                          isActive: true,
                        ),
                        ModulesPadding(
                            line: 'Gymkhana Module',
                            pageMover: '/gymkhana_homepage'),
                        ModulesPadding(
                            line: 'Establishment Module',
                            pageMover: '/establishment'),
                        ModulesPadding(
                            line: 'Library Module',
                            pageMover: '/library_homepage'),
                        ModulesPadding(line: 'Awards & Scholarship Module'),
                        ModulesPadding(
                            line: 'Complaint Module', pageMover: '/complaint',isActive: true,),
                        ModulesPadding(line: 'Central Mess Module'),
                        ModulesPadding(line: 'Feeds Module'),
                        ModulesPadding(
                          line: 'Health Center Module',
                          pageMover: '/health_center',
                          isActive: true,
                        ),
                        ModulesPadding(line: 'Leave Module'),
                        ModulesPadding(line: 'Placement Module'),
                        ModulesPadding(line: 'Visitors Hostel Module'),
                        ModulesPadding(line: 'File Tracking Module'),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 2.0,
                  ),
            ModulesCard(
                cardLine: 'Profile',
                icon: Icons.account_circle,
                pageMover: '/profile'),
            ModulesCard(cardLine: 'Office Of Dean Students'),
            ModulesCard(cardLine: 'Office Of Dean Academics'),
            ModulesCard(cardLine: 'Director Office'),
            ModulesCard(cardLine: 'Office Of Purchase Officer'),
            ModulesCard(cardLine: 'Office Of Registrar'),
            ModulesCard(cardLine: 'Office Of P&D'),
            ModulesCard(cardLine: 'Office Of HOD (Branch)'),
            ModulesCard(cardLine: 'Finance & Accounts'),
            ModulesCard(cardLine: 'Meet Our Team'),
            ModulesCard(cardLine: 'Log Out', icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}

class ModulesPadding extends StatelessWidget {
  final String? line;
  final String? pageMover;
  final bool isActive;
  ModulesPadding({this.line, this.pageMover, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          line!,
          style: TextStyle(
              fontSize: 16.0,
              color: isActive
                  ? Colors.deepOrangeAccent
                  : Colors.deepOrangeAccent.withOpacity(0.5)),
        ),
      ),
      onPressed: isActive
          ? () async {
              var _prefs = await StorageService.getInstance();
              String token = _prefs!.userInDB?.token ?? "";
              Navigator.pushReplacementNamed(context, pageMover!,
                  arguments: token);
            }
          : () {},
    );
  }
}

// ignore: must_be_immutable
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
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardLine!,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
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
