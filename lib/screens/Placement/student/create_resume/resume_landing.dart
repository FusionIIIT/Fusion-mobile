import 'package:flutter/material.dart';
import 'class.dart';
import 'package:fusion/screens/Placement/student/create_resume/resumeMakerPage.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ResumeLandingPage extends StatefulWidget {
  @override
  _ResumeLandingPageState createState() => _ResumeLandingPageState();
}

class _ResumeLandingPageState extends State<ResumeLandingPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  List<Resume> savedResumes = []; // Initial empty list of saved resumes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Saved Resumes",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Saved resumes:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: savedResumes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(savedResumes[index].title!),
                    // Implement onTap to view the resume details
                    onTap: () {
                      // Handle tapping on a resume
                      // For example, navigate to a page to view resume details
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewResume,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

  void _createNewResume() {
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResumeMakerPage()));// Navigate to a page to create a new resume
    
  }
}
