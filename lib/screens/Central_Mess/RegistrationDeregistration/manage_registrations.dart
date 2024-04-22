import 'package:flutter/material.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class ManageRegistrations extends StatefulWidget {
  @override
  _ManageRegistrationsState createState() => _ManageRegistrationsState();
}

class _ManageRegistrationsState extends State<ManageRegistrations> {
  CentralMessService _centralMessService = CentralMessService();

  static List<MonthlyBill> _monthlyBillData = [];
  static List<Payment> _paymentData = [];
  bool _loading = false,
      _gotData = false;
  late String name;
  String? selectedMess, selectedProgramme, selectedStatus, selectedBatch;
  List<Map<String, dynamic>> billData = [],
      paymentData = [],
      regRecord = [],
      tableData = [];
  Map<String, dynamic>studentData = {};
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
    getData(); // set initial data
    currentYear = DateTime
        .now()
        .year;
    yearsList = List.generate(5, (index) => (currentYear - index).toString());
  }

  void _fetchStudentDetails(String studentId) async {
    try {
      Map<String, dynamic> data = await _centralMessService.getAllDetails(
          studentId);
      print(data);
      setState(() {
        allRecordsData = data;
      });
      _setMonthlyBillData(studentId);
      _setPaymentData(studentId);
      _setRecordData(studentId);
      _setStudentData(studentId);
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  void _setMonthlyBillData(studentId) {
    billData = allRecordsData['bill']
        .map((bill) =>
    {
      'Month': bill["month"].toString(),
      'Year': bill["year"].toString(),
      'Amount': bill["amount"].toString(),
      'Rebate Count': bill["rebate_count"].toString(),
      'Rebate Amount': bill["rebate_amount"].toString(),
      'Total Amount': bill["total_bill"].toString(),
    }).toList();

    billData.sort((a, b) {
      int yearComparison = b['Year']!.compareTo(a['Year']!);
      if (yearComparison != 0) {
        return yearComparison;
      }
      List<String> monthNames = [
        'December',
        'November',
        'October',
        'September',
        'August',
        'July',
        'June',
        'May',
        'April',
        'March',
        'February',
        'January'
      ];
      int aMonth = monthNames.indexOf(a['Month']!) + 1;
      int bMonth = monthNames.indexOf(b['Month']!) + 1;
      return aMonth.compareTo(bMonth);
    });
  }

  void _setPaymentData(studentId) {
    paymentData = allRecordsData['payments']
        .map((item) =>
    {
      'Date': item["payment_date"].toString().substring(0, 10),
      'Month': item["payment_month"],
      'Year': item["payment_year"].toString(),
      'Amount paid': item["amount_paid"].toString(),
    }).toList();

    paymentData.sort((a, b) {
      DateTime dateA = DateTime.parse(a['Date']!);
      DateTime dateB = DateTime.parse(b['Date']!);
      return dateB.compareTo(dateA);
    });
  }

  void _setRecordData(studentId) {
    regRecord = allRecordsData['reg_records']
        .map((item) =>
    {
      'Student Id': item["student_Id"].toString(),
      'Start Date(dd-mm-yyyy)': item["start_date"].toString(),
      'End Date(dd-mm-yyyy)': item["end_date"].toString(),
    }).toList();
  }

  void _setStudentData(studentId) {
    studentData = allRecordsData['student_details']
        .map((item) =>
    {
      'Student Id': item["student_id"],
      'Name': item["first_name"],
      'Program': item["program"],
      'Mess': item["mess_option"],
      'Mess Status': item["current_mess_status"],
      'Amount paid': item["balance"].toString(),
    }).toList();
  }

  getData() async {
    setState(() {
      _loading = true;
      _gotData = false;
    });
    try {
      Map<String, String> data = {
        'type': 'filter',
        'mess_option': selectedMess ?? 'all',
        'program': selectedProgramme ?? 'all',
        'status': selectedStatus ?? 'all',
      };
      List<RegMain> regMainList = await _centralMessService.getRegMain(data);
      if (selectedBatch != null) {
        regMainList = regMainList.where((ele) =>
        ele.studentId.toString().substring(0, 2) == selectedBatch
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
            'View Details': '',
          };
        }).toList();
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _loading= false;
      _gotData = true;
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
                        _showDialog();
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
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
                    columns: buildTableStudentHeader(studentData),
                    rows: buildTableStudentRows(studentData),
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

// }import 'package:flutter/material.dart';
// import 'package:fusion/services/central_mess_services.dart';
// import 'package:fusion/models/central_mess.dart';
//
// class ManageRegistrations extends StatefulWidget {
//   @override
//   _ManageRegistrationsState createState() => _ManageRegistrationsState();
// }
//
// class _ManageRegistrationsState extends State<ManageRegistrations> {
//   CentralMessService _centralMessService = CentralMessService();
//
//   static List<MonthlyBill> _monthlyBillData = [];
//   static List<Payment> _paymentData = [];
//   bool _loading = false, _gotData = false;
//   late String name;
//   String? selectedMess, selectedProgramme, selectedStatus, selectedBatch;
//   List<Map<String, String?>> billData = [], paymentData = [], tableData = [];
//   RegMain userMessData = RegMain(
//       program: "NA", currentMessStatus: 'Deregistered', balance: 0, messOption: "no_mess");
//   late int currentYear;
//   late List<String> yearsList;
//
//   @override
//   void initState() {
//     super.initState();
//     getData(); // set initial data
//     currentYear = DateTime.now().year;
//     yearsList = List.generate(5, (index) => (currentYear - index).toString());
//   }
//
//   void _fetchStudentDetails(String studentId) async {
//     try{
//       Map<String, dynamic> data = await _centralMessService.getAllDetails(studentId);
//       print(data);
//     }catch(e){
//       print("Error fetching data: $e");
//     }
//   }
//
//   void setMonthlyBillData(studentId){
//     billData = _monthlyBillData
//         .where((bill) => bill.studentId.toLowerCase() == studentId.toLowerCase())
//         .map((bill) => {
//       'Month': bill.month.toString(),
//       'Year': bill.year.toString(),
//       'Amount': bill.amount.toString(),
//       'Rebate Count': bill.rebateCount.toString(),
//       'Rebate Amount': bill.rebateAmount.toString(),
//       'Total Amount': bill.totalBill.toString(),
//     }).toList();
//
//     billData.sort((a, b) {
//       int yearComparison = b['Year']!.compareTo(a['Year']!);
//       if (yearComparison != 0) {
//         return yearComparison;
//       }
//       List<String> monthNames = [
//         'December', 'November', 'October', 'September', 'August', 'July', 'June', 'May', 'April', 'March', 'February', 'January'
//       ];
//       int aMonth = monthNames.indexOf(a['Month']!) + 1;
//       int bMonth = monthNames.indexOf(b['Month']!) + 1;
//       return aMonth.compareTo(bMonth);
//     });
//
//   }
//   void _setPaymentData() async {
//     try {
//       List<Payment> payments = await _centralMessService.getPayments();
//       setState(() {
//         _paymentData = payments;
//       });
//       // payments.forEach((ele){
//       //   print(ele.toMap());
//       // });
//       print('Received the payments');
//       setState(() {
//         _loading = false;
//       });
//     } catch (e) {
//       print('Error seting payments: $e');
//     }
//   }
//   // void _setPaymentData(studentId){
//   //   paymentData = _paymentData
//   //       .where((item) => item.studentId.toLowerCase() == studentId.toLowerCase())
//   //       .map((item) => {
//   //     'Student Id': item.studentId,
//   //     'Date': item.paymentDate.toString().substring(0,10),
//   //     'Month': item.paymentMonth,
//   //     'Year': item.paymentYear.toString(),
//   //     'Amount paid': item.amountPaid.toString(),
//   //   }).toList();
//   //
//   //
//   //   paymentData.sort((a, b) {
//   //     DateTime dateA = DateTime.parse(a['Date']!);
//   //     DateTime dateB = DateTime.parse(b['Date']!);
//   //     return dateB.compareTo(dateA);
//   //   });
//   // }
//
//   getData() async {
//     setState(() {
//       _gotData = false;
//     });
//     try {
//       Map<String, String> data = {
//         'type': 'filter',
//         'mess_option': selectedMess ?? 'all',
//         'program': selectedProgramme ?? 'all',
//         'status': selectedStatus ?? 'all',
//       };
//       List<RegMain> regMainList = await _centralMessService.getRegMain(data);
//       if(selectedBatch!=null){
//         regMainList = regMainList.where((ele)=>
//         ele.studentId.toString().substring(0,2) == selectedBatch
//         ).toList();
//       }
//       setState(() {
//         // data = DashboardData.fromJson(jsonDecode(response.body));
//         tableData = regMainList.map((regMain) {
//           return {
//             'Student Id': regMain.studentId,
//             'Program': regMain.program,
//             'Balance': regMain.balance.toString(),
//             'Mess': regMain.messOption,
//             'View Details': '',
//           };
//         }).toList();
//       });
//     } catch (e) {
//       print(e);
//     }
//     setState(() {
//       _gotData = true;
//     });
//   }
//
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//           color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }
//
//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }
//
//   List<Map<String, String>> messDropDownItems = [
//     {"text": "Mess 1", "value": "mess1"},
//     {"text": "Mess 2", "value": "mess2"},
//     {"text": "All", "value": "all"},
//   ];
//   List<Map<String, String>> programmeDropDownItems = [
//     {"text": "B.Tech", "value": "B.Tech"},
//     {"text": "M.Tech", "value": "M.Tech"},
//     {"text": "PHD", "value": "PHD"},
//     {"text": "B.Des", "value": "B.Des"},
//     {"text": "All", "value": "all"},
//   ];
//   List<Map<String, String>> statusDropDownItems = [
//     {"text": "Registered", "value": "Registered"},
//     {"text": "Deregistered", "value": "Deregistered"},
//     {"text": "All", "value": "all"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final _messFormKey = GlobalKey<FormState>();
//     final ButtonStyle style = ElevatedButton.styleFrom(
//       textStyle: const TextStyle(
//           fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
//       backgroundColor: Colors.white,
//       shadowColor: Colors.black,
//     );
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 10.0),
//           Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//               child: Form(
//                 key: _messFormKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select programme',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       // validator: (value) =>
//                       // value == null ? "Select a programme" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedProgramme,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedProgramme = newValue;
//                         });
//                         getData(); // Call getData whenever dropdown value changes
//                       },
//                       items: programmeDropDownItems.map((item) {
//                         return DropdownMenuItem(
//                           child: Text(item["text"]!),
//                           value: item["value"],
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select batch',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       // validator: (value) =>
//                       // value == null ? "Select a programme" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedBatch,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedBatch = newValue;
//                         });
//                         getData(); // Call getData whenever dropdown value changes
//                       },
//                       items: yearsList.map((item) {
//                         return DropdownMenuItem(
//                           child: Text(item),
//                           value: item.toString().substring(2),
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select status',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       // validator: (value) =>
//                       // value == null ? "Select status" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedStatus,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedStatus = newValue;
//                         });
//                         getData(); // Call getData whenever dropdown value changes
//                       },
//                       items: statusDropDownItems.map((item) {
//                         return DropdownMenuItem(
//                           child: Text(item["text"]!),
//                           value: item["value"],
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select a Mess',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       // validator: (value) =>
//                       // value == null ? "Select a mess" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedMess,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedMess = newValue;
//                         });
//                         getData(); // Call getData whenever dropdown value changes
//                       },
//                       items: messDropDownItems.map((item) {
//                         return DropdownMenuItem(
//                           child: Text(item["text"]!),
//                           value: item["value"],
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10.0),
//                     // ElevatedButton(
//                     //     style: style,
//                     //     onPressed: _loading ? null : () {
//                     //       if (_messFormKey.currentState!.validate()) {
//                     //         setState(() {
//                     //           _loading = true;
//                     //         });
//                     //       }
//                     //     },
//                     //     child: Text("Filter"))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           _gotData
//               ? Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1,
//               ),
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columnSpacing: 14,
//                 horizontalMargin: 8,
//                 columns: buildTableHeader(tableData),
//                 rows: buildTableRows(tableData),
//               ),
//             ),
//           )
//               : SizedBox(height: 10.0),
//         ],
//       ),
//     );
//   }
//
//   List<DataColumn> buildTableHeader(List<Map<String, String?>> tableData) {
//     if (tableData.isNotEmpty) {
//       return tableData.first.keys.map((key) {
//         return DataColumn(
//           label: Text(
//             key,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         );
//       }).toList();
//     } else {
//       // Return a default DataColumn if tableData is empty
//       return [
//         DataColumn(
//           label: Text(
//             'No Records Found!',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ];
//     }
//   }
//
//   List<DataRow> buildTableRows(List<Map<String, String?>> tableData) {
//     if (tableData.isNotEmpty) {
//       return tableData.map((data) {
//         return DataRow(
//           cells: data.keys.map((key) {
//             if (key.toLowerCase() == 'view details') {
//               return DataCell(
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _fetchStudentDetails(data['Student Id']!);
//                         _showDialog('Student Details',
//                             billData);
//                       },
//                       child: Text('View Details'),
//                     ),
//                   ],
//                 ),
//               );
//             }else {
//               return DataCell(
//                 Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Text(data[key]!),
//                 ),
//               );
//             }
//           }).toList(),
//         );
//       }).toList();
//     }else{
//       return [
//         DataRow(
//           cells: [
//             DataCell(
//               Padding(
//                 padding: EdgeInsets.all(4),
//                 child: Text("No records found!!!"),
//               ),
//             ),
//           ],
//         ),
//       ];
//     }
//   }
//
//   void _showDialog(String title, List<Map<String, String?>> data) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           insetPadding: EdgeInsets.zero,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1,
//                         ),
//                       ),
//                       columnSpacing: 12,
//                       horizontalMargin: 8,
//                       columns: title == "View Payments" ? buildTableHeader(paymentData) : buildTableHeader(billData),
//                       rows: title == "View Payments" ? buildDialogTableRow(paymentData) : buildDialogTableRow(billData),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('Close'),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   List<DataRow> buildDialogTableRow(List<Map<String, String?>> dataList) {
//     return dataList.map((data) {
//       return DataRow(
//         cells: data.keys.map((key) {
//           return DataCell(
//             Padding(
//               padding: EdgeInsets.all(4),
//               child: Text(data[key]!),
//             ),
//           );
//         }).toList(),
//       );
//     }).toList();
//   }
//
// }