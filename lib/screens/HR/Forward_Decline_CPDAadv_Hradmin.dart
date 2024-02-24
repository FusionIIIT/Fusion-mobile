import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Forward_Decline_CPDAadv_Audit.dart';

class ForwardOrDeclineFormHradmin extends StatefulWidget {
  const ForwardOrDeclineFormHradmin();

  @override
  State<ForwardOrDeclineFormHradmin> createState() {
    return _ForwardOrDeclineFormHradminState();
  }
}

class _ForwardOrDeclineFormHradminState
    extends State<ForwardOrDeclineFormHradmin> {
  // Prefilled fields
  void submitForm() async {
    print("forwardinf");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForwardOrDeclineFormAudit()));
    // final data =

    // var response = await http.post(
    //   Uri.parse(url),
    //   body: data,
    //   headers: {
    //     "Content-Type": "application/json",
    //   },
    // );
  }

  final String _name = 'John Doe';
  final String _designation = 'Manager';
  final String _pfNo = '1234567890';
  final double _amountReq = 5000.0;
  final String _purpose = 'Vacation';
  final double _advanceDue = 2000.0;

  // Text editing controllers for editable fields
  final TextEditingController _balanceController = TextEditingController();
  final TextEditingController _advanceController = TextEditingController();
  // final TextEditingController _entryCheckedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Name: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_name),
                  SizedBox(height: 10),
                  Text(
                    'Designation: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_designation),
                  SizedBox(height: 10),
                  Text(
                    'P.F. No: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_pfNo),
                  SizedBox(height: 10),
                  Text(
                    'Amount Req: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_amountReq.toString()),
                  SizedBox(height: 10),
                  Text(
                    'Purpose: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_purpose),
                  SizedBox(height: 10),
                  Text(
                    'Advance due for adjustment: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_advanceDue.toString()),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _balanceController,
                    decoration: const InputDecoration(
                      labelText: 'Balance available',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the balance';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _advanceController,
                    decoration: const InputDecoration(
                      labelText: 'Advance amount in PDA register',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the advance amount';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          submitForm();
                          // Respond to approve button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 202, 122, 69),
                        ),
                        child: Text(
                          'Forward',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Respond to decline button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 64, 162, 201),
                        ),
                        child: Text(
                          'Decline',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
