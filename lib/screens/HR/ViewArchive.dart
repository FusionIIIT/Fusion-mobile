// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/screens/HR/ForwardCPDAAdvance.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
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

class ViewArchive extends StatefulWidget {
  const ViewArchive();

  @override
  State<ViewArchive> createState() {
    return _ViewArchiveState();
  }
}

class _ViewArchiveState extends State<ViewArchive> {
  // Sample list of requests

  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> displayData = [];
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
    final String path = "/hr2/api/getArchive/";
    final queryParameters = {
      'username': data.user!['username'],
      'designation': curr_desig,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Token ${token}"
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
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Archived Forms",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
            getApplications();
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
                  'Your Archive',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                displayData.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: displayData.length,
                        itemBuilder: (context, index) {
                          final cardData = displayData[index];
                          // print(cardData['id']);

                          final type = cardData['file_extra_JSON'].substring(
                              7, cardData['file_extra_JSON'].length - 1);
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
                                        formdata: cardData, isArchived: true),
                                    'LTC': ForwardLTC(
                                        formdata: cardData, isArchived: true),
                                    'CPDAReimbursement': ForwardCPDAReimburse(
                                        formdata: cardData, isArchived: true),
                                    'Appraisal': ForwardAppraisal(
                                        formdata: cardData, isArchived: true),
                                    'Leave': ForwardLeave(
                                        formdata: cardData, isArchived: true),
                                  };
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        final widget = requests[
                                            cardData['file_extra_JSON']
                                                .substring(
                                                    7,
                                                    cardData['file_extra_JSON']
                                                            .length -
                                                        1)];
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
                      )
                    : Text(
                        "The user has no archived requests.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
