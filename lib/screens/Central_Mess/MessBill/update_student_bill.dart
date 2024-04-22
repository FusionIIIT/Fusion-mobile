import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UpdateStudentBill extends StatefulWidget {
  @override
  _UpdateStudentBillState createState() => _UpdateStudentBillState();
}

class _UpdateStudentBillState extends State<UpdateStudentBill> {
  CentralMessService _centralMessService = CentralMessService();
  bool _loading = false;
  DateTime?  paymentDate;
  final amountController = TextEditingController();
  final rebateCountController = TextEditingController();
  final rebateAmountController = TextEditingController();
  final studentIdController = TextEditingController();
  String? selectedMonth, selectedYear;
  late int currentYear;
  late List<String> yearsList;
  MonthlyBill? data;

  List<Map<String, String>> monthsList = [
    {"text": "January" , "value": "January"},
    {"text": "February" , "value": "February"},
    {"text": "March" , "value": "March"},
    {"text": "April" , "value": "April"},
    {"text": "May" , "value": "May"},
    {"text": "June" , "value": "June"},
    {"text": "July" , "value": "July"},
    {"text": "August" , "value": "August"},
    {"text": "September" , "value": "September"},
    {"text": "October" , "value": "October"},
    {"text": "November" , "value": "November"},
    {"text": "December" , "value": "December"},
  ];

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
    yearsList = List.generate(5, (index) => (currentYear - index).toString());
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Student Bill Updated Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Failed to update student bill. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }
  void _updateMonthlyBill(MonthlyBill data) async {
    setState(() {
      _loading = true;
    });
    try {
      http.Response billUpdate =
      await _centralMessService.updateMonthlyBill(data);

      if (billUpdate.statusCode == 200) {
        print('Updated the student bill successfully');
        setState(() {
          selectedMonth = null;
          selectedYear = null;
          amountController.clear();
          rebateAmountController.clear();
          rebateCountController.clear();
          studentIdController.clear();
        });
        _showSuccessSnackbar();
      } else {
        print('Couldn\'t update');
        _showFailureSnackbar();
      }
    } catch (e) {
      print('Error updating Student Bill: $e');
      _showFailureSnackbar();
    }
    setState(() {
      _loading = false;
    });
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
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Studend Id',
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
                          return "Please enter student id";
                        }
                      },
                      controller: studentIdController,
                      onSaved: (newValue) {
                        studentIdController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select a Year',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) => value == null ? "Select a year" : null,
                      dropdownColor: Colors.white,
                      value: selectedYear,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                      items: yearsList.map((year) {
                        return DropdownMenuItem(
                          child: Text(year),
                          value: year,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select a Month',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) => value == null ? "Select a month" : null,
                      dropdownColor: Colors.white,
                      value: selectedMonth,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                      items: monthsList.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        labelText: 'New Amount',
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
                          return "Please enter new amount";
                        }
                      },
                      controller: amountController,
                      onSaved: (newValue) {
                        amountController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        labelText: 'Rebate Count',
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
                          return "Please enter rebate count";
                        }
                      },
                      controller: rebateCountController,
                      onSaved: (newValue) {
                        rebateCountController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),                    
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        labelText: 'Rebate Amount',
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
                          return "Please enter rebate amount";
                        }
                      },
                      controller: rebateAmountController,
                      onSaved: (newValue) {
                        rebateAmountController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 30.0),

                    ElevatedButton(
                      style: style,
                      onPressed: _loading
                          ? null
                          : () async {
                        if (_messFormKey.currentState!.validate()) {
                          setState(() {
                            _loading = true;
                          });
                            try {
                              data = MonthlyBill(
                                studentId: studentIdController.text.toUpperCase(),
                                amount : int.parse(amountController.text)!,
                                month: selectedMonth!,
                                year : int.parse(selectedYear!),
                                rebateCount : int.parse(rebateCountController.text)!,
                                rebateAmount : int.parse(rebateAmountController.text)!

                              );
                              print(data?.toMap());
                              _updateMonthlyBill(data!);
                            } catch (e) {
                              print(
                                  'Error updating student bill: $e');
                              setState(() {
                                _loading = false;
                              });
                            }
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Update"),
                          if (_loading)
                            CircularProgressIndicator(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
