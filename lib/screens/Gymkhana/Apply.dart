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

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../models/dashboard.dart';
import '../../models/profile.dart';
import '../../services/help.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';
import '../../services/viewmembersrecord.dart';

class Apply extends StatefulWidget {
  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> with SingleTickerProviderStateMixin {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

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

  void fetchClubNames() async {
    try {
      xx = await DataFetcher().getClub(context);
      print(xx);
      List<dynamic> clubDetails = await ViewClubDetails().getClubDetails();
      List<String> names = clubDetails
          .where((club) =>
              club['status'] ==
              'confirmed') // Filter clubs with status 'confirmed'
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

  String? formvalidate(value) {
    if (value.isEmpty) {
      return "Error";
    } else {
      return null;
    }
  }

  // Declare a map to store form submission status for each club
  Map<String, bool> formSubmittedStatus = {};

// Modify submitForm method to update form submission status
  Future<bool> submitForm(String club, String rollNo, String description,
      String achievements, String status) async {
    try {
      // Check if the form has already been submitted for the selected club
      if (formSubmittedStatus.containsKey(club) &&
          formSubmittedStatus[club] == true) {
        // Show notification indicating that form has already been submitted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have already submitted the form for this club.'),
            backgroundColor: Colors.red,
          ),
        );
        return false; // Submission failed
      } else {
        // If form submission status is not available or false, submit the form
        await NewClubMember().createNewClubMember(
          member: rollNo,
          club: club,
          description: description,
          status: status,
          remarks: achievements,
        );
        // Update form submission status for the selected club
        formSubmittedStatus[club] = true;
        return true; // Submission successful
      }
    } catch (e) {
      print('Error submitting form: $e');
      return false; // Submission failed
    }
  }

// Update validate method to check form submission status before submission
  void validate() {
    if (formkey1.currentState!.validate()) {
      String club = clubController.text;
      String rollNo = rollNoController.text;
      String description = descriptionController.text;
      String achievements = achievementsController.text;
      String status = statusController.text;

      // Check if the form has already been submitted for the selected club
      if (formSubmittedStatus.containsKey(club) &&
          formSubmittedStatus[club] == true) {
        // Show notification indicating that form has already been submitted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have already submitted the form for this club.'),
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

  TextEditingController clubController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController achievementsController = TextEditingController();
  TextEditingController statusController = TextEditingController(text: 'open');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: 'Club Membership', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
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
                    // Club Dropdown Button
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
                          labelText: "Club", // Title for the dropdown button
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
                    // Roll No Text Field
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: rollNoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:
                              "Roll No", // Title for the roll number field
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
                    // Description Text Field
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText:
                              "Description", // Title for the description field
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    // Achievements Text Field
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: achievementsController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText:
                              "Achievements", // Title for the achievements field
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    // Submit Button
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
