import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/UpdateLeaveBalance.dart';
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

class ForwardLeave extends StatefulWidget {
  const ForwardLeave({required this.formdata});
  final formdata;

  @override
  State<ForwardLeave> createState() {
    return _ForwardLeaveState();
  }
}

class _ForwardLeaveState extends State<ForwardLeave> {
  // Prefilled fields
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formdata = {"notFetched": true};
  bool _loading1 = true;
  bool isOwner = false;
  bool isHRAdmin = true;
  late Map<String, dynamic> _trackingdata = {"notFetched": true};
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
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    fetchForm();
    trackStatus();
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

  void trackStatus() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/tracking/";
    final queryParameters = {
      'id': widget.formdata['id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      setState(() {
        _trackingdata = jsonDecode(response.body);
      });
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to Fetch Tracking Data")));
    }
    // print("tracking data below");
    print(_trackingdata);
  }

  void fetchForm() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/formFetch/";
    print(widget.formdata);
    final queryParameters = {
      'file_id': widget.formdata['id'],
      'id': widget.formdata['src_object_id'],
      'type': widget.formdata['file_extra_JSON']
          .substring(7, widget.formdata['file_extra_JSON'].length - 1)
    };

    Uri uri = (Uri.http(host, path, queryParameters));
    print(queryParameters);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var client = http.Client();
    var response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // ignore: avoid_print
      setState(() {
        _formdata = jsonDecode(response.body);
        _loading1 = false;
      });
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to Fetch Application")));
      setState(() {
        _loading1 = false;
      });
    }
    // print(_formdata);
    isOwner = _formdata['current_owner'] == datap.user!["username"];
    // Fetch form data from the backend
  }

  void approveForm() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/leave/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver": _formdata['creator'],
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    _formdata['form']['approved'] = true;
    _formdata['form']['approved_by'] = datap.user!["id"];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Approved Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Approve")));
    }
  }

  void forwardForm() async {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ForwardOrDeclineFormHradmin()));
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/leave/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };

    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver": _receiverNameController.text,
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Forwarded Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RequestListPage()));
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Forward")));
    }
  }

  void declineForm() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/leave/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['approved'] = false;
    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver": _formdata['creator'],
        "remarks": _remarksController.text,
        "file_extra_JSON": {
          "type": widget.formdata['file_extra_JSON']
              .substring(7, widget.formdata['file_extra_JSON'].length - 1)
        }
      },
      _formdata["form"]
    ];
    print(data);
    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Declined Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RequestListPage()));
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Decline")));
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
        _buildSectionTitle("Tracking Details"),
        _trackingdata['notFetched'] != null
            ? Text("Failed to Fetch Tracking History")
            : _trackingdata['status'].isEmpty
                ? Text("No Tracking History")
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _trackingdata['status'].length,
                    itemBuilder: (context, index) {
                      if (_trackingdata['status'].isEmpty) {
                        return Text("No Tracking History");
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${index + 1}. Forwarded By: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  _trackingdata['status'][index]['current_id']),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Forwarded on : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(_trackingdata['status'][index]
                                      ['forward_date']
                                  .substring(0, 10)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Remarks : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(_trackingdata['status'][index]
                                            ['remarks'] ==
                                        ''
                                    ? 'No Remarks'
                                    : _trackingdata['status'][index]
                                        ['remarks']),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                    }),
        SizedBox(height: 10),
        Text(
          'Name: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['name']),
        SizedBox(height: 10),
        Text(
          'Designation: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['designation']),
        SizedBox(height: 10),
        Text(
          'P.F. No: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['pfNo'].toString()),
        SizedBox(height: 10),
        Text(
          'Department Info: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['departmentInfo'].toString()),
        SizedBox(height: 10),
        Text(
          'Purpose of Leave: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['purposeOfLeave']),
        SizedBox(height: 10),
        Text(
          'Nature of Leave : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['natureOfLeave'].toString()),
        SizedBox(height: 20),
        Text(
          'Address During Leave : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['addressDuringLeave'].toString()),
        SizedBox(height: 20),
        Text(
          'Responsibility transferred to : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['rolesTransferredTo'].toString()),
        SizedBox(height: 20),
        Text(
          'Submission Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['submissionDate'].toString()),
        SizedBox(height: 20),
        Text(
          'Leave Start Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['leaveStartDate'].toString()),
        SizedBox(height: 20),
        Text(
          'Leave End Date : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['leaveEndDate'].toString()),
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _remarksController,
                maxLength: 50,
                enabled: _formdata["form"]["approved"] == null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Remarks '),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some remark or NA if not applicable.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _receiverNameController,
                maxLength: 50,
                enabled: _formdata["form"]["approved"] == null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Receiver\'s Name '),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter receiver name correctly or NA if not applicable.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        isHRAdmin
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateLeavebalance()));
                },
                child: Text("Check/Update Leave Balance"))
            : Container(),
        isOwner
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _formdata["form"]["approved"] == null
                      ? ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //   // If the form is valid, display a snackbar. In the real world,
                              //   // you'd often call a server or save the information in a database.
                              print("pohoch");
                              forwardForm();
                            }
                            // Respond to button press
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please fill all the fields correctly')),
                              );
                            }
                            // Respond to approve button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 202, 122, 69),
                          ),
                          child: Text(
                            'Forward',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  _formdata["form"]["approved"] == null
                      ? ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //   // If the form is valid, display a snackbar. In the real world,
                              //   // you'd often call a server or save the information in a database.
                              print("pohoch");
                              declineForm();
                            }
                            // Respond to button press
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please fill all the fields correctly')),
                              );
                            }
                            // Respond to decline button press
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 64, 162, 201),
                          ),
                          child: Text(
                            'Decline',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  _formdata["form"]["approved"] == null
                      ? ElevatedButton(
                          onPressed: () {
                            approveForm();
                            // Respond to decline button press
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 64, 162, 201),
                          ),
                          child: Text(
                            'Approve',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  _formdata["form"]["approved"] == true
                      ? Text(
                          "Application Approved by ${_formdata['form']['approved_by']}",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold))
                      : Container(),
                  _formdata["form"]["approved"] == false
                      ? Text("Application Declined",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))
                      : Container(),
                ],
              )
            : Container(
                child: Text(
                    "You are not the current owner of this form. You have already forwarded this form."),
              ),
        SizedBox(height: 20)
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
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
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
                            _buildListTile(
                              context,
                              Icons.assignment,
                              'View Previous ${widget.formdata['file_extra_JSON'].substring(7, widget.formdata['file_extra_JSON'].length - 1)} Requests by ${_formdata['form']['name']}',
                              RequestsOfAUserListPage({
                                // id of the creator of this file,
                                'id': _formdata['creator'],
                                'type': widget.formdata['file_extra_JSON']
                                    .substring(
                                        7,
                                        widget.formdata['file_extra_JSON']
                                                .length -
                                            1)
                              }),
                            ),
                            SizedBox(height: 20),
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