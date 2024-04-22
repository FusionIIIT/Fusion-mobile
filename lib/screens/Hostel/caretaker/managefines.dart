import 'dart:convert';
import 'package:flutter/material.dart';

class Student {
  late final String name;
  late final String rollNo;
  late final double fineAmount;
  late final String reason;
  late final String description;

  Student({
    required this.name,
    required this.rollNo,
    required this.fineAmount,
    required this.reason,
    required this.description,
  });
}

class Managefines extends StatefulWidget {
  const Managefines({Key? key}) : super(key: key);

  @override
  _ManagefinesState createState() => _ManagefinesState();
}

class _ManagefinesState extends State<Managefines> {
  List<Student> students = [];
  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _fetchFines();
  }

  Future<void> _fetchFines() async {
    // Simulating API call to fetch fines
    final String finesData = '''
    [
      {"name": "Raju", "rollNo": "21bcs001", "fineAmount": 50.0, "reason": "Late Entry", "description": "Late by 15 minutes"},
      {"name": "Keerthan", "rollNo": "21bme002", "fineAmount": 30.0, "reason": "Hostel Damage", "description": "Broken window glass"},
      {"name": "Aravind", "rollNo": "21bcs003", "fineAmount": 20.0, "reason": "Misbehaviour", "description": "Argument with warden"}
    ]
    ''';
    final List<dynamic> finesList = json.decode(finesData);
    setState(() {
      students = finesList.map((fine) => Student(
        name: fine['name'],
        rollNo: fine['rollNo'],
        fineAmount: fine['fineAmount'],
        reason: fine['reason'],
        description: fine['description'],
      )).toList();
      filteredStudents = List.from(students);
    });
  }

  Future<void> _editFineDetails(Student student) async {
    // Display dialog to edit fine details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double fineAmount = student.fineAmount;
        String reason = student.reason;
        String description = student.description;

        return AlertDialog(
          title: Text('Edit Fine Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Fine Amount'),
                  controller: TextEditingController(text: fineAmount.toString()),
                  onChanged: (value) {
                    fineAmount = double.tryParse(value) ?? 0.0;
                  },
                ),
                Text('Reason'),
                DropdownButtonFormField<String>(
                  value: reason,
                  onChanged: (value) {
                    setState(() {
                      reason = value!;
                    });
                  },
                  items: <String>['Late Entry', 'Hostel Damage', 'Misbehaviour', 'Others']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: TextEditingController(text: description),
                  onChanged: (value) {
                    description = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform the edit operation here
                setState(() {
                  // Find the index of the student in the list
                  int index = students.indexWhere((s) => s.rollNo == student.rollNo);
                  if (index != -1) {
                    // Update the properties of the student object directly
                    students[index].fineAmount = fineAmount;
                    students[index].reason = reason;
                    students[index].description = description;
                    // Update the filteredStudents list as well
                    int filteredIndex = filteredStudents.indexWhere((s) => s.rollNo == student.rollNo);
                    if (filteredIndex != -1) {
                      filteredStudents[filteredIndex].fineAmount = fineAmount;
                      filteredStudents[filteredIndex].reason = reason;
                      filteredStudents[filteredIndex].description = description;
                    }
                  }
                });
                // Simulate PUT API call to update fine details
                // _updateFineDetails(student);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }


  Future<void> _deleteFineDetails(Student student) async {
    // Show confirmation dialog before deleting the fine
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this fine?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the fine
                _deleteFine(student);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteFine(Student student) {
    setState(() {
      students.remove(student);
      filteredStudents.remove(student);
    });
    // Simulate DELETE API call to delete fine details
    // _invokeDeleteAPI(student.rollNo);
  }

  Future<void> _showAddDialog() async {
    String name = '';
    String rollNo = '';
    double fineAmount = 0.0;
    String reason = 'Late Entry';
    String description = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Fine'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Roll No'),
                  onChanged: (value) {
                    rollNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Fine Amount'),
                  onChanged: (value) {
                    fineAmount = double.tryParse(value) ?? 0.0;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: reason,
                  onChanged: (value) {
                    setState(() {
                      reason = value!;
                    });
                  },
                  items: <String>['Late Entry', 'Hostel Damage', 'Misbehaviour', 'Others']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) {
                    description = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform the add operation here
                setState(() {
                  final newFine = Student(
                    name: name,
                    rollNo: rollNo,
                    fineAmount: fineAmount,
                    reason: reason,
                    description: description,
                  );
                  students.add(newFine);
                  filteredStudents.add(newFine);
                });
                // Simulate POST API call to add new fine details
                // _addFineDetails(name, rollNo, fineAmount, reason, description);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _searchFines(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredStudents = students.where((student) {
          return student.name.toLowerCase().contains(query.toLowerCase()) ||
              student.rollNo.toLowerCase().contains(query.toLowerCase());
        }).toList();
      } else {
        filteredStudents = List.from(students);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Fines'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? result = await showSearch<String?>(
                context: context,
                delegate: FineSearchDelegate(students: students),
              );
              if (result != null) {
                _searchFines(result);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Roll No')),
            DataColumn(label: Text('Fine Amount')),
            DataColumn(label: Text('Reason')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Edit')),
            DataColumn(label: Text('Remove')),
          ],
          rows: List<DataRow>.generate(
            filteredStudents.length,
                (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text(filteredStudents[index].name)),
                DataCell(Text(filteredStudents[index].rollNo)),
                DataCell(Text('₹${filteredStudents[index].fineAmount.toString()}')),
                DataCell(Text(filteredStudents[index].reason)),
                DataCell(Text(filteredStudents[index].description)),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editFineDetails(filteredStudents[index]);
                    },
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteFineDetails(filteredStudents[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
      ),
    );
  }
}

class FineSearchDelegate extends SearchDelegate<String?> {
  final List<Student> students;

  FineSearchDelegate({required this.students});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.scaffoldBackgroundColor, // Match with screen's UI theme
        iconTheme: IconThemeData(color: theme.primaryColor), // Match with screen's UI theme
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [

      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Pass an empty string as a result to indicate closing the search screen
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final List<Student> filteredStudents = students.where((student) {
      final String lowercaseQuery = query.toLowerCase();
      return student.name.toLowerCase().contains(lowercaseQuery) ||
          student.rollNo.toLowerCase().contains(lowercaseQuery);
    }).toList();
    return ListView.builder(
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredStudents[index].name),
          subtitle: Text(filteredStudents[index].rollNo),
          onTap: () {
            close(context, filteredStudents[index].rollNo);
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Managefines(),
  ));
}
