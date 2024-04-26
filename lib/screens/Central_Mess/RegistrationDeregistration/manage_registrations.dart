import 'package:flutter/material.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class ManageRegistrations extends StatefulWidget {
  @override
  _ManageRegistrationsState createState() => _ManageRegistrationsState();
}

class _ManageRegistrationsState extends State<ManageRegistrations> {
  CentralMessService _centralMessService = CentralMessService();

  static List<dynamic> _monthlyBillData = [] ,_paymentData = [],_regRecordsData = [], _studentDetailsData=[];
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

  void _fetchStudentDetails(String studentId) async {
    setState(() {
      _dialogLoad = true;
    });

    try {
      Map<String, dynamic> data = await _centralMessService.getAllDetails(studentId);

      setState(() {
        allRecordsData = data;
      });

      _setPaymentData(studentId);
      _setMonthlyBillData(studentId);
      _setRecordData(studentId);
      _setStudentData(studentId);
    } catch (e) {
      print("Error fetching data: $e");
    }

    // await Future.delayed(Duration(seconds: 5));
    setState(() {
      _dialogLoad = false;
    });
    _showDialog();
  }

  void _setMonthlyBillData(studentId) {
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
  }

  void _setPaymentData(studentId) {

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
  }

  void _setRecordData(studentId) {
    _regRecordsData = allRecordsData["reg_records"];
    regRecord = _regRecordsData
        .map((item) =>
    {
      "Student Id": item.studentId.toString(),
      "Start Date(dd-mm-yyyy)": item.startDate.toString().substring(0,10),
      // "End Date(dd-mm-yyyy)": item.endDate.toString().length == 0 ? '-' : item.endDate.toString().substring(0,10),
      "End Date(dd-mm-yyyy)": item.endDate.toString(),
    }).toList();
  }

  void _setStudentData(studentId) {
    _studentDetailsData = allRecordsData["student_details"];
    studentData =_studentDetailsData.map((item) =>
    {

      "Student Id": item.studentId.toString(),
      "Name": item.firstName.toString(),
      "Program": item.program.toString(),
      "Mess": item.messOption.toString(),
      "Mess Status": item.currentMessStatus.toString(),
      "Amount paid": item.balance.toString().toString(),
    }).toList();
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
            'View Details': '',
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
            if (key.toLowerCase() == 'view details') {
              return DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _fetchStudentDetails(data['Student Id']!);
                      },
                      child: Text('View Details'),
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
    } else {
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

  List<DataColumn> buildTableStudentHeader(Map<String, dynamic> tableData) {
    if (tableData.isNotEmpty) {
      return tableData.keys.map((key) {
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

  List<DataRow> buildTableStudentRows(Map<String, dynamic> tableData) {
    if (tableData.isNotEmpty) {
      return [
        DataRow(
          cells: tableData.keys.map((key) {
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(tableData[key].toString()),
              ),
            );
          }).toList(),
        ),
      ];
    } else {
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

  void _showDialog() {
    if (!_dialogLoad) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            // Dialog content
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            insetPadding: EdgeInsets.zero,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Student Details',
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
                      columns: buildTableHeader(studentData),
                      rows: buildTableRows(studentData),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Payment Details',
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
                      columns: buildTableHeader(paymentData),
                      rows: buildTableRows(paymentData),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bill Details',
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
                      columns: buildTableHeader(billData),
                      rows: buildTableRows(billData),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Registration Records',
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
                      columns: buildTableHeader(regRecord),
                      rows: buildTableRows(regRecord),
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
          );
        },
      );
    }
  }
}
