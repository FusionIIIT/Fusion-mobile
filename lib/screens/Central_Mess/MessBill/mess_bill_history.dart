import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';

class MessMonthlyBillHistory extends StatefulWidget {
  final ProfileData profileData;
  MessMonthlyBillHistory({required this.profileData});
  @override
  _MessMonthlyBillHistoryState createState() => _MessMonthlyBillHistoryState();
}

class _MessMonthlyBillHistoryState extends State<MessMonthlyBillHistory> {
  CentralMessService _centralMessService = CentralMessService();

  static List<MonthlyBill> _monthlyBillData = [];

  @override
  void initState() {
    super.initState();
    _fetchMonthlyBillData();
  }

  void _fetchMonthlyBillData() async {
    try {
      List<MonthlyBill> monthlyBill = await _centralMessService.getMonthlyBill();
      setState(() {
        _monthlyBillData = monthlyBill;
      });
      print('Received the bill');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching bill: $e');
    }
  }
  bool _loading = true;
  late String reqStudentId; // Declare reqStudentId here

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reqStudentId = widget.profileData.user!['username']!;
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> billData = _monthlyBillData
        .where((bill) => bill.studentId.toLowerCase() == reqStudentId.toLowerCase()) // Use reqStudentId here
        .map((bill) => {
      'Month': bill.month.toString(),
      'Year': bill.year.toString(),
      'Amount': bill.amount.toString(),
      'Rebate Count': bill.rebateCount.toString(),
      'Rebate Amount': bill.rebateAmount.toString(),
      'Total Amount': bill.totalBill.toString(),
    }).toList();

    billData.sort((a, b) {
      int yearComparison = b['Year']!.compareTo(a['Year']!);
      if (yearComparison != 0) {
        return yearComparison;
      }
      List<String> monthNames = [
        'December', 'November', 'October', 'September', 'August', 'July', 'June', 'May', 'April', 'March', 'February', 'January'
      ];
      int aMonth = monthNames.indexOf(a['Month']!) + 1;
      int bMonth = monthNames.indexOf(b['Month']!) + 1;
      return aMonth.compareTo(bMonth);
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.0,),
          _loading
              ? CircularProgressIndicator() :
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "+ve Amount: ₹" + (_monthlyBillData.isNotEmpty ? _monthlyBillData.last.totalBill.toString() : "0"),
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2.0,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 14,
                        horizontalMargin: 8,
                        columns: buildTableHeader(billData),
                        rows: buildTableRows(billData),
                      ),
                    ),
                  )
                ],
              )
        ],
      ),
    );
  }

  List<DataColumn> buildTableHeader(List<Map<String, String>> tableData) {
    if (tableData.isNotEmpty) {
      return tableData.first.keys.map((key) {
        return DataColumn(
          label: Text(
            key,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }).toList();
    } else {
      // Return a default DataColumn if tableData is empty
      return [
        DataColumn(
          label: Text(
            'No Records Found!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
  }

  List<DataRow> buildTableRows(List<Map<String, String>> tableData) {
    if (tableData.isNotEmpty) {
      return tableData.map((data) {
        return DataRow(
          cells: data.keys.map((key) {
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(data[key]!),
              ),
            );
          }).toList(),
        );
      }).toList();
    } else {
      // Return a single DataRow with a message if tableData is empty
      return [
        DataRow(
          cells: [
            DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text("No records found!!!"),
              ),
            ),
          ],
        ),
      ];
    }
  }
}
