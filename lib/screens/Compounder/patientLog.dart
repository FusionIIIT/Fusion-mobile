import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PrescriptionEntry {
  String rollNumber;
  String doctor;
  String medicine;
  int quantity;
  int days;
  int timesPerDay;
  String healthIssue;
  DateTime date;

  PrescriptionEntry({
    required this.rollNumber,
    required this.doctor,
    required this.medicine,
    required this.quantity,
    required this.days,
    required this.timesPerDay,
    required this.healthIssue,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescription Entry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PrescriptionEntry> entries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Entries'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          PrescriptionEntry entry = entries[index];
          return ListTile(
            title: Text(entry.medicine),
            subtitle: Text(
                'Doctor: ${entry.doctor}\nQuantity: ${entry.quantity}\nDays: ${entry.days}\nTimes per Day: ${entry.timesPerDay}\nHealth Issue: ${entry.healthIssue}\nDate: ${entry.date.toString().split(' ')[0]}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final entry = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrescriptionEntryModal()),
          );
          if (entry != null) {
            setState(() {
              entries.add(entry);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PrescriptionEntryModal extends StatefulWidget {
  @override
  _PrescriptionEntryModalState createState() => _PrescriptionEntryModalState();
}

class _PrescriptionEntryModalState extends State<PrescriptionEntryModal> {
  late List<String> rollNumbers;
  late List<String> doctors;
  late List<String> medicines;
  String? selectedRollNumber;
  String? selectedDoctor;
  String? selectedMedicine;
  int quantity = 1;
  int days = 1;
  int timesPerDay = 1;
  String healthIssue = '';
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize dropdown data
    rollNumbers = ['Roll Number 1', 'Roll Number 2', 'Roll Number 3'];
    doctors = ['Doctor 1', 'Doctor 2', 'Doctor 3'];
    medicines = ['Medicine A', 'Medicine B', 'Medicine C'];
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Prescription Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: selectedRollNumber,
                items: rollNumbers.map((rollNumber) {
                  return DropdownMenuItem<String>(
                    value: rollNumber,
                    child: Text(rollNumber),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRollNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Roll Number',
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedDoctor,
                items: doctors.map((doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor,
                    child: Text(doctor),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Doctor',
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedMedicine,
                items: medicines.map((medicine) {
                  return DropdownMenuItem<String>(
                    value: medicine,
                    child: Text(medicine),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMedicine = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Medicine',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1;
                },
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  days = int.tryParse(value) ?? 1;
                },
                decoration: InputDecoration(
                  labelText: 'Number of Days',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  timesPerDay = int.tryParse(value) ?? 1;
                },
                decoration: InputDecoration(
                  labelText: 'Times per Day',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  healthIssue = value;
                },
                decoration: InputDecoration(
                  labelText: 'Health Issue',
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Date: ${selectedDate.toString().split(' ')[0]}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Create a PrescriptionEntry object
                  PrescriptionEntry entry = PrescriptionEntry(
                    rollNumber: selectedRollNumber!,
                    doctor: selectedDoctor!,
                    medicine: selectedMedicine!,
                    quantity: quantity,
                    days: days,
                    timesPerDay: timesPerDay,
                    healthIssue: healthIssue,
                    date: selectedDate,
                  );
                  Navigator.pop(context, entry);
                },
                child: Text('Add Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
