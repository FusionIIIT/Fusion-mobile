import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

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
  late AcademicService academicService;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  void initState() {
    super.initState();
    academicService = AcademicService();
  }

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
    final startDate = _startDate!.toString().substring(0, 10);
    final endDate = _endDate!.toString().substring(0, 10);
    int semester = _semesterNumber!;

    Response response = await academicService.configurePreRegistration(
        startDate, endDate, semester);
    setState(() {
      _responseText = (jsonDecode(response.body))["message"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: "Configure Pre-Registration",
          onDesignationChanged: (newValue) {
            setState(() {
              curr_desig = newValue;
            });
          }
        ),
        drawer: SideDrawer(curr_desig: curr_desig),
        bottomNavigationBar:
            MyBottomNavigationBar(),
        body: TabBarView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 10),
                        Text(
                          _startDate == null
                              ? 'Select Start Date'
                              : 'Start Date: ${_startDate!.toString().split(" ")[0]}',
                        ),
                      ],
                    ),
                    onTap: () => _selectStartDate(context),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 10),
                        Text(
                          _endDate == null
                              ? 'Select End Date'
                              : 'End Date: ${_endDate!.toString().split(" ")[0]}',
                        ),
                      ],
                    ),
                    onTap: () => _selectEndDate(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(16.0), // Adjust the padding as needed
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Semester Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter semester number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          // print(value);
                          _semesterNumber = int.tryParse(value);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800],
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                  SizedBox(height: 20),
                  _responseText == null
                      ? Container()
                      : Text(
                          _responseText!,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
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
