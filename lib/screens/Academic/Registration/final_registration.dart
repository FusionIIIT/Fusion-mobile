import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

import 'package:http/http.dart';

class FinalRegistration extends StatefulWidget {
  @override
  _FinalRegistration createState() => _FinalRegistration();
}

class _FinalRegistration extends State<FinalRegistration> {
  final _formKey = GlobalKey<FormState>();
  String? _responseText;
  late TextEditingController _transactionIdController;
  late TextEditingController _depositDateController;
  late TextEditingController _utrNumberController;
  late TextEditingController _feePaidController;
  late TextEditingController _actualFeeController;
  late TextEditingController _modeController;
  late TextEditingController _feeReceiptController;
  late DateTime _selectedDate;
  late AcademicService academicService;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  void initState() {
    super.initState();
    _transactionIdController = TextEditingController();
    _depositDateController = TextEditingController();
    _utrNumberController = TextEditingController();
    _feePaidController = TextEditingController();
    _actualFeeController = TextEditingController();
    _modeController = TextEditingController();
    _feeReceiptController = TextEditingController();
    _selectedDate = DateTime.now();
    academicService = AcademicService();
    // _selectedFile = null;
  }

  @override
  void dispose() {
    _transactionIdController.dispose();
    _depositDateController.dispose();
    _utrNumberController.dispose();
    _feePaidController.dispose();
    _actualFeeController.dispose();
    _modeController.dispose();
    _feeReceiptController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _depositDateController.text = picked.toString().substring(0, 10);
      });
  }

  // Future<void> _selectFile() async {
  //   // Implement file selection logic here (e.g., using file picker package)
  //   setState(() {
  //     // Set the selected file path
  //     _selectedFile = "Selected file path";
  //   });
  // }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve text data from controllers
      String transactionId = _transactionIdController.text;
      String depositDate = _depositDateController.text;
      String utrNumber = _utrNumberController.text;
      String feePaid = _feePaidController.text;
      String actualFee = _actualFeeController.text;
      String mode = _modeController.text;

      // Perform further actions with the data, such as submitting to an API or saving locally

      // Example: Print the data
      print('Transaction ID: $transactionId');
      print('Deposit Date: $depositDate');
      print('UTR Number: $utrNumber');
      print('Fee Paid: $feePaid');
      print('Actual Fee: $actualFee');
      print('Mode: $_modeController');

      // You can add your logic here to submit the form data

      Response response = await academicService.finalRegistration(
          transactionId, depositDate, utrNumber, feePaid, actualFee, mode);
      setState(() {
        _responseText = (jsonDecode(response.body))["message"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Final Registration",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
          MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _transactionIdController,
                      decoration: InputDecoration(labelText: 'Transaction ID'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter transaction ID';
                        }
                        return null;
                      },
                    )),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _depositDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Deposit Date',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter deposit date';
                        }
                        return null;
                      },
                    )),

                // SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _utrNumberController,
                      decoration:
                          InputDecoration(labelText: 'UTR Number (Optional)'),
                    )),

                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _feePaidController,
                      decoration: InputDecoration(labelText: 'Fee Paid'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter fee paid';
                        }
                        return null;
                      },
                    )),
                // SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _actualFeeController,
                      decoration: InputDecoration(labelText: 'Actual Fee'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter actual fee';
                        }
                        return null;
                      },
                    )),
                // SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _modeController,
                      decoration: InputDecoration(labelText: 'Mode'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mode of payment';
                        }
                        return null;
                      },
                    )),
                // SizedBox(height: 20),
                // Row(
                //   children: [
                //     Expanded(
                //       child: TextFormField(
                //         controller: _feeReceiptController,
                //         decoration: InputDecoration(labelText: 'Fee Receipt'),
                //         validator: (value) {
                //           if (_selectedFile == null || _selectedFile!.isEmpty) {
                //             return 'Please upload fee receipt';
                //           }
                //           return null;
                //         },
                //       ),
                //     ),
                //     IconButton(
                //       icon: Icon(Icons.attach_file),
                //       onPressed: _selectFile,
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange[
                          900]), // Setting background color of button to blue
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Submit',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _responseText == null
                    ? Container()
                    : Text(
                        _responseText!,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
