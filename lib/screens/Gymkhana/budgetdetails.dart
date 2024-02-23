import 'package:flutter/material.dart';
import 'package:fusion/services/viewbudgetdean.dart';

class BudgetDetails extends StatefulWidget {
  @override
  _BudgetDetailsState createState() => _BudgetDetailsState();
}

class _BudgetDetailsState extends State<BudgetDetails> {
  List<BudgetDetail> budgetDetails = [];

  @override
  void initState() {
    super.initState();
    fetchBudgetDetails();
  }

  Future<void> fetchBudgetDetails() async {
    try {
      ViewBudgetDean viewBudgetDean = ViewBudgetDean();
      List<Map<String, dynamic>> jsonData = await viewBudgetDean.viewBudget();

      print('Fetched data: $jsonData'); // Add this line to print fetched data

      setState(() {
        budgetDetails = jsonData
            .where((budgetDetail) =>
                budgetDetail['status'].toLowerCase() == 'confirmed')
            .map((budgetDetail) => BudgetDetail(
                  status: budgetDetail['status'],
                  club: budgetDetail['club'],
                  budgetFor: budgetDetail['budget_for'],
                  budgetAmount: budgetDetail['budget_amt'],
                  budgetFile: budgetDetail['budget_file'],
                ))
            .toList();
      });
    } catch (e) {
      print('Error fetching budget details: $e');
      // Handle error, show message to the user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Details',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 35,
          columns: <DataColumn>[
            DataColumn(
              label: Text("Status"),
              numeric: false,
              onSort: (i, b) {},
            ),
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
          ],
          rows: budgetDetails
              .map(
                (budgetDetail) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        budgetDetail.status,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
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
                  ],
                ),
              )
              .toList(),
          dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.deepOrangeAccent),
          headingRowHeight: 50,
          dataRowHeight: 50,
          dividerThickness: 1,
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

  BudgetDetail({
    required this.status,
    required this.club,
    required this.budgetFor,
    required this.budgetAmount,
    required this.budgetFile,
  });
}
