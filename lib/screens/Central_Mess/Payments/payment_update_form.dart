
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

class UpdatePaymentForm extends StatefulWidget {
  @override
  _UpdatePaymentFormState createState() => _UpdatePaymentFormState();
}

class _UpdatePaymentFormState extends State<UpdatePaymentForm> {
  String? _fileBase64;
  CentralMessService _centralMessService = CentralMessService();
  bool _loading = false, _register = false;
  int? amount;
  String? selectedStudentId, txnNo;
  DateTime? paymentDate;
  final amountController = TextEditingController();
  final txnNoController = TextEditingController();
  UpdatePaymentRequest? data;
  String? _filePath;

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Update Payment Request Sent Successfully',
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
          'Failed to send Update Payment Request. Please try again later!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _sendUpdatePaymentRequestData(UpdatePaymentRequest data) async {
    setState(() {
      _loading = true;
    });
    try {
      print({data.startDate, data.amount, data.txnNo, data.img});
      http.Response _UpdatePaymentRequest =
      await _centralMessService.sendUpdatePaymentRequest(data);

      if (_UpdatePaymentRequest.statusCode == 200) {
        print('Sent the payment update request');
        setState(() {
          _register = true;
          // Reset fields to null after successful submission
          amountController.clear();
          txnNoController.clear();
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
      print('Error sending Payment Update Request: $e');
      _showFailureSnackbar();
    }
    setState(() {
      _loading = false;
    });
  // }

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

  void _openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        String? filePath = result.files.single.path;
        String? fileBase64 = await _convertFileToBase64(filePath!);
        setState(() {
          _filePath = filePath;
          _fileBase64 = fileBase64;
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
                        labelText: 'Payment Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.onUserInteraction, // Only validate on user interaction
                      initialValue: paymentDate, // Set initial value
                      validator: (e) => e == null ? 'Please select a date' : null,
                      onDateSelected: (DateTime? value) {
                        setState(() {
                          paymentDate = value; // Update paymentDate when a date is selected
                        });
                      },
                      firstDate: DateTime.now().subtract(Duration(days: 365)), // Limit to one year ago
                      lastDate: DateTime.now(), // Limit to today
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
                          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: TextEditingController(text: _filePath != null ? _filePath!.split('/').last : ''),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a file";
                        }
                        return null;
                      },
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
                              data = UpdatePaymentRequest(
                                img: _filePath,
                                txnNo: txnNoController.text,
                                amount:
                                int.tryParse(amountController.text)!,
                                paymentDate: paymentDate!,
                              );
                              print(data?.toMap());
                              _sendUpdatePaymentRequestData(data!);
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
