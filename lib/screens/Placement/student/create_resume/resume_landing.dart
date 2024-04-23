import 'package:flutter/material.dart';
import 'resume_model.dart';
import 'package:fusion/screens/Placement/student/create_resume/resumeMakerPage.dart';

class ResumeLandingPage extends StatefulWidget {
  @override
  _ResumeLandingPageState createState() => _ResumeLandingPageState();
}

class _ResumeLandingPageState extends State<ResumeLandingPage> {
  List<Resume> savedResumes = []; // Initial empty list of saved resumes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Resumes'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
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

