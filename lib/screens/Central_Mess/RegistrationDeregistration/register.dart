import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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
  String? _filePath;

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Registration Request Sent Successfully',
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
          'Failed to send Registration Request. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _sendRegistrationRequestData(RegistrationRequest data) async {
    setState(() {
      _loading = true;
    });
    try {
      print({data.startDate, data.amount, data.txnNo, data.img});
      http.Response registrationRequest =
      await _centralMessService.sendRegistrationRequest(data);

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
    setState(() {
      _loading = false;
    });
  }

  Future<String> _convertFileToBase64(String filePath) async {
    List<int> fileBytes = await File(filePath).readAsBytes();
    return base64Encode(fileBytes);
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

  void _openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        String? filePath = result.files.single.path;
        String? fileBase64 = await _convertFileToBase64(filePath!);
        // setState(() {
          _filePath = filePath;
          _fileBase64 = fileBase64;
        // });
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
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Start Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      // autovalidateMode: AutovalidateMode.always,
                      // initialValue: DateTime.now(),
                      validator: (e) =>
                      e == null ? 'Select start date' : null,
                      onDateSelected: (DateTime value) {
                        registerDate = value;
                      },
                      firstDate: DateTime.now(),
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'Payment date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Icon(Icons.event_note),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Select payment date' : null,
                      onDateSelected: (DateTime value) {
                        paymentDate = value;
                      },
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
                      },
                      controller: txnNoController,
                      onSaved: (newValue) {
                        txnNoController.text = newValue!;
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      readOnly: true,
                      onTap: _openFileExplorer,
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
                        text: _filePath ?? '',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading
                          ? null
                          : () async {
                        if (_messFormKey.currentState!.validate()) {
                          if (_filePath != null) {
                            setState(() {
                              _loading = true;
                            });
                            try {
                              data = RegistrationRequest(
                                img: _filePath,
                                txnNo: txnNoController.text,
                                amount:
                                int.tryParse(amountController.text)!,
                                startDate: registerDate!,
                                paymentDate: paymentDate!,
                              );
                              print(data?.toMap());
                                _sendRegistrationRequestData(data!);
                            } catch (e) {
                              print(
                                  'Error sending registration request: $e');
                              setState(() {
                                _loading = false;
                              });
                            }
                          } else {
                            print("No file selected");
                          }
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Register"),
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
