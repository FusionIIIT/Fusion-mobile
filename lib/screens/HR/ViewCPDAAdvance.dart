import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/screens/HR/ViewInbox.dart';
import 'package:fusion/screens/HR/RequestsOfAUserList.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class ViewCPDAAdvance extends StatefulWidget {
  const ViewCPDAAdvance({required this.formdata,required this.index});
  final formdata;
    final index;

  @override
  State<ViewCPDAAdvance> createState() {
    return _ViewCPDAAdvanceState();
  }
}

class _ViewCPDAAdvanceState extends State<ViewCPDAAdvance> {
  // Prefilled fields
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _adjustedPDAController = TextEditingController();
  TextEditingController _balanceAvailableController = TextEditingController();
  TextEditingController _advanceAmountPDAController = TextEditingController();
  TextEditingController _amountCheckedInPDAController = TextEditingController();
  late Map<String, dynamic> _formdata = widget.formdata;
  late Map<String, dynamic> _trackingdata = {"notFetched": true};
  bool _loading1 = true;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  @override
  void initState() {
    // TODO: implement initState
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print(widget.formdata);
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
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
          'Amount Req: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['amountRequired'].toString()),
        SizedBox(height: 10),
        Text(
          'Purpose: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['purpose']),
        SizedBox(height: 10),
        Text(
          'Advance due for adjustment: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['advanceDueAdjustment'].toString()),
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
        _formdata['adjustedPDA'] == null
            ? TextFormField(
                controller: _adjustedPDAController,
                maxLength: 50,
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('Adjusted PDA '),
                ),
                validator: (value) {
                  return 'Demo...';
                },
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Adjusted PDA",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formdata['adjustedPDA'].toString())
              ]),
        SizedBox(height: 20),
        _formdata['advanceAmountPDA'] == null
            ? TextFormField(
                controller: _advanceAmountPDAController,
                maxLength: 50,
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('Advance PDA Amount '),
                ),
                validator: (value) {
                  return 'Demo...';
                },
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Advance PDA Amount",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formdata['advanceAmountPDA'].toString())
              ]),
        SizedBox(height: 20),
        _formdata['amountCheckedInPDA'] == null
            ? TextFormField(
                controller: _amountCheckedInPDAController,
                maxLength: 50,
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('Amount Checked in PDA '),
                ),
                validator: (value) {
                  return 'Demo...';
                },
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Amount Checked in PDA",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formdata['amountCheckedInPDA'].toString())
              ]),
        SizedBox(height: 20),
        _formdata['balanceAvailable'] == null
            ? TextFormField(
                controller: _balanceAvailableController,
                maxLength: 50,
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('Balance Available'),
                ),
                validator: (value) {
                  return 'Demo...';
                },
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Balance Available",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formdata['balanceAvailable'].toString())
              ]),
        SizedBox(height: 20),
        TextFormField(
          controller: _remarksController,
          maxLength: 50,
          enabled: false,
          decoration: const InputDecoration(
            label: Text('Remarks '),
          ),
          validator: (value) {
            return 'Demo...';
          },
        ),
        Text(
          'Submission Date: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['submissionDate']),
        SizedBox(
          height: 20,
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
            _formdata["approved"] == 'null'
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
        headerTitle: "View CPDA-A Form",
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
