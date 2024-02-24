import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;

class ApplyForCPDArbrse extends StatefulWidget {
  const ApplyForCPDArbrse();

  @override
  State<ApplyForCPDArbrse> createState() {
    return _ApplyForCPDArbrseState();
  }
}

class _ApplyForCPDArbrseState extends State<ApplyForCPDArbrse> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _pfNoController = TextEditingController();
  TextEditingController _advanceTakenController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _adjustmentSubmittedController =
      TextEditingController();

  void submitForm() async {
    final url = "http://10.0.2.2:8000/hr2/cpdarbrse/";

    Map<String, String> data = {
      "name": _nameController.text,
      "designation": _designationController.text,
      "pfNo": _pfNoController.text,
      "advanceTaken": _advanceTakenController.text,
      "purpose": _purposeController.text,
      "adjustmentSubmitted": _adjustmentSubmittedController.text,
    };

    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      SnackBar(content: Text("Application Submitted Successfully"));
    } else {
      // ignore: avoid_print
      SnackBar(content: Text("Application Submission Failed"));
    }
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
                  children: [
                    TextFormField(
                      controller: _nameController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),
                    TextFormField(
                      controller: _designationController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Designation'),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),

                    TextFormField(
                      controller: _pfNoController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('P.F. No.'),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),
                    TextFormField(
                      controller: _advanceTakenController,
                      decoration: const InputDecoration(
                        label: Text('Advance Taken'),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),
                    TextFormField(
                      controller: _purposeController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Purpose'),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),
                    TextFormField(
                      controller: _adjustmentSubmittedController,
                      decoration: const InputDecoration(
                        label:
                            Text('Adjustment/Reimbursement submitted for Rs. '),
                      ),
                      validator: (value) {
                        return 'Demo...';
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ), // instead of TextField()
                    ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                        submitForm();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
