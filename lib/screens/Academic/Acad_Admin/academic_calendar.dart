import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class AcademicCalendar extends StatefulWidget {
  @override
  _AcademicCalendarState createState() => _AcademicCalendarState();
}

class _AcademicCalendarState extends State<AcademicCalendar> {
  List<Map<String, dynamic>> _calendarList = [
    {
      'id': 1,
      'description': 'Semester 1 Begins',
      'start_date': DateTime(2022, 9, 1),
      'end_date': DateTime(2022, 12, 15),
    },
    {
      'id': 2,
      'description': 'Semester 1 Exams',
      'start_date': DateTime(2022, 12, 20),
      'end_date': DateTime(2023, 1, 10),
    },
    {
      'id': 3,
      'description': 'Semester 2 Begins',
      'start_date': DateTime(2023, 2, 1),
      'end_date': DateTime(2023, 5, 15),
    },
    // Add more calendar entries as needed
  ];

  late TextEditingController _descriptionController;
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  void _editCalendarEntry(int index) {
    final calendarEntry = _calendarList[index];
    _descriptionController.text = calendarEntry['description'];
    _selectedStartDate = calendarEntry['start_date'];
    _selectedEndDate = calendarEntry['end_date'];

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
                      _calendarList[index]['description'] = _descriptionController.text;
                      _calendarList[index]['start_date'] = _selectedStartDate;
                      _calendarList[index]['end_date'] = _selectedEndDate;
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[900], // Set background color to orange[900]
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
                    backgroundColor: Colors.white, // Set background color to orange[900]
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
                    backgroundColor: Colors.red[900], // Set background color to red
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

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();
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
        bottomNavigationBar:
            MyBottomNavigationBar(),
      body: SingleChildScrollView(
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
                  DataCell(Text(entry.value['start_date'].toString().split(' ')[0])),
                  DataCell(Text(entry.value['end_date'].toString().split(' ')[0])),
                  DataCell(
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0), // Add padding to Edit button
                      child: ElevatedButton(
                        onPressed: () => _editCalendarEntry(entry.key),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900], // Set background color to orange[900]
                          foregroundColor: Colors.white, // Set text color to white
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
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}
