import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:ui';
import './Menus/profileMenu.dart';
import './Menus/skillsMenu.dart';
import './Menus/educationMenu.dart';
import './Menus/workExperiencesMenu.dart';
import 'Menus/achievements_menu.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  String? token;
  static String tag ='profile-page';
  // Profile({Key? key,this.token}):super(key: key);
  Profile(this.token);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _loading1 = true;
  // bool _loading2 = false;
  // bool _loading3 = false;



  //integrating_api
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  @override
  void initState() {
    super.initState();

    _profileController = StreamController();
    profileService = ProfileService();

    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    Response response = await profileService.getProfile(widget.token!);
    setState(() {
      data = ProfileData.fromJson(jsonDecode(response.body));
      print(data.profile);
      _loading1 = false;
    });
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
    (data)=>profileMenu(data: data.profile),
    (data)=>skillsMenu(),
    (data)=>educationMenu(),
    (data)=>workExperiencesMenu(),
    (data)=>AchievementsMenu(),
  ];
  var _selectedMenu = _profileMenu[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
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
                                data.user!['first_name']+' '+data.user!['last_name'],
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
