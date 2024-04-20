import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/ForwardCPDAAdvance.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'ForwardCPDAReimburse.dart';
import 'ForwardAppraisal.dart';
import 'ForwardLTC.dart';
import 'ForwardLeave.dart';

class RequestListPage extends StatefulWidget {
  const RequestListPage();

  @override
  State<RequestListPage> createState() {
    return _RequestListpageState();
  }
}

class _RequestListpageState extends State<RequestListPage> {
  // Sample list of requests

  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  var service;
  List<dynamic> displayData = [];
  bool _loading1 = true;

  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();

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
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/formManagement/";
    final queryParameters = {
      'username': data.user!['username'],
      'designation': data.profile!['user_type'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var client = http.Client();

    var response = await client.get(uri, headers: headers);
    var list = jsonDecode(response.body) as List;
    setState(() {
      displayData = list.map((item) {
        return Map<String, String>.from(
            item.map((key, value) => MapEntry(key, value.toString())));
      }).toList();
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
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Inbox',
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
                    final cardData = displayData[index];
                    // print(cardData['id']);

                    final type = cardData['file_extra_JSON']
                        .substring(7, cardData['file_extra_JSON'].length - 1);
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          'Name: ${cardData['uploader']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Type: ${type}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            final Map<String, Widget> requests = {
                              'CPDAAdvance': ForwardCPDAAdvance(
                                formdata: cardData,
                              ),
                              'LTC': ForwardLTC(formdata: cardData),
                              'CPDAReimbursement':
                                  ForwardCPDAReimburse(formdata: cardData),
                              'Appraisal': ForwardAppraisal(formdata: cardData),
                              'Leave': ForwardLeave(
                                formdata: cardData,
                              ),
                            };
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  final widget = requests[
                                      cardData['file_extra_JSON'].substring(
                                          7,
                                          cardData['file_extra_JSON'].length -
                                              1)];
                                  return widget ??
                                      Container(); // Provide a default widget or handle null case
                                },
                              ),
                            );

                            // Respond to view button press
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue),
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
