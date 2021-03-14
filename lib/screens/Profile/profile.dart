import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:ui';
import './Menus/profileMenu.dart';
import './Menus/skillsMenu.dart';
import './Menus/educationMenu.dart';
import './Menus/workExperiencesMenu.dart';
import 'Menus/achievements_menu.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  static const _profileMenu = [
    'Profile',
    'Skills Technologies',
    'Education Courses',
    'Work Experience',
    'Achievements',
  ];

  //TODO: Update
  static const _menu = [
    profileMenu(),
    skillsMenu(),
    educationMenu(),
    workExperiencesMenu(),
    AchievementsMenu(),
  ];
  var _selectedMenu = _profileMenu[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar()
          .buildAppBar(),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            UnconstrainedBox(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/profile_pic.png'),
                      width: 170,
                      height: 170,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Aman Panjwani',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CSE'),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Student'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //DropDown Menu
              margin: EdgeInsets.all(10.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  //dropdownColor: Colors.black12,
                  isExpanded: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0),
                  value: _selectedMenu,
                  items: _profileMenu.map((menu) {
                    return DropdownMenuItem(
                        value: menu,
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            color: _selectedMenu == menu
                                ? Colors.orange.shade800
                                : Colors.transparent,
                            child: Text(menu)));
                  }).toList(),
                  onChanged: (String? selectedItem) =>
                      setState(() => _selectedMenu = selectedItem!),
                ),
              ),
            ),
            _menu[_profileMenu.indexOf(_selectedMenu)],
          ],
        ),
      ),
    );
  }
}
