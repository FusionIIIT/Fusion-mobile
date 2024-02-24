import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Forward_Decline_CPDAadv_Hradmin.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final String _name = 'John Doe';
  final String _designation = 'Manager';
  final String _pfNo = '1234567890';
  final double _amountReq = 5000.0;
  final String _purpose = 'Vacation';
  final double _advanceDue = 2000.0;
  late Map<String, dynamic> _formdata = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchForm();
  }

  void fetchForm() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/cpdaadv/";
    final queryParameters = {
      'id': widget.formdata['src_object_id'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    print(uri);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var client = http.Client();
    var response = await client.get(uri, headers: headers);
    _formdata = jsonDecode(response.body);
    print(_formdata);
    // Fetch form data from the backend
  }

  void submitForm() async {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ForwardOrDeclineFormHradmin()));

    // final data =

    // var response = await http.post(
    //   Uri.parse(url),
    //   body: data,
    //   headers: {
    //     "Content-Type": "application/json",
    //   },
    // );
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          submitForm();
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
                      ),
                      ElevatedButton(
                        onPressed: () {
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
