import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Complaint/Widgets/StudentWidget.dart';
import 'package:fusion/screens/Complaint/Widgets/CaretakerWidget.dart';
import 'package:fusion/screens/Complaint/Widgets/SupervisorWidget.dart';
import 'package:provider/provider.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");

class Complaint extends StatefulWidget {
  String? token;
  Complaint(this.token);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  bool _loading = true;
  bool _loading1 = true;
  bool _loading2 = false;
  bool _loading3 = false;

  late StreamController _profileController;
  late ProfileService profileService;
  late ComplaintService complaintService;
  late ProfileData data;
  late String userType;

  @override
  void initState() {
    super.initState();

    _profileController = StreamController();
    profileService = ProfileService();
    complaintService = ComplaintService();

    getData();
  }

  getData() async {
    try {
      Response profile_response = await profileService.getProfile();
      Response complaint_response = await complaintService.getComplaint();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(profile_response.body));
        userType = jsonDecode(complaint_response.body)["user_type"] ?? "student";
        _loading = false;
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

  void navigateToComplaint(String route) {
    Navigator.pushNamed(context, route,
        arguments: data.user != null ? data.user!['username'] : "null");
  }

  void setLoading(bool value) {
    setState(() {
      _loading1 = value;
      _loading2 = value;
      _loading3 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow = Container();
  if (!_loading) {
    if (userType == "student") {
      widgetToShow = StudentWidget(
      setLoading: setLoading,
      navigateToComplaint: navigateToComplaint,
      data: data,
      );
    } else if (userType == "caretaker") {
      widgetToShow = CaretakerWidget(
      setLoading: setLoading,
      navigateToComplaint: navigateToComplaint,
      data: data,
      );
    } else if (userType == "supervisor") {
      widgetToShow = SupervisorWidget(
      setLoading: setLoading,
      navigateToComplaint: navigateToComplaint,
      data: data,
      );
    } else {
    widgetToShow = Container();
    }
  }

    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Complaint",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        }
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
        color: Colors.white60,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile_pic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data.user != null
                        ? (data.user!['first_name'] +
                        ' ' +
                        data.user!['last_name'])
                        : "User does not exist on data",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data.profile != null
                        ? (data.profile!['department']!['name'] +
                        '  ' +
                        data.profile!['user_type'])
                        : "No Profile",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            _loading ? Container() : widgetToShow,
          ],
        ),
      ),
    );
  }
}
