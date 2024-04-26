import 'package:flutter/material.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class ViewStudentBill extends StatefulWidget {
  @override
  _ViewStudentBillState createState() => _ViewStudentBillState();
}

class _ViewStudentBillState extends State<ViewStudentBill> {
  CentralMessService _centralMessService = CentralMessService();

  static List<dynamic> _monthlyBillData = [] ,_paymentData = [];
  bool _loading = false, _gotData = true, _dialogLoad = false, _search = false;
  late String name;
  String? selectedMess, selectedProgramme, selectedStatus, selectedBatch,reqStudentId;
  List<Map<String, dynamic>> billData = [],
      paymentData = [],
      regRecord = [],
      tableData = [],
      studentData = [];
  RegMain userMessData = RegMain(
      program: "NA",
      currentMessStatus: 'Deregistered',
      balance: 0,
      messOption: "no_mess");
  late int currentYear;
  late List<String> yearsList;
  Map<String, dynamic> allRecordsData = {};

  @override
  void initState() {
    super.initState();
    // getData(); // set initial data
    currentYear = DateTime
        .now()
        .year;
    yearsList = List.generate(6, (index) => (currentYear - index).toString());
  }

  void _setMonthlyBillData(studentId) async{
    setState(() {
      _dialogLoad = true;
    });

    try{
      Map<String, dynamic> data = await _centralMessService.getAllDetails(studentId);

      setState(() {
        allRecordsData = data;
      });
      _monthlyBillData = allRecordsData["bill"];
      billData = _monthlyBillData
          .map((bill) =>
      {
        "Month": bill.month.toString(),
        "Year": bill.year.toString(),
        "Amount": bill.amount.toString(),
        "Rebate Count": bill.rebateCount.toString(),
        "Rebate Amount": bill.rebateAmount.toString(),
        "Total Amount": bill.totalBill.toString(),
      }).toList();

      billData.sort((a, b) {
        int yearComparison = b['Year']!.compareTo(a['Year']!);
        if (yearComparison != 0) {
          return yearComparison;
        }
        List<String> monthNames = [
          'December', 'November', 'October', 'September','August', 'July', 'June', 'May', 'April', 'March','February','January'
        ];
        int aMonth = monthNames.indexOf(a['Month']!) + 1;
        int bMonth = monthNames.indexOf(b['Month']!) + 1;
        return aMonth.compareTo(bMonth);
      });
      setState(() {
        _dialogLoad = false;
      });

    }catch(e){
      print(e);
      setState(() {
        _dialogLoad = false;
      });
    }
    _showDialog('View Bills',
        billData);
  }

  void _setPaymentData(studentId) async {
    setState(() {
      _dialogLoad = true;
    });

    try{
      Map<String, dynamic> data = await _centralMessService.getAllDetails(studentId);

      setState(() {
        allRecordsData = data;
      });
      _paymentData = allRecordsData["payment"];
      paymentData = _paymentData
          .map((item) =>
      {
        "Date": item.paymentDate.toString().substring(0, 10),
        "Month": item.paymentMonth,
        "Year": item.paymentYear.toString(),
        "Amount paid": item.amountPaid.toString(),
      }).toList();

      paymentData.sort((a, b) {
        DateTime dateA = DateTime.parse(a['Date']!);
        DateTime dateB = DateTime.parse(b['Date']!);
        return dateB.compareTo(dateA);
      });
      setState(() {
        _dialogLoad = false;
      });

    }catch(e){
      print(e);
      setState(() {
        _dialogLoad = false;
      });
    }
    _showDialog('View Payments',
        paymentData);
  }

  getData(String type) async {
    setState(() {
      _loading = true;
      _gotData = true;
      if(type=="search")_search = true;
    });
    try {
      Map<String, String> data = {
        'type': type,
        'mess_option': selectedMess ?? 'all',
        'program': selectedProgramme ?? 'all',
        'status': selectedStatus ?? 'all',
        'student_id': reqStudentId??'',
      };
      List<RegMain> regMainList = await _centralMessService.getRegMain(data);
      // regMainList.forEach((ele)=>{print(ele.toMap())});
      if (selectedBatch != null) {
        regMainList = regMainList.where((ele) =>
        ele.studentId.toString().substring(0, 2) == selectedBatch
        ).toList();
      }
      setState(() {
        int count = 0;
        tableData = regMainList.map((regMain) {
          count++;
          return {
            'S.No.' :  count.toString(),
            'Student Id': regMain.studentId,
            'Name': regMain.firstName! + " " + regMain.lastName!,
            'Program': regMain.program,
            'Balance': regMain.balance.toString(),
            'Mess': regMain.messOption,
            'View bills': '',
            'View payments':'',
          };
        }).toList();
        _loading= false;
        _gotData = false;
        _search = false;
      });
    } catch (e) {
      setState(() {
        _loading= false;
        _gotData = false;
        _search = false;
      });
      _showSnackBar("Error: $e", Colors.red);
      print(e);
    }
    setState(() {
      // _loading= false;
      // _gotData = true;
    });
  }
  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: backgroundColor, // Set background color to red for failure
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
    {"text": "PHD", "value": "Phd"},
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
    return Stack(
      children: [
        SingleChildScrollView(
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
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
                                dropdownColor: Colors.white,
                                value: selectedProgramme,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedProgramme = newValue;
                                  });
                                  getData("filter");
                                },
                                items: programmeDropDownItems.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item["text"]!),
                                    value: item["value"],
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
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
                                dropdownColor: Colors.white,
                                value: selectedBatch,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedBatch = newValue;
                                  });
                                  getData("filter");
                                },
                                items: yearsList.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item.toString().substring(2),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
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
                                dropdownColor: Colors.white,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                  });
                                  getData("filter");
                                },
                                items: statusDropDownItems.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item["text"]!),
                                    value: item["value"],
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
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
                                dropdownColor: Colors.white,
                                value: selectedMess,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMess = newValue;
                                  });
                                  getData("filter");
                                },
                                items: messDropDownItems.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item["text"]!),
                                    value: item["value"],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                maxLines: 1,
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                  labelText: 'Search StudentId',
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
                                    return "Search studentId";
                                  } else {
                                    reqStudentId = value.toUpperCase();
                                    return null;
                                  }
                                },
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            ElevatedButton(
                              style: style,
                              onPressed: _loading ? null : () {
                                if (_messFormKey.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  getData("search");
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text("Search"),
                                  if (_search) CircularProgressIndicator(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
              _gotData && _loading
                  ? CircularProgressIndicator(): _gotData ? SizedBox(height: 10.0,) : Container(
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
        ),
        if (_dialogLoad)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }



  List<DataColumn> buildTableHeader(List<Map<String, dynamic>> tableData) {
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

  List<DataRow> buildTableRows(List<Map<String, dynamic>> tableData) {
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
                        _setMonthlyBillData(data['Student Id']!);
                        // _showDialog('View Bills',
                        //     billData);
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
                        // _showDialog('View Payments',
                        //     paymentData);
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

  void _showDialog(String title, List<Map<String, dynamic>> data) {
    if(!_dialogLoad){
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
  }

  List<DataRow> buildDialogTableRow(List<Map<String, dynamic>> dataList) {
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