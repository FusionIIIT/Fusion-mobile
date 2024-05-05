import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
import 'class.dart';
import 'package:fusion/screens/Placement/student/create_resume/support.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class ResumeMakerPage extends StatefulWidget {
  @override
  _ResumeMakerPageState createState() => _ResumeMakerPageState();
}

class _ResumeMakerPageState extends State<ResumeMakerPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpiController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();

  final TextEditingController _workExperienceController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _projectDescriptionController = TextEditingController();
  final TextEditingController _projectLinkController = TextEditingController();
  final TextEditingController _codingPlatformNameController = TextEditingController();
  final TextEditingController _codingPlatformLinkController = TextEditingController();

  List<CodingPlatformProfile> codingPlatformProfiles = [];
  List<Education> educationBackground = [];
  List<Project> projects = [];
  List<String> skills = [];
  List<WorkExperience> workExperiences = [];

  Future<void> _createPDF(Resume resume) async {
    final fontData = await rootBundle.load('assets/helvetica.ttf');
    final helveticaFont = pw.Font.ttf(fontData.buffer.asByteData());

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Name: ${resume.name}', style: pw.TextStyle(font: helveticaFont)),
              pw.Text('CPI: ${resume.cpi}', style: pw.TextStyle(font: helveticaFont)),
              pw.Text('Email: ${resume.email}', style: pw.TextStyle(font: helveticaFont)),
              pw.Text('Phone: ${resume.phoneNumber}', style: pw.TextStyle(font: helveticaFont)),
              pw.Text('LinkedIn ID: ${resume.linkedinId}', style: pw.TextStyle(font: helveticaFont)),
              pw.Text('GitHub ID: ${resume.githubId}', style: pw.TextStyle(font: helveticaFont)),
              // Add other resume fields here
            ],
          );
        },
      ),
    );

    final bytes = await pdf.save();
    await saveAndLaunchFile(bytes, 'resume.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Add Information",
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Personal Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _cpiController,
                decoration: InputDecoration(labelText: 'CPI'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _linkedinController,
                decoration: InputDecoration(labelText: 'LinkedIn ID'),
              ),
              TextFormField(
                controller: _githubController,
                decoration: InputDecoration(labelText: 'GitHub ID'),
              ),
              SizedBox(height: 20),
              Text('Work Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _workExperienceController,
                decoration: InputDecoration(labelText: 'Work Experience'),
              ),
              SizedBox(height: 20),
              Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'Skills'),
              ),
              SizedBox(height: 20),
              Text('Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _projectTitleController,
                decoration: InputDecoration(labelText: 'Project Title'),
              ),
              TextFormField(
                controller: _projectDescriptionController,
                decoration: InputDecoration(labelText: 'Project Description'),
              ),
              TextFormField(
                controller: _projectLinkController,
                decoration: InputDecoration(labelText: 'Project Link'),
              ),
              SizedBox(height: 20),
              Text('Coding Platform Profiles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _codingPlatformNameController,
                decoration: InputDecoration(labelText: 'Platform Name'),
              ),
              TextFormField(
                controller: _codingPlatformLinkController,
                decoration: InputDecoration(labelText: 'Profile Link'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Resume resume = Resume(
                    name: _nameController.text,
                    cpi: double.tryParse(_cpiController.text) ?? 0.0,
                    email: _emailController.text,
                    phoneNumber: _phoneController.text,
                    linkedinId: _linkedinController.text,
                    githubId: _githubController.text,
                    codingPlatformProfiles: codingPlatformProfiles,
                    educationBackground: educationBackground,
                    projects: projects,
                    skills: skills,
                    workExperiences: workExperiences,
                  );

                  await _createPDF(resume);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}