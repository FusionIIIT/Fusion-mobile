import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
class FillBacklog extends StatefulWidget {
  @override
  _FillBacklogState createState() => _FillBacklogState();
}

class _FillBacklogState extends State<FillBacklog> {
  Map<String, String?> preferences = {};
  int index = 0;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  void initState() {
    super.initState();
    // Initialize preferences map with empty strings
    preferences = {
      'Slot1': '',
      'Slot2': '',
      'Slot3': '',
      'Slot4': '',
      'Slot5': '',
    };
  }
// final appBarServices _appBarServices = appBarServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Backlog Courses",
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
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: DataTable(
                  columnSpacing: 10, // Adjust spacing between columns
                  columns: [
                    DataColumn(label: Text('Course Name')),
                    DataColumn(label: Text('Course Code')),
                    DataColumn(label: Text('Version')),
                    DataColumn(label: Text('Credit')),
                    DataColumn(label: Text('Grade')),
                    DataColumn(label: Text('Apply for Registration')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Course 1')),
                      DataCell(Text('C001')),
                      DataCell(Text('1.0')),
                      DataCell(Text('3')),
                      DataCell(Text('A')),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          // Handle Apply for Registration action
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange[900]), // Apply same styling as submit button
                        ),
                        child: Text('Apply', style: TextStyle(color: Colors.white)), // Apply same text color as submit button
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Course 2')),
                      DataCell(Text('C002')),
                      DataCell(Text('2.0')),
                      DataCell(Text('4')),
                      DataCell(Text('B')),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          // Handle Apply for Registration action
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange[900]), // Apply same styling as submit button
                        ),
                        child: Text('Apply', style: TextStyle(color: Colors.white)), // Apply same text color as submit button
                      )),
                    ]),
                    // Add more DataRow widgets as needed
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130 ,vertical: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                                .orange[
                            900]), // Setting background color of button to blue
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text('Submit',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
