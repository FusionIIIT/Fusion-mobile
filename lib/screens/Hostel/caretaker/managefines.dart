import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Managefines extends StatelessWidget {
  const Managefines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Manage Fines'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // Add padding to the body
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 245, 103, 47), // Set the card color
              child: ListTile(
                title: Text(
                  students[index].name,
                  style: TextStyle(color: Colors.white), // Set the text color to white
                ),
                subtitle: Text(
                  'Fine Amount: \$${students[index].fineAmount}',
                  style: TextStyle(color: Colors.white), // Set the text color to white
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.navigate_next),
                  color: Colors.white, // Set the icon color to white
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FineDetails(student: students[index]),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement create new fines functionality
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
      ),
    );
  }
}

class FineDetails extends StatelessWidget {
  final Student student;

  const FineDetails({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine Details - ${student.name}'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Fine Amount: \$${student.fineAmount}',
          style: TextStyle(color: Colors.black), // Set the text color to black
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final double fineAmount;

  const Student({
    required this.name,
    required this.fineAmount,
  });
}

final List<Student> students = [
  const Student(name: 'John Doe', fineAmount: 50.0),
  const Student(name: 'Jane Smith', fineAmount: 30.0),
  const Student(name: 'Alex Johnson', fineAmount: 20.0),
];
