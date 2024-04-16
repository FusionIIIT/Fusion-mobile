import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MedicalProfilePage(),
  ));
}

class MedicalProfilePage extends StatefulWidget {
  @override
  _MedicalProfilePageState createState() => _MedicalProfilePageState();
}

class _MedicalProfilePageState extends State<MedicalProfilePage> {

  String patientBloodGroup = 'O+';
  double patientWeight = 70.0; // in kg
  double patientHeight = 170.0; // in cm

  List<Dependency> dependencies = [
    Dependency(name: 'Dependency 1', bloodGroup: 'A+', weight: 60.0, height: 165.0),
    Dependency(name: 'Dependency 2', bloodGroup: 'B-', weight: 55.0, height: 160.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Blood Group: $patientBloodGroup'),
            Text('Weight: $patientWeight kg'),
            Text('Height: $patientHeight cm'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _editMedicalData(context, isPatient: true);
              },
              child: Text('Edit Patient Data'),
            ),
            SizedBox(height: 30),
            Text(
              'Dependencies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: dependencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        title: Text('Name: ${dependencies[index].name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Group: ${dependencies[index].bloodGroup}'),
                            Text('Weight: ${dependencies[index].weight} kg'),
                            Text('Height: ${dependencies[index].height} cm'),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            _editMedicalData(context, isPatient: false, dependencyIndex: index);
                          },
                          child: Text('Edit'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to page for managing dependency data
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ManageDependenciesPage()),
            //     );
            //   },
            //   child: Text('Manage Dependencies'),
            // ),
          ],
        ),
      ),
    );
  }

  void _editMedicalData(BuildContext context, {required bool isPatient, int? dependencyIndex}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Medical Data'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Blood Group'),
                  onChanged: (value) {
                    if (isPatient) {
                      setState(() {
                        patientBloodGroup = value;
                      });
                    } else {
                      setState(() {
                        dependencies[dependencyIndex!].bloodGroup = value;
                      });
                    }
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (isPatient) {
                      setState(() {
                        patientWeight = double.parse(value);
                      });
                    } else {
                      setState(() {
                        dependencies[dependencyIndex!].weight = double.parse(value);
                      });
                    }
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (isPatient) {
                      setState(() {
                        patientHeight = double.parse(value);
                      });
                    } else {
                      setState(() {
                        dependencies[dependencyIndex!].height = double.parse(value);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Dependency {
  final String name;
  String bloodGroup;
  double weight;
  double height;

  Dependency({required this.name, required this.bloodGroup, required this.weight, required this.height});
}

class ManageDependenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Dependencies'),
      ),
      body: Center(
        child: Text('Manage Dependencies Page'),
      ),
    );
  }
}
