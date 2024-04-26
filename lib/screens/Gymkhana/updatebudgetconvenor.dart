import 'package:flutter/material.dart';
import 'package:fusion/services/viewbudgetdean.dart';
import 'package:fusion/services/updatebudget.dart'; // Import the correct path to UpdateBudget class

class UpdateBudgetConvenerPage extends StatefulWidget {
  @override
  _UpdateBudgetConvenerPageState createState() =>
      _UpdateBudgetConvenerPageState();
}

class _UpdateBudgetConvenerPageState extends State<UpdateBudgetConvenerPage> {
  List<BudgetDetail> UpdateBudgetConvenerPage = [];

  @override
  void initState() {
    super.initState();
    fetchUpdateBudgetConvenerPage();
  }

  Future<void> fetchUpdateBudgetConvenerPage() async {
    try {
      ViewBudgetDean viewBudgetDean = ViewBudgetDean();
      List<Map<String, dynamic>> jsonData = await viewBudgetDean.viewBudget();

      print('Fetched data: $jsonData'); // Add this line to print fetched data

      setState(() {
        UpdateBudgetConvenerPage = jsonData
            .where((budgetDetail) =>
                budgetDetail['status'].toLowerCase() == 'open')
            .map((budgetDetail) => BudgetDetail(
                  status: budgetDetail['status'],
                  club: budgetDetail['club'],
                  budgetFor: budgetDetail['budget_for'],
                  budgetAmount: budgetDetail['budget_amt'],
                  budgetFile: budgetDetail['budget_file'],
                  id: budgetDetail['id'],
                ))
            .toList();
      });
    } catch (e) {
      print('Error fetching budget details: $e');
      // Handle error, show message to the user, etc.
    }
  }

  Future<void> updateBudget(int id) async {
    TextEditingController budgetController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Budget Amount"),
          content: TextFormField(
            controller: budgetController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter New Budget Amount"),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                int newBudgetAmount = int.tryParse(budgetController.text) ?? 0;
                await updateBudgetDetails(id, newBudgetAmount);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateBudgetDetails(int id, int newBudgetAmount) async {
    try {
      UpdateBudget updateBudget = UpdateBudget();
      await updateBudget.updateBudget(
        club: UpdateBudgetConvenerPage.firstWhere(
            (budgetDetail) => budgetDetail.id == id).club,
        budgetFor: UpdateBudgetConvenerPage.firstWhere(
            (budgetDetail) => budgetDetail.id == id).budgetFor,
        budgetAmt: newBudgetAmount,
        status: 'open',
        id: id,
      );
      // Refresh the list after updating
      fetchUpdateBudgetConvenerPage();
    } catch (e) {
      print('Error updating budget: $e');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Budget',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Vertical scrolling
          child: DataTable(
            columnSpacing: 35,
            columns: <DataColumn>[
              // DataColumn(
              //   label: Text("Status"),
              //   numeric: false,
              //   onSort: (i, b) {},
              // ),
              DataColumn(
                label: Text("Club"),
                numeric: false,
                onSort: (i, b) {},
              ),
              DataColumn(
                label: Text("Budget For"),
                numeric: false,
                onSort: (i, b) {},
              ),
              DataColumn(
                label: Text("Budget Amount"),
                numeric: false,
                onSort: (i, b) {},
              ),
              DataColumn(
                label: Text("Budget File"),
                numeric: false,
                onSort: (i, b) {},
              ),
              DataColumn(
                label: Text("Actions"),
                numeric: false,
                onSort: (i, b) {},
              ),
            ],
            rows: UpdateBudgetConvenerPage.map(
              (budgetDetail) => DataRow(
                cells: <DataCell>[
                  // DataCell(
                  //   Text(
                  //     budgetDetail.status,
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  DataCell(
                    Text(
                      budgetDetail.club,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(
                      budgetDetail.budgetFor,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(
                      budgetDetail.budgetAmount.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(
                      budgetDetail.budgetFile,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    ElevatedButton(
                      onPressed: () {
                        // Update button action
                        // You can open a dialog or navigate to another screen to get the new budget amount
                        // For demonstration, I'm providing a dummy value (5000) here
                        updateBudget(budgetDetail.id);
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ).toList(),
            dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.deepOrangeAccent),
            headingRowHeight: 50,
            dataRowHeight: 50,
            dividerThickness: 1,
          ),
        ),
      ),
    );
  }
}

class BudgetDetail {
  late String status;
  late String club;
  late String budgetFor;
  late int budgetAmount;
  late String budgetFile;
  late int id;

  BudgetDetail({
    required this.status,
    required this.club,
    required this.budgetFor,
    required this.budgetAmount,
    required this.budgetFile,
    required this.id,
  });
}

void main() {
  runApp(MaterialApp(
    home: UpdateBudgetConvenerPage(),
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.deepOrangeAccent,
    ),
  ));
}
