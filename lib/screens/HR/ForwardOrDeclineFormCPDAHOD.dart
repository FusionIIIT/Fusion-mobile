import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Forward_Decline_CPDAadv_Hradmin.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/screens/HR/Request_list.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class ForwardOrDeclineFormCPDAHOD extends StatefulWidget {
  const ForwardOrDeclineFormCPDAHOD({required this.formdata});
  final formdata;

  @override
  State<ForwardOrDeclineFormCPDAHOD> createState() {
    return _ForwardOrDeclineFormCPDAHODState();
  }
}

class _ForwardOrDeclineFormCPDAHODState
    extends State<ForwardOrDeclineFormCPDAHOD> {
  // Prefilled fields
  TextEditingController _receiverNameController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _adjustedPDAController = TextEditingController();
  TextEditingController _balanceAvailableController = TextEditingController();
  TextEditingController _advanceAmountPDAController = TextEditingController();
  TextEditingController _amountCheckedInPDAController = TextEditingController();
  late Map<String, dynamic> _formdata = {"notFetched": true};
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
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
    }
    fetchForm();

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

  void fetchForm() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/formFetch/";
    print(widget.formdata);
    final queryParameters = {
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
    print(_formdata);
    // Fetch form data from the backend
  }

  void approveForm() async {
    bool valid = true;
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/cpdaadv/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['adjustedPDA'] = _adjustedPDAController.text.length == 0
        ? valid = false
        : _adjustedPDAController.text;
    _formdata['form']['advanceAmountPDA'] =
        _advanceAmountPDAController.text.length == 0
            ? valid = false
            : _advanceAmountPDAController.text;
    _formdata['form']['amountCheckedInPDA'] =
        _amountCheckedInPDAController.text.length == 0
            ? valid = false
            : _amountCheckedInPDAController.text;
    _formdata['form']['balanceAvailable'] =
        _balanceAvailableController.text.length == 0
            ? valid = false
            : _balanceAvailableController.text;
    if (!valid) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill all the required fields")));
      return;
    }
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RequestListPage()));
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
    final String path = "/hr2/cpdaadv/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['adjustedPDA'] = _adjustedPDAController.text.length == 0
        ? _formdata['form']['adjustedPDA']
        : _adjustedPDAController.text;
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
    final String path = "/hr2/cpdaadv/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    _formdata['form']['adjustedPDA'] = _adjustedPDAController.text.length == 0
        ? _formdata['form']['adjustedPDA']
        : _adjustedPDAController.text;
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

  //form builder function
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          'Amount Req: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['amountRequired'].toString()),
        SizedBox(height: 10),
        Text(
          'Purpose: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['purpose']),
        SizedBox(height: 10),
        Text(
          'Advance due for adjustment: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_formdata['form']['advanceDueAdjustment'].toString()),
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
          enabled: _formdata["form"]["approved"] == null,
          decoration: const InputDecoration(
            label: Text('Receiver\'s Name '),
          ),
          validator: (value) {
            return 'Demo...';
          },
        ),
        _formdata['form']['adjustedPDA'] == null
            ? TextFormField(
                controller: _adjustedPDAController,
                maxLength: 50,
                enabled: _formdata["form"]["approved"] == null,
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
                Text(_formdata['form']['adjustedPDA'].toString())
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
                  return 'Demo...';
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
                  return 'Demo...';
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
                  return 'Demo...';
                },
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Balance Available",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formdata['form']['balanceAvailable'].toString())
              ]),
        SizedBox(height: 20),
        TextFormField(
          controller: _remarksController,
          maxLength: 50,
          enabled: _formdata["form"]["approved"] == null,
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
            _formdata["form"]["approved"] == null
                ? ElevatedButton(
                    onPressed: () {
                      forwardForm();
                      // Respond to approve button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 202, 122, 69),
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
                      declineForm();
                      // Respond to decline button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 64, 162, 201),
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
                      approveForm();
                      // Respond to decline button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 64, 162, 201),
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
                      : _buildForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
