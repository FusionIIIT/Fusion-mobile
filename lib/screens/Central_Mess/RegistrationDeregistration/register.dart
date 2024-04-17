import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? _fileBase64;

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = false, _register = false;
  int? amount;
  String? selectedStudentId, txnNo;
  DateTime? registerDate, paymentDate;
  final amountController = TextEditingController();
  final txnNoController = TextEditingController();

  RegistrationRequest? data;

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Special Request Sent Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green, // Set background color to green for success
      ),
    );
  }

  void _showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Failed to send Special Request. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
      ),
    );
  }

  void _sendRegistrationRequestData(data) async {
    try {
      print({data.startDate, data.amount, data.txnNo, data.img});
      http.Response registrationRequest = await _centralMessService.sendRegistrationRequest(data);
      if (registrationRequest.statusCode == 200) {
        print('Sent the register request');
        setState(() {
          _register = true;
          // Reset fields to null after successful submission
          amountController.clear();
          txnNoController.clear();
          registerDate = null;
          paymentDate = null;
          _filePath = null;
          _fileBase64 = null;
        });
        _showSuccessSnackbar();
      } else {
        print('Couldn\'t send');
        _showFailureSnackbar();
      }
    } catch (e) {
      print('Error sending Register Request: $e');
      _showFailureSnackbar();
    }
  }



  Future<String> _convertFileToBase64(String filePath) async {
    List<int> fileBytes = await File(filePath).readAsBytes();
    // setState(() {
      return base64Encode(fileBytes);
    // });
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

  @override
  void initState() {
    super.initState();
  }
  String? _filePath;

  void _openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'], // Allow PDF, JPG, JPEG, PNG files
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
        });
        setState(() async {
          _fileBase64 = await _convertFileToBase64(_filePath!);
        });
      }
    } on Exception catch (e) {
      print("Error picking file: $e");
    }
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 10.0),
                    _register
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Registration Request sent Successfully"),
                      ],
                    )
                        : SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Register From',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(), // Set initial date
                      validator: (e) => e == null ? 'Please select a date' : null,
                      onDateSelected: (DateTime value) {
                        registerDate = value;
                      },
                      firstDate: DateTime.now(), // Disable previous dates
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Payment Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(), // Set initial date
                      validator: (e) => e == null ? 'Please select a date' : null,
                      onDateSelected: (DateTime value) {
                        paymentDate = value;
                      },
                      firstDate: DateTime.now(), // Disable previous dates
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      keyboardType: TextInputType.number, // Set the keyboard type to accept numbers
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly // Allow only digits
                      ],
                      decoration: InputDecoration(
                        labelText: 'Amount Paid',
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
                          return "Please enter amount paid";
                        }
                        // return null;
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
                      decoration: InputDecoration(
                        labelText: 'Transaction No.',
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
                          return "Please enter Transaction No.";
                        }
                        // return null;
                      },
                      controller: txnNoController,
                      onSaved: (newValue) {
                        txnNoController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      readOnly: true, // Make the text field read-only
                      onTap: _openFileExplorer, // Open file explorer when tapped
                      decoration: InputDecoration(
                        labelText: 'Upload Screenshot/Receipt',
                        suffixIcon: Icon(Icons.attach_file),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: TextEditingController(
                        text: _filePath ?? '', // Display selected file path
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading ? null : () async {
                        if (_messFormKey.currentState!.validate()) {
                          if (_filePath != null) {
                            setState(() {
                              _loading = true; // Set loading to true when registration process starts
                            });
                            try {
                              // Convert the selected image to base64
                              data = RegistrationRequest(
                                img: _filePath,
                                txnNo: txnNoController.text,
                                amount: int.tryParse(amountController.text)!,
                                startDate: registerDate!,
                                paymentDate: paymentDate!,
                              );
                              // Send registration request
                              _sendRegistrationRequestData(data);
                            } catch (e) {
                              // Handle error
                              print('Error sending registration request: $e');
                              setState(() {
                                _loading = false; // Set loading to false when registration process fails
                              });
                            }
                          } else {
                            // Handle case when no image is selected
                            print("No file selected");
                          }
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Register"),
                          if (_loading) CircularProgressIndicator(), // Show CircularProgressIndicator when loading
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
