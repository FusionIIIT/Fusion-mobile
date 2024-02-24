import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;

class ApplyForLTC extends StatefulWidget {
  const ApplyForLTC();

  @override
  State<ApplyForLTC> createState() {
    return _ApplyForLTCState();
  }
}

class _ApplyForLTCState extends State<ApplyForLTC> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _blockYearController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _leaveRequiredController = TextEditingController();
  TextEditingController _leaveStartDateController = TextEditingController();
  TextEditingController _leaveEndDateController = TextEditingController();
  TextEditingController _natureController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _modeController = TextEditingController();
  TextEditingController _detailsOfFamilyClaimedController =
      TextEditingController();
  TextEditingController _detailsOfFamilyToBeClaimedController =
      TextEditingController();
  TextEditingController _advanceController = TextEditingController();
  TextEditingController _dateOfLeaveForFamilyController =
      TextEditingController();
  TextEditingController _pfNoController = TextEditingController();

  void createRequest() async {
    if (formKey.currentState!.validate()) {
      final String url = "http://10.0.2.2:8000/hr2/ltc/";
      Map<String, String> data = {
        "name": _nameController.text,
        "designation": _designationController.text,
        "departmentInfo": _departmentController.text,
        "blockYear": _blockYearController.text,
        // "pfNo": _pfNoController.text,
        "amount": _amountController.text,
        "leaveRequired": _leaveRequiredController.text,
        "leaveEndDateate": _leaveEndDateController.text,
        "leaveStartDate": _leaveStartDateController.text,
        "dateOfLeaveForFamily":
            _dateOfLeaveForFamilyController.text, // "if not availing for self"
        "natureOfLeave": _natureController.text,
        "purposeOfLeave": _purposeController.text,
        "addressDuringLeave": _addressController.text,
        "modeForVacation": _modeController.text,
        "detailsOfFamilyMembersAlreadyDone":
            _detailsOfFamilyClaimedController.text,
        "familyMembersAboutToAvail": _detailsOfFamilyToBeClaimedController.text,
        "amountOfAdvanceRequired": _advanceController.text,
      };
      // send a post request to the server for creating the request
      // if the request is successful, show a snackbar with the message
      // if the request is unsuccessful, show a snackbar with the error message
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Application Successfully Submitted")));
        // Redirect to  home page
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Application Failed to Submit")));
        // do not redirect
      }
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
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    TextFormField(
                      controller: _designationController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Designation'),
                      ),
                    ),
                    TextFormField(
                      controller: _departmentController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Department/Section'),
                      ),
                    ),
                    TextFormField(
                      controller: _blockYearController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('BlockYear/P.F. No.'),
                      ),
                    ),
                    TextFormField(
                      controller: _amountController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Amount'),
                      ),
                    ),
                    TextFormField(
                      controller: _leaveRequiredController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Leave Required'),
                      ),
                    ),
                    TextFormField(
                      controller: _leaveStartDateController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Leave Start Date'),
                      ),
                    ),
                    TextFormField(
                      controller: _leaveEndDateController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Leave End Date'),
                      ),
                    ),
                    TextFormField(
                      controller: _dateOfLeaveForFamilyController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text(
                            'Date of Leave for family (if not availing for self)'),
                      ),
                    ),
                    TextFormField(
                      controller: _natureController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Nature of Leave'),
                      ),
                    ),
                    TextFormField(
                      controller: _purposeController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Purpose of Leave'),
                      ),
                    ),
                    TextFormField(
                      controller: _addressController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Address During Leave'),
                      ),
                    ),
                    TextFormField(
                      controller: _modeController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Mode of Travel'),
                      ),
                    ),
                    TextFormField(
                      controller: _detailsOfFamilyClaimedController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text(
                            'Details of Family Members for whom LTC is claimed'),
                      ),
                    ),
                    TextFormField(
                      controller: _detailsOfFamilyToBeClaimedController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text(
                            'Details of Family Members for whom LTC is TO BE claimed'),
                      ),
                    ),
                    TextFormField(
                      controller: _advanceController,
                      decoration: const InputDecoration(
                        label: Text('Amount of Advance if any required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ), // instead of TextField()
                    ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                        createRequest();
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
