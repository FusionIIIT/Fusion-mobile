import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import '../../Components/bottom_navigation_bar.dart';
import 'Menus/profile_menu.dart';
import 'Menus/skills_menu.dart';
import 'Menus/education_menu.dart';
import 'Menus/work_experiences_menu.dart';
import 'Menus/achievements_menu.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  bool _loading1 = true;

  //integrating_api
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  @override
  void initState() {
    super.initState();

    _profileController = StreamController();
    profileService = ProfileService();
    var service = locator<StorageService>();
    try {
      data = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    //TODO: Remove this?
    getData();
  }

  getData() async {
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _profileController.add(res);
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('New Content Loaded'),
      ),
    );
  }

  // defining menu
  static const _profileMenu = [
    'Profile',
    'Skills Technologies',
    'Education Courses',
    'Work Experience',
    'Achievements',
  ];

  //TODO: Update
  List<Function> _menu = [
    (data) => ProfileMenu(data: data.profile),
    (data) => SkillsMenu(data: data.skills),
    (data) => EducationMenu(
          educationData: data.education,
          coursesData: data.course,
        ),
    (data) => WorkExperiencesMenu(
        internshipData: data.experience, projectData: data.project),
    (data) => AchievementsMenu(
          achievementData: data.achievement,
        ),
  ];
  var _selectedMenu = _profileMenu[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'Branches', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: _loading1 == true
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: _profileController.stream,
              builder: (context, AsyncSnapshot snapshot) {
                return SingleChildScrollView(
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
                                //NAME
                                data.user!['first_name'] +
                                    ' ' +
                                    data.user!['last_name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
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
                                    Text(data.profile!['department']!['name']),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(data.profile!['user_type']),
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
                      _menu[_profileMenu.indexOf(_selectedMenu)](data),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
