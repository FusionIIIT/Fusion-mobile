import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';

class ViewMenu extends StatefulWidget{
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {

  List<DropdownMenuItem<String>> get chooseMess{
    List<DropdownMenuItem<String>> messOptions = [
      DropdownMenuItem(child: Text("Central Mess 1"),value: "mess1"),
      DropdownMenuItem(child: Text("Central Mess 2"),value: "mess2"),
    ];
    return messOptions;
  }

  bool _loading = true;
  late String name;
  late String studentType;
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;

  @override
  void initState() {
    super.initState();
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    String? selectedValue;
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        backgroundColor: Colors.blueAccent, shadowColor: Colors.black,);
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile_pic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    studentType,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Central Mess",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Form(
                      key: _messFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonFormField(
                            // style: ,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // border: OutlineInputBorder(
                                //   borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                                //   borderRadius: BorderRadius.circular(20),
                                // ),
                                filled: true,
                                fillColor: Colors.,
                              ),
                              validator: (value) => value == null ? "Select a mess" : null,
                              dropdownColor: Colors.white,
                              value: selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              },
                              items: chooseMess),
                          ElevatedButton(
                              style: style,
                              onPressed: () {
                                if (_messFormKey.currentState!.validate()) {
                                  //valid flow
                                }
                              },
                              child: Text("Download"))
                        ],
                      )
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

