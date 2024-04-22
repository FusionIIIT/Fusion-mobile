import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/services/newclubmember.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/dashboard_service.dart';

import '../../models/dashboard.dart';
import '../../models/profile.dart';
import '../../services/help.dart';
import '../../services/viewmembersrecord.dart';

class Apply extends StatefulWidget {
  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> clubNames = [];
  String? selectedClub;
  String? username;
  late DashboardService dashboardService;
  late ProfileService profileService;
  late ProfileData data2;
  late DashboardData data;
  bool _loading = true;
  late String studentType;
  late String name;
  late String designation = "student";
  late StreamController _dashboardController;
  late StreamController _profileController;
  Set<String> appliedClubs = {}; // Store applied clubs
  late String xx = "";
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 1, vsync: this);
    fetchClubNames();
    dashboardService = DashboardService();
    profileService = ProfileService();
    _dashboardController = StreamController();
    _profileController = StreamController();
    getData(); // Call getData function to fetch username
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
      designation = data.designation![0];
      print(designation);
      print(data2.user!['username']);

      // Set the value of 'username' to 'rollno' field
      rollNoController.text = data2.user!['username'];

      // Fetch and store clubs the student has applied to or is a member of
      await fetchAppliedClubs();
    } catch (e) {
      print(e);
    }
  }

  fetchAppliedClubs() async {
    try {
      xx = await DataFetcher().getClub(context);
      print(xx);
      // Instantiate the ViewMembersRecord service
      ViewMembersRecord viewMembersRecord = ViewMembersRecord();

      // Fetch members record
      List<dynamic> clubs = await viewMembersRecord.getMembersRecord();

      // Filter clubs where the student's status is 'open' or 'confirmed'
      Set<String> appliedClubNames = clubs
          .where((club) =>
              club['member'] == data2.user!['username'] &&
              (club['status'] == 'open' ||
                  club['status'] == 'confirmed' && club['club'] != xx))
          .map<String>((club) => club['club'])
          .toSet();

      setState(() {
        appliedClubs = appliedClubNames;
      });
    } catch (e) {
      print('Error fetching applied clubs: $e');
    }
  }

  // void fetchClubNames() async {
  //   try {
  //     xx = await DataFetcher().getClub(context);
  //     print(xx);
  //     List<dynamic> clubDetails = await ViewClubDetails().getClubDetails();
  //     List<String> names = clubDetails
  //         .map<String>((club) => club['club_name'].toString())
  //         .toList();
  //     List<String> pp = [];
  //     for (var i in names) if (i != xx) pp.add(i);
  //     print("hehe");
  //     print(pp);
  //     setState(() {
  //       clubNames = pp;
  //       selectedClub = clubNames.isNotEmpty ? clubNames[0] : null;
  //     });
  //   } catch (e) {
  //     print('Error fetching club names: $e');
  //   }
  // }


void fetchClubNames() async {
  try {
    xx = await DataFetcher().getClub(context);
    print(xx);
    List<dynamic> clubDetails = await ViewClubDetails().getClubDetails();
    List<String> names = clubDetails
        .where((club) => club['status'] == 'confirmed') // Filter clubs with status 'confirmed'
        .map<String>((club) => club['club_name'].toString())
        .toList();
    List<String> pp = [];
    for (var i in names) if (i != xx) pp.add(i);
    print("hehe");
    print(pp);
    setState(() {
      clubNames = pp;
      selectedClub = clubNames.isNotEmpty ? clubNames[0] : null;
    });
  } catch (e) {
    print('Error fetching club names: $e');
  }
}

  final GlobalKey<FormState> formkey1 = GlobalKey<FormState>();

  void validate() {
    if (formkey1.currentState!.validate()) {
      String club = clubController.text;
      String rollNo = rollNoController.text;
      String description = descriptionController.text;
      String achievements = achievementsController.text;
      String status = statusController.text;

      // Check if the student has already applied to or is a member of the selected club
      if (appliedClubs.contains(club)) {
        // Show indicator that the student cannot re-apply
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('You are already a member or have applied to this club.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // Submit the form
        submitForm(club, rollNo, description, achievements, status)
            .then((success) {
          if (success) {
            // Show success SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Form submitted successfully'),
                backgroundColor: Colors.green,
              ),
            );
            // Optionally, you can reset the form after successful submission
            formkey1.currentState!.reset();
          } else {
            // Show error SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to submit form. Please try again later.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
      }
    } else {
      print("Form 1 is invalid");
    }
  }

  Future<bool> submitForm(String club, String rollNo, String description,
      String achievements, String status) async {
    try {
      await NewClubMember().createNewClubMember(
        member: rollNo,
        club: club,
        description: description,
        status: status,
        remarks: achievements,
      );
      return true; // Submission successful
    } catch (e) {
      print('Error submitting form: $e');
      return false; // Submission failed
    }
  }

  String? formvalidate(value) {
    if (value.isEmpty) {
      return "Error";
    } else {
      return null;
    }
  }

  TextEditingController clubController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController achievementsController = TextEditingController();
  TextEditingController statusController = TextEditingController(text: 'open');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        title: Text(
          'Apply',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 6.0,
          controller: _controller,
          tabs: [
            Tab(text: 'Form'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: Form(
                key: formkey1,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Club Membership Form",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            border: Border.all(
                              color: Colors.deepOrange,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 2.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: DropdownButtonFormField(
                        value: selectedClub,
                        items: clubNames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedClub = newValue!;
                            clubController.text = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Club",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || (value as String).isEmpty) {
                            return 'Please select a club';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: rollNoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Roll No",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        enabled: false, // Disable editing of the roll no field
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Description",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: achievementsController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Achievements",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        onPressed: validate,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.deepOrange;
                              return Colors.deepOrangeAccent;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
