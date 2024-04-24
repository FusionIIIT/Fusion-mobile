import 'package:fusion/api.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class UpdatePaymentRequests extends StatefulWidget {
  @override
  _UpdatePaymentRequestsState createState() => _UpdatePaymentRequestsState();
}

class _UpdatePaymentRequestsState extends State<UpdatePaymentRequests> {

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  static List<UpdatePaymentRequest> _UpdatePaymentRequests = [];
  UpdatePaymentRequest? updatePaymentData;

  @override
  void initState() {
    super.initState();
    _fetchUpdatePaymentRequest();
  }

  void _fetchUpdatePaymentRequest() async {
    try {
      List<UpdatePaymentRequest> _UpdatePaymentRequests =
      await _centralMessService.getUpdatePaymentRequest();
      setState(() {
        _UpdatePaymentRequests = _UpdatePaymentRequests.where((element) => element.status == "pending").toList();
        _UpdatePaymentRequests.sort((a, b) => b.paymentDate.compareTo(a.paymentDate));
      });
      print('Received Update Payment Requests');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching update payment requests: $e');
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

  void _updateUpdatePaymentRequestData(data) async {
    setState(() {
      _loading = true;
    });

    try {
      http.Response response =
      await _centralMessService.updateUpdatePaymentRequest(data);
      if (response.statusCode == 200) {
        print('Updated the Update Payment Request');
        setState(() {
          _requestSent = true;
        });
        _showSnackbar('Update Payment Request updated successfully', Colors.green);
      } else {
        print('Couldn\'t update');
        _showSnackbar(
            'Failed to update Update Payment Request. Please try again later.',
            Colors.red);
      }
    } catch (e) {
      print('Error updating Update Payment Request: $e');
      _showSnackbar('Error updating Update Payment Request: $e', Colors.red);
    }
    _fetchUpdatePaymentRequest();
    setState(() {
      _loading = false;
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
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
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
  String? status, mess;

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "accept"},
    {"text": "Reject", "value": "reject"},
  ];
  List<Map<String, String>> menuDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];

  @override
  Widget build(BuildContext context) {
    return _loading == true
        ? Center(child: CircularProgressIndicator())
        : (SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        horizontalMargin: 8,
        columns: buildTableHeader(),
        rows: buildTableRows(),
      ),
    ));
  }

  List<DataColumn> buildTableHeader() {
    if (_UpdatePaymentRequests.length <= 0) {
      return [
        DataColumn(
          label: Text(
            'No Pending Requests!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    return _UpdatePaymentRequests.first.getKeysToDisplay().map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows() {
    return _UpdatePaymentRequests.map((data) {
      return DataRow(
        cells: data.toMap().keys.map((key) {
          if (key.toLowerCase() == 'img') {
            var imageUrl = Uri.http(kCentralMess, 'mess${data.toMap()[key]}');
            return DataCell(
              InkWell(
                child: DefaultTextStyle(
                  style: TextStyle(color: Color.fromARGB(255, 33, 93, 243)),
                  child: Text('View Image'),
                ),
                onTap: () async {
                  if (await canLaunchUrl(imageUrl)) {
                    await launchUrl(imageUrl);
                  } else {
                    print('Could not launch $imageUrl');
                  }
                },
              ),
            );
          } else if (key.toLowerCase() == 'status') {
            return DataCell(
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: status != null ? null : 'Select',
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
                validator: (value) => value == null ? "Select" : null,
                dropdownColor: Colors.white,
                value: status,
                onChanged: (String? newValue) {
                  setState(() {
                    status = newValue!;
                  });
                  setState(() {
                    updatePaymentData = UpdatePaymentRequest(
                        studentId: data.studentId,
                        txnNo: data.txnNo,
                        amount: data.amount,
                        paymentDate: data.paymentDate,
                        img: data.img,
                        status: status
                    );
                  });
                  print(updatePaymentData?.toMap());
                  _updateUpdatePaymentRequestData(updatePaymentData!);
                },
                items: statusDropDownItems.map((item) {
                  return DropdownMenuItem(
                    child: Text(item["text"]!),
                    value: item["value"],
                  );
                }).toList(),
              ),
            );
          }
          else if (key.toLowerCase() == 'paymentdate') {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value.toString().substring(0, 10)),
              ),
            );
          } else {
            var value = data.toMap()[key];
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(value.toString()),
              ),
            );
          }
        }).toList(),
      );
    }).toList();
  }
}

