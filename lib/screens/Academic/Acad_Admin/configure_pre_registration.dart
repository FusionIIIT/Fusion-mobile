import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fusion/Components/side_drawer.dart';
import 'package:flutter/services.dart';


class ConfigurePreRegistration extends StatefulWidget {
  @override
  _ConfigurePreRegistration createState() => _ConfigurePreRegistration();
}

class _ConfigurePreRegistration extends State<ConfigurePreRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _responseText;
  int? _semesterNumber;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_startDate == null || _endDate == null) {
      return;
    }
    // If the form is valid, proceed with API call
    final startDate = _startDate!.toString();
    final endDate = _endDate!.toString();
    final semester = _semesterNumber!.toString();

    print("Sem: $semester");
    


    // Assuming you have an API endpoint to post the data to
    final apiUrl = 'YOUR_API_ENDPOINT_HERE';
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({'start_date': startDate, 'end_date': endDate}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Handle success
      setState(() {
        _responseText = response.body;
      });
    } else {
      // Handle error
      print('Failed to post data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "FUSION",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Conf Final Registration',
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              ListTile(
                title: Text(
                  _startDate == null ? 'Select Start Date' : 'Start Date: ${_startDate!.toString().split(" ")[0]}',
                ),
                onTap: () => _selectStartDate(context),
              ),
              ListTile(
                title: Text(
                  _endDate == null ? 'Select End Date' : 'End Date: ${_endDate!.toString().split(" ")[0]}',
                ),
                onTap: () => _selectEndDate(context),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Semester Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'Please enter semester number';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    setState(() {
                      _semesterNumber = int.tryParse(value);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
