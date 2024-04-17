import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;

class UpdateMonthlyBill extends StatefulWidget {
  @override
  _UpdateMonthlyBillState createState() => _UpdateMonthlyBillState();
}

class _UpdateMonthlyBillState extends State<UpdateMonthlyBill> {

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _sentRequest = false;
  static List <MessBillBase> _messBillBase = [];
  int? amount = 0, amount1 = 0;
  MessBillBase? data;

  void _fetchMonthlyBillData() async {
    try {
      List<MessBillBase> messBillBase = await _centralMessService.getMessBillBase();
      setState(() {
        _messBillBase = messBillBase;
        _messBillBase.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        amount1 = _messBillBase[0].billAmount;
      });
      print('Received the bill amount');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching bill amount : $e');
    }
  }

  void _updateMessBillBaseData(data) async {
    try {
      setState(() {
        _loading = true; // Set loading state to true before sending request
      });
      http.Response menuItems = await _centralMessService.updateMessBillBase(data);
      if (menuItems.statusCode == 200) {
        print('Updated the Bill amount');
        setState(() {
          _sentRequest = true;
        });
        _showSnackbar('Bill amount updated successfully', Colors.green);
      } else {
        print('Couldn\'t update');
        _showSnackbar('Failed to update bill amount. Please try again later.', Colors.red);
      }
    } catch (e) {
      print('Error updating Bill Amount: $e');
      _showSnackbar('Error updating bill amount: $e', Colors.red);
    } finally {
      setState(() {
        _loading = false; // Set loading state to false after the request is completed
      });
    }
  }
  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: backgroundColor,
      ),
    );
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
    _fetchMonthlyBillData();
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
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loading ? Center(child: CircularProgressIndicator())
                    : TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Current Bill Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter new monthly amount bill";
                        } else {
                          amount1 = int.tryParse(value);
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 20.0),
                      readOnly: true,
                      initialValue: amount1!.toString(),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Enter new monthly amount bill',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter new monthly amount bill";
                        } else {
                          amount = int.tryParse(value);
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            print({amount, amount1});
                            setState(() {
                              data = MessBillBase(
                                timestamp: DateTime.now(),
                                billAmount: amount!,
                              );
                              _updateMessBillBaseData(data);
                              setState(() {
                                amount1 = amount;
                                data = null;
                              });
                            });
                          }
                        },
                        child: Text("Update"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
