import 'package:flutter/material.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class ViewStudentBill extends StatefulWidget {
  @override
  _ViewStudentBillState createState() => _ViewStudentBillState();
}

class _ViewStudentBillState extends State<ViewStudentBill> {
  CentralMessService _centralMessService = CentralMessService();

  static List<MonthlyBill> _monthlyBillData = [];
  static List<Payment> _paymentData = [];
  bool _loading = false, _gotData = false;
  late String name;
  String? selectedMess, selectedProgramme, selectedStatus, selectedBatch;
  late String reqStudentId;
  List<Map<String, String?>> billData = [], paymentData = [], tableData = [];
  RegMain userMessData = RegMain(
      program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess");
  late int currentYear;
  late List<String> yearsList;

  @override
  void initState() {
    super.initState();
    _fetchMonthlyBillData();
    _fetchPaymentData();
    getData(); // Fetch initial data
    currentYear = DateTime.now().year;
    yearsList = List.generate(5, (index) => (currentYear - index).toString());
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
  void setMonthlyBillData(studentId){
    billData = _monthlyBillData
        .where((bill) => bill.studentId.toLowerCase() == studentId.toLowerCase())
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
  void _fetchPaymentData() async {
    try {
      List<Payment> payments = await _centralMessService.getPayments();
      setState(() {
        _paymentData = payments;
      });
      // payments.forEach((ele){
      //   print(ele.toMap());
      // });
      print('Received the payments');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching payments: $e');
    }
  }
  void _setPaymentData(studentId){
    paymentData = _paymentData
        .where((item) => item.studentId.toLowerCase() == studentId.toLowerCase())
        .map((item) => {
      'Student Id': item.studentId,
      'Date': item.paymentDate.toString().substring(0,10),
      'Month': item.paymentMonth,
      'Year': item.paymentYear.toString(),
      'Amount paid': item.amountPaid.toString(),
    }).toList();


    paymentData.sort((a, b) {
      DateTime dateA = DateTime.parse(a['Date']!);
      DateTime dateB = DateTime.parse(b['Date']!);
      return dateB.compareTo(dateA);
    });
  }

  getData() async {
    setState(() {
      _gotData = false;
      _loading = true;
    });
    try {
      Map<String, String> data = {
        'type': 'filter',
        'mess_option': selectedMess ?? 'all',
        'program': selectedProgramme ?? 'all',
        'status': selectedStatus ?? 'all',
      };
      List<RegMain> regMainList = await _centralMessService.getRegMain(data);
      if(selectedBatch!=null){
        regMainList = regMainList.where((ele)=>
          ele.studentId.toString().substring(0,2) == selectedBatch
        ).toList();
      }
      setState(() {
        // data = DashboardData.fromJson(jsonDecode(response.body));
        tableData = regMainList.map((regMain) {
          return {
            'Student Id': regMain.studentId,
            'Program': regMain.program,
            'Balance': regMain.balance.toString(),
            'Mess': regMain.messOption,
            'View bills': '',
            'View payments': '',
          };
        }).toList();
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _gotData = true;
      _loading = false;
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
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

  List<Map<String, String>> messDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
    {"text": "All", "value": "all"},
  ];
  List<Map<String, String>> programmeDropDownItems = [
    {"text": "B.Tech", "value": "B.Tech"},
    {"text": "M.Tech", "value": "M.Tech"},
    {"text": "PHD", "value": "PHD"},
    {"text": "B.Des", "value": "B.Des"},
    {"text": "All", "value": "all"},
  ];
  List<Map<String, String>> statusDropDownItems = [
    {"text": "Registered", "value": "Registered"},
    {"text": "Deregistered", "value": "Deregistered"},
    {"text": "All", "value": "all"},
  ];

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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select programme',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      // validator: (value) =>
                      // value == null ? "Select a programme" : null,
                      dropdownColor: Colors.white,
                      value: selectedProgramme,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProgramme = newValue;
                        });
                        getData(); // Call getData whenever dropdown value changes
                      },
                      items: programmeDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select batch',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      // validator: (value) =>
                      // value == null ? "Select a programme" : null,
                      dropdownColor: Colors.white,
                      value: selectedBatch,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBatch = newValue;
                        });
                        getData(); // Call getData whenever dropdown value changes
                      },
                      items: yearsList.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item.toString().substring(2),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select status',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      // validator: (value) =>
                      // value == null ? "Select status" : null,
                      dropdownColor: Colors.white,
                      value: selectedStatus,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStatus = newValue;
                        });
                        getData(); // Call getData whenever dropdown value changes
                      },
                      items: statusDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Mess',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      // validator: (value) =>
                      // value == null ? "Select a mess" : null,
                      dropdownColor: Colors.white,
                      value: selectedMess,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMess = newValue;
                        });
                        getData(); // Call getData whenever dropdown value changes
                      },
                      items: messDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    // ElevatedButton(
                    //     style: style,
                    //     onPressed: _loading ? null : () {
                    //       if (_messFormKey.currentState!.validate()) {
                    //         setState(() {
                    //           _loading = true;
                    //         });
                    //       }
                    //     },
                    //     child: Text("Filter"))
                  ],
                ),
              ),
            ),
          ),
          !_gotData && _loading
              ? CircularProgressIndicator(): Container(
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
                columns: buildTableHeader(tableData),
                rows: buildTableRows(tableData),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DataColumn> buildTableHeader(List<Map<String, String?>> tableData) {
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

  List<DataRow> buildTableRows(List<Map<String, String?>> tableData) {
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
                        setMonthlyBillData(data['Student Id']!);
                        _showDialog('View Bills',
                            billData);
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
                        print(data['Student Id']!);
                        _setPaymentData(data['Student Id']!);
                        _showDialog('View Payments',
                            paymentData);
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

  void _showDialog(String title, List<Map<String, String?>> data) {
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
                      columnSpacing: 12,
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

  List<DataRow> buildDialogTableRow(List<Map<String, String?>> dataList) {
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