// this will be for the HR admin where he will be able to view past requests of any user.import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/screens/HR/ViewCPDAAdvance.dart';
import 'package:fusion/screens/HR/ViewAppraisal.dart';
import 'package:fusion/screens/HR/ViewLeave.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;
import 'ViewCPDAReimburse.dart';
import 'ViewLTC.dart';
import 'ForwardLeave.dart';
import 'package:fusion/api.dart';

class ViewHistoryOfUser extends StatefulWidget {
  const ViewHistoryOfUser();

  @override
  State<ViewHistoryOfUser> createState() {
    return _ViewHistoryOfUser();
  }
}

class _ViewHistoryOfUser extends State<ViewHistoryOfUser> {
  // Sample list of requests
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _formTypeController = TextEditingController();
  List<String> formTypes = [
    "LTC",
    "CPDA Advance",
    "CPDA Reimbursement",
    "Appraisal",
    "Leave"
  ];
  Map<String, String> optionsToType = {
    "LTC": "LTC",
    "CPDA Advance": "CPDAAdvance",
    "CPDA Reimbursement": "CPDAReimbursement",
    "Leave": "Leave",
    "Appraisal": "Appraisal"
  };
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  var dataToBePassed;
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
  List<Map<String, dynamic>> displayData = [];
  bool _loading1 = true;

  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();

    try {
      print("hello");
      data = service.profileData;
      _loading1 = false;
      showData();
    } catch (e) {
      getData();
      showData();
    }
  }

  void showData() {
    print(data.user);
    print(data.profile);
    print("yaha hun mian");
    print((data.profile)!['id']);
    print(data.profile!['department']!['name']);
    print(data.profile!['user_type']);
    // getApplications();
  }

  void getApplications() async {
    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid username.")));
      return;
    }
    if (_formTypeController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please select a form type.")));
      return;
    }

    final String host = kserverLink;
    final String path = "/hr2/api/getForms/";
    // print(widget.userAndRequestData);

    final queryParameters = {
      'type': optionsToType[_formTypeController.text],
      'id': _usernameController.text,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Token ${token}"
    };

    var client = http.Client();

    var response = await client.get(uri, headers: headers);
    dataToBePassed = response.body;
    // print(dataToBePassed);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      setState(() {
        displayData = list.map((item) {
          return Map<String, String>.from(
              item.map((key, value) => MapEntry(key, value.toString())));
        }).toList();
        // print("display data set hua");
        // print(displayData);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Failed to get history of user. Please check entered username.")));
    }
  }

  getData() async {
    try {
      var response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  // have to fetch the requests from the backend

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Form History",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select the user and form type:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Enter the username of the user',
                    labelText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Form type',
                  style: TextStyle(fontSize: 12),
                ),
                DropdownButtonFormField(
                    hint: Text("Select the desired form type"),
                    items: formTypes
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      _formTypeController.text = value.toString();
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      getApplications();
                    },
                    child: const Text("Show History")),
                SizedBox(
                  height: 10,
                ),
                displayData.length > 0
                    ? Text(
                        'History of user',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'The user has not submitted any ${_formTypeController.text} forms.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: displayData.length,
                    itemBuilder: (context, index) {
                      print(displayData.length);
                      final Map<String, dynamic> cardData = displayData[index];

                      final type = optionsToType[_formTypeController.text];
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                            'Name: ${cardData['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Type: ${type}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              final Map<String, Widget> requests = {
                                'CPDAAdvance': ViewCPDAAdvance(
                                    formdata: displayData[index], index: index),
                                'LTC': ViewLTC(
                                    formdata: dataToBePassed, index: index),
                                'CPDAReimbursement': ViewCPDAReimburse(
                                    formdata: displayData[index], index: index),
                                'Appraisal': ViewAppraisal(
                                    formdata: dataToBePassed, index: index),
                                'Leave': ViewLeave(
                                    formdata: displayData[index], index: index),
                              };
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    final widget = requests[type];
                                    return widget ??
                                        Container(); // Provide a default widget or handle null case
                                  },
                                ),
                              );

                              // Respond to view button press
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue),
                            child: Text('View',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
