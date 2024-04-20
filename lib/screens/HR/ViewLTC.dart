import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'dart:async';
import 'dart:convert';

class ViewLTC extends StatefulWidget {
  const ViewLTC({required this.formdata, required this.index});
  final formdata;
  final index;
  @override
  State<ViewLTC> createState() => _ViewLTCState();
}

class _ViewLTCState extends State<ViewLTC> {
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();

  // Prefilled data for the fields
  List<dynamic> displayData = [];
  Map<dynamic, dynamic> _formdata = {};
  bool _loading1 = true;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service;
  @override
  void initState() {
    // TODO: implement initState
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print("hello");
      convertString();
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    super.initState();
  }

  convertString() async {
    print("converting");
    int index = widget.index;
    displayData = jsonDecode(widget.formdata);
    _formdata = displayData[index];
    print(_formdata);
  }

  getData() async {
    try {
      var response = await profileService.getProfile();
      setState(() {
        datap = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        _buildSectionTitle('Personal Information'),
        Text(
          'Name: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['name']),
        SizedBox(height: 10),
        Text(
          'Designation: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['designation']),
        SizedBox(height: 10),
        Text(
          'Department: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['departmentInfo']),
        SizedBox(height: 10),
        Text(
          'Block Year: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['blockYear']),
        SizedBox(height: 10),
        Text(
          'PF No: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['pfNo'].toString()),
        SizedBox(height: 10),
        Text(
          'Leave Required: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['leaveRequired'].toString()),
        SizedBox(height: 10),
        Text(
          'Leave Start Date: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['leaveStartDate']),
        SizedBox(height: 10),
        Text(
          'Leave End Date: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['leaveEndDate']),
        SizedBox(height: 10),
        Text(
          'Date of Departure for Family: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['dateOfDepartureForFamily']),
        SizedBox(height: 10),
        Text(
          'Nature of Leave: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['natureOfLeave']),
        SizedBox(height: 10),
        Text(
          'Purpose of Leave: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['purposeOfLeave']),
        SizedBox(height: 10),
        Text(
          'Hometown or Not: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['hometownOrNot'].toString()),
        SizedBox(height: 10),
        Text(
          'Place of Visit: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['placeOfVisit']),
        SizedBox(height: 10),
        Text(
          'Address During Leave: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['addressDuringLeave']),
        SizedBox(height: 10),
        Text(
          'Mode of Travel: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['modeofTravel']),
        SizedBox(height: 10),
        Text(
          'Details of Family Members Already Done: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        _formdata['detailsOfFamilyMembersAlreadyDone'].isEmpty
            ? Text("No Family Members")
            : ListView.builder(
                shrinkWrap: true,
                itemCount:
                    _formdata['detailsOfFamilyMembersAlreadyDone'].length,
                itemBuilder: (context, index) {
                  if (_formdata['detailsOfFamilyMembersAlreadyDone'].isEmpty) {
                    return Text("No Family Members");
                  }
                  print("aaaaaa");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${index + 1}. Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAlreadyDone']
                              [index]['name']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Relation : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAlreadyDone']
                              [index]['relation']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Age : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAlreadyDone']
                              [index]['age']),
                        ],
                      ),
                    ],
                  );
                }),
        SizedBox(height: 10),
        Text(
          'Details of Family Members About to Avail: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        _formdata['detailsOfFamilyMembersAboutToAvail'].isEmpty
            ? Text("No Family Members")
            : ListView.builder(
                shrinkWrap: true,
                itemCount:
                    _formdata['detailsOfFamilyMembersAboutToAvail'].length,
                itemBuilder: (context, index) {
                  if (_formdata['detailsOfFamilyMembersAboutToAvail'].isEmpty) {
                    return Text("No Family Members");
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${index + 1}. Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAboutToAvail']
                              [index]['name']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Relation : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAboutToAvail']
                              [index]['relation']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Age : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfFamilyMembersAboutToAvail']
                              [index]['age']),
                        ],
                      ),
                    ],
                  );
                }),
        SizedBox(height: 10),
        Text(
          'Details of Dependents: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        _formdata['detailsOfDependents'].isEmpty
            ? Text("No Dependents")
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _formdata['detailsOfDependents'].length,
                itemBuilder: (context, index) {
                  if (_formdata['detailsOfDependents'].isEmpty) {
                    return Text("No Dependents");
                  }
                  print("nanana");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("${index + 1}. Name : ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(_formdata['detailsOfDependents'][index]['name']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Relation : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfDependents'][index]
                              ['relation']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Age : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfDependents'][index]['age']),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Why Fully Dependent? : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_formdata['detailsOfDependents'][index]
                              ['whyFullyDependent']),
                        ],
                      ),
                    ],
                  );
                }),
        SizedBox(height: 10),
        Text(
          'Amount of Advance Required: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['amountOfAdvanceRequired'].toString()),
        SizedBox(height: 10),
        Text(
          'Certified that Family Dependents: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['certifiedThatFamilyDependents'].toString()),
        SizedBox(height: 10),
        Text(
          'Certified that Advance Taken On: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['certifiedThatAdvanceTakenOn']),
        SizedBox(height: 10),
        Text(
          'Adjusted Month: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['adjustedMonth']),
        SizedBox(height: 10),
        Text(
          'Submission Date: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['submissionDate']),
        SizedBox(height: 10),
        Text(
          'Phone Number for Contact: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['phoneNumberForContact'].toString()),
        SizedBox(height: 10),
        TextFormField(
          controller: _remarksController,
          maxLength: 50,
          enabled: _formdata["approved"] == null,
          decoration: const InputDecoration(
            label: Text('Remarks '),
          ),
          validator: (value) {
            return 'Demo...';
          },
        ),
        TextFormField(
          controller: _receiverNameController,
          maxLength: 50,
          enabled: _formdata["approved"] == null,
          decoration: const InputDecoration(
            label: Text('Receiver\'s Name '),
          ),
          validator: (value) {
            return 'Demo...';
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _formdata["approved"] == 'true'
                ? Text("Application Approved by ${_formdata['approved_by']}",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold))
                : Container(),
            _formdata["approved"] == 'false'
                ? Text("Application Declined",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
                : Container(),
            _formdata["approved"] == 'null' || _formdata["approved"] == null
                ? Text("Application Pending...",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
                : Container()
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formdata["notFetched"] == true
                    ? _loading1
                        ? CircularProgressIndicator()
                        : Center(child: Text("Failed to Fetch Application"))
                    : _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
