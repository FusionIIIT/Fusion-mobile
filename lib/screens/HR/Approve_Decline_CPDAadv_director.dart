import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/Request_list.dart';

class ApproveOrDeclineFormDirector extends StatefulWidget {
  const ApproveOrDeclineFormDirector();

  @override
  State<ApproveOrDeclineFormDirector> createState() {
    return _ApproveOrDeclineFormDirectorState();
  }
}

class _ApproveOrDeclineFormDirectorState
    extends State<ApproveOrDeclineFormDirector> {
  // Prefilled fields
  final String _name = 'John Doe';
  final String _designation = 'Manager';
  final String _pfNo = '1234567890';
  final double _amountReq = 5000.0;
  final String _purpose = 'Vacation';
  final double _advanceDue = 2000.0;
  final double _balanceavailable = 204.0;
  final double _advance = 2050.0;
  final double _entryChecked = 2300.0;

  void submitForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RequestListPage()));
  }

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
                  Text(
                    'Balance Available: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_balanceavailable.toString()),
                  SizedBox(height: 10),
                  Text(
                    'Advanced Amount in PDA Register: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_advance.toString()),
                  SizedBox(height: 10),
                  Text(
                    'Entry Checked in PDA Register in Rs: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_entryChecked.toString()),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Respond to approve button press
                          submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 202, 122, 69),
                        ),
                        child: Text(
                          'Approve',
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


// SizedBox(height: 10),
//                   TextFormField(
//                     controller: _balanceController,
//                     decoration: const InputDecoration(
//                       labelText: 'Balance available',
//                     ),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Please enter the balance';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: _advanceController,
//                     decoration: const InputDecoration(
//                       labelText: 'Advance amount in PDA register',
//                     ),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Please enter the advance amount';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: _entryCheckedController,
//                     decoration: const InputDecoration(
//                       labelText: 'Entry checked in PDA register for Rs',
//                     ),
//                     validator: (value) {
//                       if (value?.isEmpty ?? true) {
//                         return 'Please enter the amount';
//                       }
//                       return null;
//                     },
//                   ),