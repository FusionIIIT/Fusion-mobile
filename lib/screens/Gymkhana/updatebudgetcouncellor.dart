import 'package:flutter/material.dart';
import 'package:fusion/services/viewbudgetdean.dart';
import 'package:fusion/services/updatebudget.dart';
import 'package:fusion/services/deletebudget.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class UpdateBudgetCouncellorPage extends StatefulWidget {
  @override
  _UpdateBudgetCouncellorPageState createState() =>
      _UpdateBudgetCouncellorPageState();
}

class _UpdateBudgetCouncellorPageState
    extends State<UpdateBudgetCouncellorPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<BudgetDetail> updateBudgetCouncellorPage = [];

  @override
  void initState() {
    super.initState();
    fetchUpdateBudgetCouncellorPage();
  }

  Future<void> fetchUpdateBudgetCouncellorPage() async {
    try {
      ViewBudgetDean viewBudgetDean = ViewBudgetDean();
      List<Map<String, dynamic>> jsonData = await viewBudgetDean.viewBudget();

      print('Fetched data: $jsonData'); // Add this line to print fetched data

      setState(() {
        updateBudgetCouncellorPage = jsonData
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

  Future<void> confirmBudget(int id) async {
    try {
      UpdateBudget updateBudget = UpdateBudget();
      await updateBudget.updateBudget(
        club: updateBudgetCouncellorPage
            .firstWhere((budgetDetail) => budgetDetail.id == id)
            .club,
        budgetFor: updateBudgetCouncellorPage
            .firstWhere((budgetDetail) => budgetDetail.id == id)
            .budgetFor,
        budgetAmt: updateBudgetCouncellorPage
            .firstWhere((budgetDetail) => budgetDetail.id == id)
            .budgetAmount,
        status: 'confirmed',
        id: id,
      );
      // Refresh the list after confirmation
      fetchUpdateBudgetCouncellorPage();
    } catch (e) {
      print('Error confirming budget: $e');
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
        club: updateBudgetCouncellorPage
            .firstWhere((budgetDetail) => budgetDetail.id == id)
            .club,
        budgetFor: updateBudgetCouncellorPage
            .firstWhere((budgetDetail) => budgetDetail.id == id)
            .budgetFor,
        budgetAmt: newBudgetAmount,
        status: 'open',
        id: id,
      );
      // Refresh the list after updating
      fetchUpdateBudgetCouncellorPage();
    } catch (e) {
      print('Error updating budget: $e');
    }
  }

  Future<void> deleteBudget(int id) async {
    try {
      DeleteBudgetService deleteService = DeleteBudgetService();
      await deleteService.deleteBudget(id);
      // Refresh the list after deleting
      fetchUpdateBudgetCouncellorPage();
    } catch (e) {
      print('Error deleting budget: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: 'Update Budget', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Vertical scrolling
          child: Center(
            child: updateBudgetCouncellorPage.isEmpty
                ? Text('No requests found')
                : DataTable(
                    columnSpacing: 35,
                    columns: <DataColumn>[
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
                    rows: updateBudgetCouncellorPage
                        .map(
                          (budgetDetail) => DataRow(
                            cells: <DataCell>[
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
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Confirm button action
                                        confirmBudget(budgetDetail.id);
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
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
                                    SizedBox(width: 10.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Delete button action
                                        deleteBudget(budgetDetail.id);
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.deepOrangeAccent),
                    headingRowHeight: 50,
                    dataRowHeight: 50,
                    dividerThickness: 1,
                  ),
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
    home: UpdateBudgetCouncellorPage(),
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.deepOrangeAccent,
    ),
  ));
}
