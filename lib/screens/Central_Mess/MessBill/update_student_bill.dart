import 'package:flutter/material.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class UpdateStudentBill extends StatefulWidget {
  @override
  _UpdateStudentBillState createState() => _UpdateStudentBillState();
}

class _UpdateStudentBillState extends State<UpdateStudentBill> {
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
  bool _loading = false, _Update = false;
  late String reqStudentId;
  List<Map<String, String>> billData = [], paymentData = [];
  // tableData = [];

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

  List<Map<String, String>> tableData = [
    {
      'Name': 'Chandrashekhar',
      'Roll No': '21bcs064',
      'Program': 'B.Tech',
      'Balance': '0',
      'Mess': 'mess2',
      'View bills': '',
      'View payments': '',
    },
    {
      'Name': 'Adil',
      'Roll No': '21bcs133',
      'Program': 'B.Tech',
      'Balance': '0',
      'Mess': 'mess2',
      'View bills': '',
      'View payments': '',
    },
  ];
  // List<Map<String, String>> paymentData = [
  //   {
  //   'Month': 'March',
  //   'Year': '2024',
  //   'Amount Paid': '12000',
  //   },
  // ];
  void setMonthlyBillData(){
    billData = _monthlyBillData
        .where((bill) => bill.studentId.toLowerCase() == reqStudentId) // Use reqStudentId here
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
  }

  @override
  Widget build(BuildContext context) {
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        labelText: 'Enter a StudentId',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a studentId";
                        } else {
                          reqStudentId = value.toLowerCase();
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        if (_messFormKey.currentState!.validate()) {
                          setState(() {
                            _loading = true;
                          });
                        }
                      },
                      child: Text("Update"),
                    )
                  ],
                ),
              ),
            ),
          ),
          _loading
              ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12,
                horizontalMargin: 8,
                columns: buildTableHeader(tableData),
                rows: buildTableRows(tableData),
              ),
            ),
          )
              : SizedBox(height: 10.0),
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
            if (key.toLowerCase() == 'view bills') {
              return DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // _showDialog('View Bills', data); // use this data to fetch information
                        setMonthlyBillData();
                        _showDialog('View Bills',
                            billData); // use this data to fetch information
                      },
                      child: Text('View bills'),
                    ),
                  ],
                ),
              );
            } else if (key.toLowerCase() == "view payments") {
              return DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showDialog('View Payments',
                            paymentData); // use data to fetch information
                        // _showDialog('View Payments', data); // use data to fetch information
                      },
                      child: Text('View Payments'),
                    ),
                  ],
                ),
              );
            } else {
              return DataCell(
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(data[key]!),
                ),
              );
            }
          }).toList(),
        );
      }).toList();
    }else{
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

  void _showDialog(String title, List<Map<String, String>> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      columnSpacing: 14,
                      horizontalMargin: 8,
                      columns: title == "View Payments" ? buildTableHeader(paymentData) : buildTableHeader(billData),
                      rows: title == "View Payments" ? buildDialogTableRow(paymentData) : buildDialogTableRow(billData),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataRow> buildDialogTableRow(List<Map<String, String>> dataList) {
    return dataList.map((data) {
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
  }

}
