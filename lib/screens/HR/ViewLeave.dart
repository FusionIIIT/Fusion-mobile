import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/screens/HR/ViewInbox.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:date_field/date_field.dart';
import 'package:fusion/screens/HR/RequestsOfAUserList.dart';

class ViewLeave extends StatefulWidget {
  const ViewLeave({required this.formdata, required this.index});
  final formdata;
    final index;

  @override
  State<ViewLeave> createState() {
    return _ViewLeaveState();
  }
}

class _ViewLeaveState extends State<ViewLeave> {
  // Prefilled fields
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  late Map<String, dynamic> _formdata = widget.formdata;
  bool _loading1 = true;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
  @override
  void initState() {
    // TODO: implement initState
    _profileController = StreamController();
    profileService = ProfileService();
    try {
      print("hello");
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    super.initState();
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

  //form builder function
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
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
          'P.F. No: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['pfNo'].toString()),
        SizedBox(height: 10),
        Text(
          'Department Info: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['departmentInfo'].toString()),
        SizedBox(height: 10),
        Text(
          'Purpose of Leave: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['purposeOfLeave']),
        SizedBox(height: 10),
        Text(
          'Nature of Leave : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['natureOfLeave'].toString()),
        SizedBox(height: 20),
        Text(
          'Address During Leave : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['addressDuringLeave'].toString()),
        SizedBox(height: 20),
        Text(
          'Academic Responsibility transferred to : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['academicResponsibility'].toString()),
        SizedBox(height: 20),
        Text(
          'Administrative Responsibility transferred to : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['addministrativeResponsibiltyAssigned'].toString()),
        SizedBox(height: 20),
        Text(
          'Submission Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['submissionDate'].toString()),
        SizedBox(height: 20),
        Text(
          'Leave Start Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['leaveStartDate'].toString()),
        SizedBox(height: 20),
        Text(
          'Leave End Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['leaveEndDate'].toString()),
        SizedBox(height: 20),
        widget.formdata['remarks'] != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remarks ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.formdata['remarks'],
                  ),
                ],
              )
            : SizedBox(height: 0),
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

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Icon(
        icon,
        size: 48.0, // Adjust the size of the icon as needed
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0, // Adjust the size of the title as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "View Leave Form",
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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _formdata["notFetched"] == true
                      ? _loading1
                          ? CircularProgressIndicator()
                          : Center(child: Text("Failed to Fetch Application"))
                      : Column(
                          children: [
                            _buildForm(),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
