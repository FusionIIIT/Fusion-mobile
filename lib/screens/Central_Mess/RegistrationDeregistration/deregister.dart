import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class DeRegister extends StatefulWidget {
  @override
  _DeRegisterState createState() => _DeRegisterState();
}

class _DeRegisterState extends State<DeRegister> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = false, _deregister = false;
  String? selectedStudentId;
  DateTime? deregisterDate;
  DeregistrationRequest? data;

    void _sendDeregistrationlRequestData(data) async {
    try {
      http.Response registrationRequest =
          await _centralMessService.sendDeregistrationRequest(data);
      if (registrationRequest.statusCode == 200) {
        print('Sent the deregister request');
        setState(() {
          _deregister = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error sending Deregistration Request: $e');
    }
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
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Deregister From',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(), // Set initial date
                      validator: (e) =>
                      e == null ? 'Please select a date' : null,
                      onDateSelected: (DateTime value) {
                        deregisterDate = value;
                      },
                      firstDate: DateTime.now(), // Allow dates starting from tomorrow
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            // print({deregisterDate});
                            setState(() {
                              data = DeregistrationRequest(
                                endDate: deregisterDate!,
                              );
                              _sendDeregistrationlRequestData(data);
                              setState(() {
                                data = null;
                              });
                            });
                          }
                        },
                        child: Text("DeRegister"))
                  ],
                ),
              ),
            ),
          ),
          _deregister
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Deregistration Request sent Successfully"),
                  ],
                )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
