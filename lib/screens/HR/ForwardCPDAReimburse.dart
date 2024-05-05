import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/screens/HR/ViewInbox.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/screens/HR/RequestsOfAUserList.dart';
import 'package:fusion/api.dart';
class ForwardCPDAReimburse extends StatefulWidget {
  const ForwardCPDAReimburse({required this.formdata, required this.isArchived});
  final formdata;
  final isArchived;
  @override
  State<ForwardCPDAReimburse> createState() {
    return _ForwardCPDAReimburseState();
  }
}

class _ForwardCPDAReimburseState extends State<ForwardCPDAReimburse> {
  // Prefilled fields
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _advanceDueAdjustmentController =
      TextEditingController();
  TextEditingController _balanceAvailableController = TextEditingController();
  TextEditingController _advanceAmountPDAController = TextEditingController();
  TextEditingController _amountCheckedInPDAController = TextEditingController();
  TextEditingController _receiverDesignationController =
      TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formdata = {"notFetched": true};
  bool _loading1 = true;
  late Map<String, dynamic> _trackingdata = {"notFetched": true};
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
  late List<dynamic> designationsOfReceiver = [];
  bool isCreator = false;
  bool isOwner = false;
  bool fetchedDesignationsOfReceiver = false;
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

  getDesignations() async {
    final String host = kserverLink;
    final String path = "/hr2/api/getDesignations/";
    final queryParameters = {
      'username': _receiverNameController.text,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri,headers: {"Authorization": "Token ${token}"});
    if (response.statusCode == 200) {
      final d = await jsonDecode(response.body);
      setState(() {
        fetchedDesignationsOfReceiver = true;
        designationsOfReceiver = d;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please check the entered username.")));
    }
  }

  void trackStatus() async {
    final String host = kserverLink;
    final String path = "/hr2/api/tracking/";
    final queryParameters = {
      'id': widget.formdata['id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri,headers: {"Authorization": "Token ${token}"});
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
    print(_trackingdata);
  }

  void archiveForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/cpdareim/";
    final queryParameters = {'id': widget.formdata['id']};
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.delete(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8","Authorization": "Token ${token}"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application successfully archived!")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to archive application.")));
    }
  }

  void fetchForm() async {
    final String host = kserverLink;
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
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Token ${token}"
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
    isOwner = _formdata['form']['approved'] == null ? isOwner : true;
    isCreator = _formdata['creator'] == datap.user!['username'];
    isCreator = widget.isArchived ? false : isCreator;
    // Fetch form data from the backend
  }

  void approveForm() async {
    print(_formdata);
    final String host = kserverLink;
    final String path = "/hr2/api/cpdareim/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };

    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_designation": _receiverDesignationController.text,
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
      headers: {"Content-type": "application/json; charset=UTF-8","Authorization": "Token ${token}"},
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
    final String host = kserverLink;
    final String path = "/hr2/api/cpdareim/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['advanceDueAdjustment'] =
        _advanceDueAdjustmentController.text.length == 0
            ? _formdata['form']['advanceDueAdjustment']
            : _advanceDueAdjustmentController.text;
    _formdata['form']['advanceAmountPDA'] =
        _advanceAmountPDAController.text.length == 0
            ? _formdata['form']['advanceAmountPDA']
            : _advanceAmountPDAController.text;
    _formdata['form']['amountCheckedInPDA'] =
        _amountCheckedInPDAController.text.length == 0
            ? _formdata['form']['amountCheckedInPDA']
            : _amountCheckedInPDAController.text;
    _formdata['form']['balanceAvailable'] =
        _balanceAvailableController.text.length == 0
            ? _formdata['form']['balanceAvailable']
            : _balanceAvailableController.text;

    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_designation": _receiverDesignationController.text,
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
      headers: {"Content-type": "application/json; charset=UTF-8","Authorization": "Token ${token}"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Forwarded Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Forward")));
    }
  }

  void declineForm() async {
    final String host = kserverLink;
    final String path = "/hr2/api/cpdareim/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['advanceDueAdjustment'] =
        _advanceDueAdjustmentController.text.length == 0
            ? _formdata['form']['advanceDueAdjustment']
            : _advanceDueAdjustmentController.text;
    _formdata['form']['advanceAmountPDA'] =
        _advanceAmountPDAController.text.length == 0
            ? _formdata['form']['advanceAmountPDA']
            : _advanceAmountPDAController.text;
    _formdata['form']['amountCheckedInPDA'] =
        _amountCheckedInPDAController.text.length == 0
            ? _formdata['form']['amountCheckedInPDA']
            : _amountCheckedInPDAController.text;
    _formdata['form']['balanceAvailable'] =
        _balanceAvailableController.text.length == 0
            ? _formdata['form']['balanceAvailable']
            : _balanceAvailableController.text;
    _formdata['form']['approved'] = false;
    Uri uri = (Uri.http(host, path, queryParameters));
    final data = [
      {
        "file_id": widget.formdata['id'],
        "receiver_designation": _receiverDesignationController.text,
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
      headers: {"Content-type": "application/json; charset=UTF-8","Authorization": "Token ${token}"},
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Declined Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to Decline")));
    }
  }

  //form builder function
  Widget _buildForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            Text(_trackingdata['status'][index]['current_id']),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Forwarded on : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_trackingdata['status'][index]['forward_date']
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
                                  : _trackingdata['status'][index]['remarks']),
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
        'Advance Taken: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['advanceTaken'].toString()),
      SizedBox(height: 10),
      Text(
        'Purpose: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['purpose']),
      SizedBox(height: 10),
      Text(
        'Adjustment Submitted: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(_formdata['form']['adjustmentSubmitted'].toString()),
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
      _formdata['form']['advanceDueAdjustment'] == null
          ? TextFormField(
              controller: _advanceDueAdjustmentController,
              maxLength: 50,
              enabled: _formdata["form"]["approved"] == null,
              decoration: const InputDecoration(
                label: Text('Advance Due for Adjustment '),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please fill the field';
                }
              },
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Advance Due for Adjustment",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_formdata['form']['advanceDueAdjustment'].toString())
            ]),
      SizedBox(height: 20),
      _formdata['form']['advanceAmountPDA'] == null
          ? TextFormField(
              controller: _advanceAmountPDAController,
              maxLength: 50,
              enabled: _formdata["form"]["approved"] == null,
              decoration: const InputDecoration(
                label: Text('Advance PDA Amount '),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please fill the field';
                }
              },
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Advance PDA Amount",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_formdata['form']['advanceAmountPDA'].toString())
            ]),
      SizedBox(height: 20),
      _formdata['form']['amountCheckedInPDA'] == null
          ? TextFormField(
              controller: _amountCheckedInPDAController,
              maxLength: 50,
              enabled: _formdata["form"]["approved"] == null,
              decoration: const InputDecoration(
                label: Text('Amount Checked in PDA '),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please fill the field';
                }
              },
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Amount Checked in PDA",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_formdata['form']['amountCheckedInPDA'].toString())
            ]),
      SizedBox(height: 20),
      _formdata['form']['balanceAvailable'] == null
          ? TextFormField(
              controller: _balanceAvailableController,
              maxLength: 50,
              enabled: _formdata["form"]["approved"] == null,
              decoration: const InputDecoration(
                label: Text('Balance Available'),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please fill the field';
                }
              },
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Balance Available",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_formdata['form']['balanceAvailable'].toString())
            ]),
      SizedBox(height: 20),
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
      ElevatedButton(
          onPressed: () {
            getDesignations();
          },
          child: Text("Show Designations of user")),
      SizedBox(height: 20),
      fetchedDesignationsOfReceiver
          ? DropdownButtonFormField(
              items: designationsOfReceiver
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {
                _receiverDesignationController.text = value.toString();
              })
          : Container(),
      SizedBox(height: 20),
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                _formdata["form"]["approved"] == null
                    ? ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //   // If the form is valid, display a snackbar. In the real world,
                            //   // you'd often call a server or save the information in a database.
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
                          backgroundColor: Color.fromARGB(255, 64, 162, 201),
                        ),
                        child: Text(
                          'Decline',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                _formdata["form"]["approved"] == null
                    ? ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Approve Application"),
                                  content: Text(
                                      "Are you sure you want to approve this application?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () {
                                          approveForm();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Approve"))
                                  ],
                                );
                              });
                          // Respond to decline button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 162, 201),
                        ),
                        child: Text(
                          'Approve',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                  "You are not the owner of this form. You have already forwarded this form."),
            ),
      SizedBox(height: 20),
      isCreator
          ? ElevatedButton(
              onPressed: () {
                //  show alert dialog box
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Archive Application"),
                        content: Text(
                            "Are you sure you want to archive this application? This action cannot be undone!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                archiveForm();
                                Navigator.of(context).pop();
                              },
                              child: Text("Archive this form"))
                        ],
                      );
                    });
                // approveForm();
                // Respond to decline button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 64, 162, 201),
              ),
              child: Text(
                'Archive this form.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          : Container(),
      SizedBox(
        height: 10,
      ),
      widget.isArchived
          ? Text("This form has been archived.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))
          : Container(),
      SizedBox(
        height: 10,
      )
    ]);
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
        headerTitle: "View CPDA-R Form",
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
