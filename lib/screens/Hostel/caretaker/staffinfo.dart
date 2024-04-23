<<<<<<< HEAD
import 'dart:convert';
=======

>>>>>>> 8bce4293cf822864992d1fb8dcfa3ff69a89d323
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Worker {
  final String workerId;
  final String name;
  final String monthYear;
  final String today;
  final int workingDays;
  final int totalAbsent;
  final String remark;

  Worker({
    required this.workerId,
    required this.name,
    required this.monthYear,
    required this.today,
    required this.workingDays,
    required this.totalAbsent,
    required this.remark,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      workerId: json['workerId'],
      name: json['name'],
      monthYear: json['monthYear'],
      today: json['today'],
      workingDays: json['workingDays'],
      totalAbsent: json['totalAbsent'],
      remark: json['remark'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Staffinfo(),
    );
  }
}

class Staffinfo extends StatefulWidget {
  const Staffinfo({Key? key}) : super(key: key);

  @override
  _StaffInfoState createState() => _StaffInfoState();
}

class _StaffInfoState extends State<Staffinfo> {
  late Map<String, List<Worker>> halls;
  String? selectedHall;

  Future<void> _loadHallData() async {
    String jsonString = '''
    {
      "halls": {
        "hall1": [
          {
            "workerId": "001",
            "name": "Rajesh Sharma",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 20,
            "totalAbsent": 2,
            "remark": "Good performance overall."
          },
          {
            "workerId": "004",
            "name": "Anita Singh",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 19,
            "totalAbsent": 1,
            "remark": "Consistently good attendance."
          }
        ],
        "hall2": [
          {
            "workerId": "002",
            "name": "Vikram Patel",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 18,
            "totalAbsent": 4,
            "remark": "Needs improvement in attendance."
          },
          {
            "workerId": "005",
            "name": "Deepa Gupta",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 21,
            "totalAbsent": 3,
            "remark": "Average attendance, some improvement needed."
          }
        ],
        "hall3": [
          {
            "workerId": "003",
            "name": "Arun Kumar",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 22,
            "totalAbsent": 1,
            "remark": "Excellent attendance record."
          },
          {
            "workerId": "006",
            "name": "Preeti Verma",
            "monthYear": "April/2024",
            "today": "2024-04-22",
            "workingDays": 20,
            "totalAbsent": 2,
            "remark": "Good performance overall."
          }
        ]
      }
    }
    ''';

    Map<String, dynamic> data = json.decode(jsonString);
    Map<String, dynamic> hallsData = data['halls'];
    setState(() {
      halls = hallsData.map((key, value) =>
          MapEntry(key, (value as List).map((e) => Worker.fromJson(e)).toList()));
      selectedHall = halls.keys.first;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadHallData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              items: halls.keys.map((String hall) {
                return DropdownMenuItem<String>(
                  value: hall,
                  child: Text(hall),
                );
              }).toList(),
              value: selectedHall,
              onChanged: (String? newValue) {
                setState(() {
                  selectedHall = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedHall != null && halls[selectedHall!] != null)
              Expanded(
                child: ListView.builder(
                  itemCount: halls[selectedHall!]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Worker worker = halls[selectedHall!]![index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(worker.name),
                        subtitle: Text('Working days: ${worker.workingDays}, Absent: ${worker.totalAbsent}'),
                        trailing: PopupMenuButton<String>(
                          itemBuilder: (context) => [
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'edit') {
                              // Implement edit logic
                              _showEditDialog(worker);
                            } else if (value == 'delete') {
                              // Implement delete logic
                              _showDeleteDialog(worker);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add logic
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showEditDialog(Worker worker) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Worker'),
        content: Text('You selected ${worker.name} for editing.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement edit logic
              Navigator.pop(context);
            },
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Worker worker) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Worker'),
        content: Text('Are you sure you want to delete ${worker.name}?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement delete logic
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
