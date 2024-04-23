
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Inventory extends StatelessWidget {
  const Inventory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47), // Set the background color to orange
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            Text(
              'Inventory Amount: \$1000', // Replace with actual inventory amount
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 103, 47)),
            ),
            SizedBox(height: 16),
            Text(
              'Expense History:', // Replace with actual expense history
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Expense 1'), // Replace with actual expense details
                  ),
                  ListTile(
                    title: Text('Expense 2'), // Replace with actual expense details
                  ),
                  // Add more ListTiles for additional expenses
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to create a new expense
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 245, 103, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Color.fromARGB(255, 245, 103, 47),
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Create New Expense',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}