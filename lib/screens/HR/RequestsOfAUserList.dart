// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/HR/ViewCPDAAdvance.dart';
import 'package:fusion/screens/HR/ViewAppraisal.dart';
import 'package:fusion/screens/HR/ViewLeave.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;
import 'ViewCPDAReimburse.dart';
import 'ViewLTC.dart';
import 'ForwardLeave.dart';
import 'package:fusion/api.dart';

class RequestsOfAUserListPage extends StatefulWidget {
  const RequestsOfAUserListPage(this.userAndRequestData);
  final userAndRequestData;

  @override
  State<RequestsOfAUserListPage> createState() {
    return _RequestsOfAUserListPage();
  }
}

class _RequestsOfAUserListPage extends State<RequestsOfAUserListPage> {
  // Sample list of requests

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
    getApplications();
  }

  void getApplications() async {
    final String host = kserverLink;
    final String path = "/hr2/api/getForms/";
    print("yeh chahiye tha");
    print(widget.userAndRequestData);

    final queryParameters = {
      'type': widget.userAndRequestData['type'],
      'id': widget.userAndRequestData['id'],
    };
    print(queryParameters);
    Uri uri = (Uri.http(host, path, queryParameters));
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Token ${token}"
    };

    var client = http.Client();

    var response = await client.get(uri, headers: headers);
    dataToBePassed = response.body;
    // print("yeh data to be passed hai");
    // print(dataToBePassed);
    var list = jsonDecode(response.body) as List;
    setState(() {
      displayData = list.map((item) {
        return Map<String, String>.from(
            item.map((key, value) => MapEntry(key, value.toString())));
      }).toList();
      print("display data set hua");
      print(displayData);
    });
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
        headerTitle: "View Requests",
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
                  'Previous ${widget.userAndRequestData['type']} requests by ${widget.userAndRequestData['id']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: displayData.length,
                  itemBuilder: (context, index) {
                    if (displayData.isEmpty) {
                      // If no requests found
                      return Text('No requests found');

                      // Or some other widget
                    }
                    final Map<String, dynamic> cardData = displayData[index];

                    final type = widget.userAndRequestData['type'];
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
                              'CPDAAdvance':
                                  ViewCPDAAdvance(formdata: displayData[index], index: index),
                              'LTC': ViewLTC(
                                  formdata: dataToBePassed, index: index),
                              'CPDAReimbursement': ViewCPDAReimburse(
                                  formdata: displayData[index], index: index),
                              'Appraisal': ViewAppraisal(
                                  formdata: dataToBePassed, index: index),
                              'Leave': ViewLeave(
                                formdata: displayData[index],
                                index: index,
                              ),
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
