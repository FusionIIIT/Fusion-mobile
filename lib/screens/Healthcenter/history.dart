import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class HealthRecord {
  final String doctorName;
  final DateTime dateOfVisit;
  final List<String> prescribedMedicines;

  HealthRecord({
    required this.doctorName,
    required this.dateOfVisit,
    required this.prescribedMedicines,
  });
}

class MyApp extends StatelessWidget {
  final List<HealthRecord> healthRecords = [
    HealthRecord(
      doctorName: "Dr. John Doe",
      dateOfVisit: DateTime(2023, 12, 15),
      prescribedMedicines: ["Medicine A", "Medicine B"],
    ),
    HealthRecord(
      doctorName: "Dr. Jane Smith",
      dateOfVisit: DateTime(2023, 11, 20),
      prescribedMedicines: ["Medicine C", "Medicine D", "Medicine E"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Records',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HealthRecordsPage(),
    );
  }
}

class HealthRecordsPage extends StatelessWidget {
  // final List<HealthRecord> healthRecords;

  // HealthRecordsPage({required this.healthRecords});

  final List<HealthRecord> healthRecords = [
    HealthRecord(
      doctorName: "Dr. John Doe",
      dateOfVisit: DateTime(2023, 12, 15),
      prescribedMedicines: ["Medicine A", "Medicine B"],
    ),
    HealthRecord(
      doctorName: "Dr. Jane Smith",
      dateOfVisit: DateTime(2023, 11, 20),
      prescribedMedicines: ["Medicine C", "Medicine D", "Medicine E"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Records'),
      ),
      body: ListView.builder(
        itemCount: healthRecords.length,
        itemBuilder: (context, index) {
          final healthRecord = healthRecords[index];
          return ListTile(
            title: Text(
                '${healthRecord.doctorName} - ${healthRecord.dateOfVisit.toString()}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrescribedMedicinesPage(
                      prescribedMedicines: healthRecord.prescribedMedicines),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PrescribedMedicinesPage extends StatelessWidget {
  final List<String> prescribedMedicines;

  PrescribedMedicinesPage({required this.prescribedMedicines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescribed Medicines'),
      ),
      body: ListView.builder(
        itemCount: prescribedMedicines.length,
        itemBuilder: (context, index) {
          final medicine = prescribedMedicines[index];
          return ListTile(
            title: Text(medicine),
          );
        },
      ),
    );
  }
}
