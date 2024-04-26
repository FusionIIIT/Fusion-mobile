import 'package:flutter/material.dart';
import 'package:fusion/services/viewbudgetdean.dart';
import 'package:fusion/services/viewclubdetails.dart';

class BudgetDetails extends StatefulWidget {
  @override
  _BudgetDetailsState createState() => _BudgetDetailsState();
}

class _BudgetDetailsState extends State<BudgetDetails> {
  List<BudgetDetail> budgetDetails = [];
  List<String> clubs = [];
  String? selectedClub;

  @override
  void initState() {
    super.initState();
    fetchClubDetails();
  }

  
  Future<void> fetchClubDetails() async {
  try {
    ViewClubDetails viewClubDetails = ViewClubDetails();
    List<dynamic> jsonData = await viewClubDetails.getClubDetails();

    // Filter club details with status 'confirmed' or handle null status
    List<dynamic> filteredData = jsonData.where((club) => club['status'] == 'confirmed' || club['status'] == null).toList();

    setState(() {
      clubs = filteredData
          .map<String>((club) => club['club_name'].toString())
          .toList();
      selectedClub = clubs.isNotEmpty ? clubs.first : null;
    });

    if (selectedClub != null) {
      fetchBudgetDetails(selectedClub!);
    }
  } catch (e) {
    print('Error fetching club details: $e');
  }
}


  Future<void> fetchBudgetDetails(String clubName) async {
    try {
      ViewBudgetDean viewBudgetDean = ViewBudgetDean();
      List<Map<String, dynamic>> jsonData = await viewBudgetDean.viewBudget();

      setState(() {
        budgetDetails = jsonData
            .where((budgetDetail) =>
                budgetDetail['status'].toLowerCase() == 'confirmed' &&
                budgetDetail['club'] == clubName)
            .map((budgetDetail) => BudgetDetail(
              club: budgetDetail['club'],
              budgetFor: budgetDetail['budget_for'],
              budgetAmount: budgetDetail['budget_amt'],
              budgetFile: budgetDetail['budget_file'],
              description: budgetDetail['description'],
            ))
            .toList();
      });
    } catch (e) {
      print('Error fetching budget details: $e');
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedClub,
                onChanged: (newValue) {
                  setState(() {
                    selectedClub = newValue!;
                    fetchBudgetDetails(selectedClub!);
                  });
                },
                items: clubs.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Club',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
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
                    label: Text("Description"),
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
                        Text(
                          budgetDetail.description,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
                    .toList(),
                dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
                headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.deepOrangeAccent),
                headingRowHeight: 50,
                dataRowHeight: 50,
                dividerThickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetDetail {
  late String club;
  late String budgetFor;
  late int budgetAmount;
  late String budgetFile;
  late String description;

  BudgetDetail({
    required this.club,
    required this.budgetFor,
    required this.budgetAmount,
    required this.budgetFile,
    required this.description,
  });
}
