import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;

class ApproveOrDeclineLTCDirector extends StatefulWidget {
  const ApproveOrDeclineLTCDirector({Key? key}) : super(key: key);

  @override
  State<ApproveOrDeclineLTCDirector> createState() =>
      _ApproveOrDeclineLTCDirectorState();
}

class _ApproveOrDeclineLTCDirectorState
    extends State<ApproveOrDeclineLTCDirector> {
  // Prefilled data for the fields
  final Map<String, String> prefilledData = {
    'Name': 'John Doe',
    'Designation': 'Assistant Professor',
    'Department/Section': 'Computer Science',
    'BlockYear/P.F. No.': '2023',
    'Amount': '5000',
    'Leave Required': '30 days',
    'Leave Start Date': '2024-01-01',
    'Leave End Date': '2024-01-30',
    'Date of Leave for Family': '2024-02-01',
    'Nature of Leave': 'Casual',
    'Purpose of Leave': 'Vacation',
    'Address During Leave': '123 Street, City',
    'Mode of Travel': 'Air',
    'Details of Family Members for whom LTC is claimed': 'Spouse, Child',
    'Details of Family Members for whom LTC is TO BE claimed': 'None',
    'Amount of Advance if any required': '2000',
    'Remarks by HOD': 'Good luck with your vacation!',
  };

  void submitForm() async {
    // You can implement your form submission logic here
    final String url = "http://127.0.0.1:8000/hr2/ltc/";
    var response = await http.post(Uri.parse(url), body: prefilledData);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Application Successfully Submitted")),
      );
      // Redirect to home page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Application Failed to Submit")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Personal Information'),
                ..._buildPrefilledFields(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement approve logic
                      },
                      child: const Text('Approve'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement decline logic
                      },
                      child: const Text('Decline'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _buildPrefilledFields() {
    return prefilledData.entries.map((entry) {
      return _buildTextInputField(entry.key, initialValue: entry.value);
    }).toList();
  }

  Widget _buildTextInputField(String labelText, {String initialValue = ''}) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}
