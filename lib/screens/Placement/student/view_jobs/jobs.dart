import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  // Dummy list of job invitations
  List<Map<String, String>> jobInvitations = [
    {"name": "Google", "description": "SDE Intern"},
    {"name": "Microsoft", "description": "Job Description 2"},
    // Add more job invitations here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "View Jobs",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Company Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              // Display job invitations using ListView.builder
              ListView.builder(
                shrinkWrap: true,
                itemCount: jobInvitations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepOrangeAccent,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobInvitations[index]['name']!,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          jobInvitations[index]['description']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle "Accept" button press
                              },
                              child: Text('Accept'),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle "Decline" button press
                              },
                              child: Text('Decline'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
