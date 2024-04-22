import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AcademicCalendar extends StatefulWidget {
  @override
  _AcademicCalendarState createState() => _AcademicCalendarState();
}

class _AcademicCalendarState extends State<AcademicCalendar> {
  late AcademicService academicService;
  List<dynamic> _calendarList = [];

  late TextEditingController _descriptionController;
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  void _editCalendarEntry(int index) {
    final calendarEntry = _calendarList[index];
    _descriptionController.text = calendarEntry['description'];
    _selectedStartDate = DateTime.parse(calendarEntry['from_date']);
    _selectedEndDate = DateTime.parse(calendarEntry['to_date']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Calendar Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              Row(
                children: [
                  Text('Start Date: '),
                  TextButton(
                    onPressed: () => _selectStartDate(context),
                    child: Text(_selectedStartDate.toString().split(' ')[0]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('End Date: '),
                  TextButton(
                    onPressed: () => _selectEndDate(context),
                    child: Text(_selectedEndDate.toString().split(' ')[0]),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calendarList[index]['description'] =
                          _descriptionController.text;
                      _calendarList[index]['from_date'] =
                          _selectedStartDate.toString().split(' ')[0];
                      _calendarList[index]['to_date'] =
                          _selectedEndDate.toString().split(' ')[0];
                      //  print(_calendarList[index]['to_date'].split(' ')[0]);
                      editCalender(
                          _calendarList[index]['id'],
                          _calendarList[index]['description'],
                          _calendarList[index]['from_date'],
                          _calendarList[index]['to_date']);
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .orange[900], // Set background color to orange[900]
                    foregroundColor: Colors.white, // Set text color to white
                  ),
                  child: Text('Save'),
                ),
                SizedBox(width: 8), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, // Set background color to orange[900]
                    foregroundColor: Colors.black, // Set text color to white
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _deleteCalendarEntry(index);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red[900], // Set background color to red
                    foregroundColor: Colors.white, // Set text color to white
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _deleteCalendarEntry(int index) {
    setState(() {
      _calendarList.removeAt(index);
    });
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedEndDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
      });
    }
  }

  void _addCalendarEntry() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Calendar Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              Row(
                children: [
                  Text('Start Date: '),
                  TextButton(
                    onPressed: () => _selectStartDate(context),
                    child: Text(_selectedStartDate.toString().split(' ')[0]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('End Date: '),
                  TextButton(
                    onPressed: () => _selectEndDate(context),
                    child: Text(_selectedEndDate.toString().split(' ')[0]),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _calendarList.add({
                    'id': _calendarList.length + 1,
                    'description': _descriptionController.text,
                    'start_date': _selectedStartDate,
                    'end_date': _selectedEndDate,
                  });
                  addData(
                      _descriptionController.text,
                      _selectedStartDate.toString().split(' ')[0],
                      _selectedEndDate.toString().split(' ')[0]);
                  _descriptionController.clear();
                  _selectedStartDate = DateTime.now();
                  _selectedEndDate = DateTime.now();
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange[900], // Set background color to orange[900]
                foregroundColor: Colors.white, // Set text color to white
              ),
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                _descriptionController.clear();
                _selectedStartDate = DateTime.now();
                _selectedEndDate = DateTime.now();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900], // Set background color to red
                foregroundColor: Colors.white, // Set text color to white
              ),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  getAcademicCalendar() async {
    try {
      bool _loading1 = true;
      Response response = await academicService.getAcademicCalender();
      setState(() {
        _calendarList = jsonDecode(response.body);
        // sort course options on the basis of course_name
        print(_calendarList);
        // print(courseOptions);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  editCalender(
      int index, String description, String from_date, String to_date) async {
    try {
      bool _loading1 = true;
      Response response = await academicService.EditAcademicCalendar(
          index, description, from_date, to_date);
      _loading1 = false;
    } catch (e) {
      print(e);
    }
  }

  addData(String description, String from_date, String to_date) async {
    try {
      bool _loading1 = true;
      Response response = await academicService.AddAcademicCalendar(
          description, from_date, to_date);
      getAcademicCalendar();
      _loading1 = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    _descriptionController = TextEditingController();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();
    getAcademicCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Manage Schedule",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('End Date')),
              DataColumn(label: SizedBox()), // Empty cell for actions
            ],
            rows: _calendarList
                .asMap()
                .entries
                .map(
                  (entry) => DataRow(cells: [
                    DataCell(Text(entry.value['description'])),
                    DataCell(
                      Text(entry.value['from_date'].toString().split(' ')[0]),
                    ),
                    DataCell(
                      Text(entry.value['to_date'].toString().split(' ')[0]),
                    ),
                    DataCell(
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ), // Add padding to Edit button
                        child: ElevatedButton(
                          onPressed: () => _editCalendarEntry(entry.key),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.orange[900], // Set background color to orange[900]
                            foregroundColor:
                                Colors.white, // Set text color to white
                          ),
                          child: Text('Edit'),
                        ),
                      ),
                    ),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCalendarEntry,
        tooltip: 'Add Schedule',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}