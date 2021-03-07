import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _loading = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
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
                  'Piyush Agrawal',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CSE Student',
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
                        ModulesPadding(
                            line: 'DashBoard', pageMover: '/home_page'),
                        ModulesPadding(
                            line: 'Academics Module',
                            pageMover: '/academic_home_page'),
                        ModulesPadding(line: 'Gymkhana Module'),
                        ModulesPadding(line: 'Establishment Module'),
                        ModulesPadding(line: 'Library Module'),
                        ModulesPadding(line: 'Awards & Scholarship Module'),
                        ModulesPadding(
                            line: 'Complaint Module', pageMover: '/complaint'),
                        ModulesPadding(line: 'Central Mess Module'),
                        ModulesPadding(line: 'Feeds Module'),
                        ModulesPadding(line: 'Health Center Module'),
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
            ModulesCard(cardLine: 'Profile', icon: Icons.account_circle),
            ModulesCard(cardLine: 'Office Of Dean Students'),
            ModulesCard(cardLine: 'Office Of Dean Academics'),
            ModulesCard(cardLine: 'Director Office'),
            ModulesCard(cardLine: 'Office Of Purchase Officer'),
            ModulesCard(cardLine: 'Office Of Registrar'),
            ModulesCard(cardLine: 'Office Of P&D'),
            ModulesCard(cardLine: 'Office Of HOD (Branch)'),
            ModulesCard(cardLine: 'Finance & Accounts'),
            ModulesCard(cardLine: 'Meet Our Team'),
            GestureDetector(
              child: ModulesCard(cardLine: 'Log Out', icon: Icons.logout),
              onTap: () {
                LoginService auth = LoginService();
                auth.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModulesPadding extends StatelessWidget {
  final String? line;
  final String? pageMover;
  ModulesPadding({this.line, this.pageMover});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          line!,
          style: TextStyle(fontSize: 16.0, color: Colors.deepOrangeAccent),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, pageMover!);
      },
    );
  }
}

// ignore: must_be_immutable
class ModulesCard extends StatelessWidget {
  final String? cardLine;
  IconData? icon;
  ModulesCard({this.cardLine, this.icon});
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
