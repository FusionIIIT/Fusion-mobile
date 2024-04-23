import 'package:flutter/material.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/student_homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/models/profile.dart';
import 'dart:convert';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart';
import 'package:fusion/api.dart';

class McmForm extends StatefulWidget {
  @override
  _McmFormState createState() => _McmFormState();
}

class _McmFormState extends State<McmForm> {
  TextEditingController fatherOccupationController = TextEditingController();
  TextEditingController motherOccupationController = TextEditingController();
  TextEditingController brotherNameController = TextEditingController();
  TextEditingController sisterNameController = TextEditingController();
  TextEditingController brotherOccupationController = TextEditingController();
  TextEditingController sisterOccupationController = TextEditingController();
  TextEditingController fatherIncomeController = TextEditingController();
  TextEditingController motherIncomeController = TextEditingController();
  TextEditingController otherIncomeController = TextEditingController();
  TextEditingController fatherOccDescController = TextEditingController();
  TextEditingController motherOccDescController = TextEditingController();
  TextEditingController fourwheelerController = TextEditingController();
  TextEditingController fourWheelerDescController = TextEditingController();
  TextEditingController twowheelerController = TextEditingController();
  TextEditingController twoWheelerDescController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController plotAreaController = TextEditingController();
  TextEditingController constructedAreaController = TextEditingController();
  TextEditingController schoolFeeController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController collegeFeeController = TextEditingController();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  bool _isValid = true;

  void _validateForm() {
    setState(() {
      // Check if any of the required fields are empty
      _isValid = _validateField(fatherOccupationController) &&
          _validateField(motherOccupationController) &&
          _validateField(brotherNameController) &&
          _validateField(sisterNameController) &&
          _validateField(brotherOccupationController) &&
          _validateField(sisterOccupationController) &&
          _validateField(fatherIncomeController) &&
          _validateField(motherIncomeController) &&
          _validateField(otherIncomeController) &&
          _validateField(fatherOccDescController) &&
          _validateField(motherOccDescController) &&
          _validateField(fourwheelerController) &&
          _validateField(fourWheelerDescController) &&
          _validateField(twowheelerController) &&
          _validateField(twoWheelerDescController) &&
          _validateField(houseController) &&
          _validateField(plotAreaController) &&
          _validateField(constructedAreaController) &&
          _validateField(schoolFeeController) &&
          _validateField(schoolNameController) &&
          _validateField(collegeFeeController) &&
          _validateField(collegeNameController) &&
          _validateField(loanAmountController) &&
          _validateField(bankNameController);
    });
  }

  bool _validateField(TextEditingController controller) {
    return controller.text.isNotEmpty;
  }

  void postFormData() async {
    final String host = kserverLink;
    final String path = "/spacs/student_view/";
    Uri uri = Uri.http(host, path);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-MOBILE-ENV': 'true',
      'Accept': "application/json",
    };

    Map<String, dynamic> requestBody = {
      'Submit_MCM': 'true',
      'father_occ': fatherOccupationController.text,
      'mother_occ': motherOccupationController.text,
      'brother_name': brotherNameController.text,
      'sister_name': sisterNameController.text,
      'brother_occupation': brotherOccupationController.text,
      'sister_occupation': sisterOccupationController.text,
      'income_father': fatherIncomeController.text,
      'income_mother': motherIncomeController.text,
      'income_other': otherIncomeController.text,
      'father_occ_desc': fatherOccDescController.text,
      'mother_occ_desc': motherOccDescController.text,
      'four_wheeler': fourwheelerController.text,
      'four_wheeler_desc': fourWheelerDescController.text,
      'two_wheeler_desc': twowheelerController.text,
      'two_wheeler': twoWheelerDescController.text,
      'house': houseController.text,
      'plot_area': plotAreaController.text,
      'constructed_area': constructedAreaController.text,
      'school_fee': schoolFeeController.text,
      'school_name': schoolNameController.text,
      'college_fee': collegeFeeController.text,
      'college_name': collegeNameController.text,
      'loan_amount': loanAmountController.text,
      'bank_name': bankNameController.text,
    };

    var client = http.Client();
_clearTextFields();
    try {
      var response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        // Successful response
        print("Form submitted successfully");
        // Clear text fields after successful submission
        _clearTextFields();
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }

  void _clearTextFields() {
    // Clear all text fields
    fatherOccupationController.clear();
    motherOccupationController.clear();
    brotherNameController.clear();
    sisterNameController.clear();
    brotherOccupationController.clear();
    sisterOccupationController.clear();
    fatherIncomeController.clear();
    motherIncomeController.clear();
    otherIncomeController.clear();
    fatherOccDescController.clear();
    motherOccDescController.clear();
    fourwheelerController.clear();
    fourWheelerDescController.clear();
    twowheelerController.clear();
    twoWheelerDescController.clear();
    houseController.clear();
    plotAreaController.clear();
    constructedAreaController.clear();
    schoolFeeController.clear();
    schoolNameController.clear();
    collegeFeeController.clear();
    collegeNameController.clear();
    loanAmountController.clear();
    bankNameController.clear();
  }

  _launchChrome(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      final bool opened = await launchUrl(
        Uri.parse(url),
        // Disabling WebView on Android
        // Optional, enable JS in the opened browser
      );
      if (!opened) {
        // Handle cases where Chrome cannot open the link
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open link in Chrome.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Apply For Awards'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _launchChrome('https://www.google.com/');
                      },
                      icon: Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Form A",
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 133, 194),
                        fixedSize: const Size(90, 20),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _launchChrome('https://www.google.com/');
                      },
                      icon: Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Form B",
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 133, 194),
                        fixedSize: const Size(90, 20),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _launchChrome('https://www.google.com/');
                      },
                      icon: Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Form C",
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 133, 194),
                        fixedSize: const Size(90, 20),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: fatherOccupationController,
                  decoration: InputDecoration(labelText: 'Father Occupation'),
                ),
                TextField(
                  controller: fatherOccDescController,
                  decoration: InputDecoration(
                      labelText: 'Father Occupation Description'),
                ),
                TextField(
                  controller: motherOccupationController,
                  decoration: InputDecoration(labelText: 'Mother Occupation'),
                ),
                TextField(
                  controller: motherOccDescController,
                  decoration: InputDecoration(
                      labelText: 'Mother Occupation Description'),
                ),
                TextField(
                  controller: brotherNameController,
                  decoration: InputDecoration(labelText: 'Brother Name'),
                ),
                TextField(
                  controller: sisterNameController,
                  decoration: InputDecoration(labelText: 'Sister Name'),
                ),
                TextField(
                  controller: brotherOccupationController,
                  decoration: InputDecoration(labelText: 'Brother Occupation'),
                ),
                TextField(
                  controller: sisterOccupationController,
                  decoration: InputDecoration(labelText: 'Sister Occupation'),
                ),
                TextField(
                  controller: fatherIncomeController,
                  decoration: InputDecoration(labelText: 'Father Income'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: fatherIncomeController,
                  decoration: InputDecoration(labelText: 'Father Income'),
                ),
                TextField(
                  controller: motherIncomeController,
                  decoration: InputDecoration(labelText: 'Mother Income'),
                ),
                TextField(
                  controller: otherIncomeController,
                  decoration: InputDecoration(labelText: 'Other Income'),
                ),
                TextField(
                  controller: fourwheelerController,
                  decoration: InputDecoration(labelText: 'Total FourWheelers:'),
                ),
                TextField(
                  controller: fourWheelerDescController,
                  decoration:
                      InputDecoration(labelText: ' FourWheelers Description:'),
                ),
                TextField(
                  controller: twowheelerController,
                  decoration: InputDecoration(labelText: 'Total TwoWheelers:'),
                ),
                TextField(
                  controller: twoWheelerDescController,
                  decoration:
                      InputDecoration(labelText: ' TwoWheelers Description:'),
                ),
                TextField(
                  controller: houseController,
                  decoration: InputDecoration(labelText: 'Total Houses:'),
                ),
                TextField(
                  controller: plotAreaController,
                  decoration: InputDecoration(labelText: 'Plot Area:'),
                ),
                TextField(
                  controller: constructedAreaController,
                  decoration: InputDecoration(labelText: 'Constructed Area:'),
                ),
                TextField(
                  controller: schoolFeeController,
                  decoration: InputDecoration(labelText: 'School Fees:'),
                ),
                TextField(
                  controller: schoolNameController,
                  decoration: InputDecoration(labelText: 'School Name'),
                ),
                TextField(
                  controller: collegeFeeController,
                  decoration: InputDecoration(labelText: 'College Fees:'),
                ),
                TextField(
                  controller: collegeNameController,
                  decoration: InputDecoration(labelText: 'College Name'),
                ),
                TextField(
                  controller: loanAmountController,
                  decoration: InputDecoration(labelText: 'Loan Amount:'),
                ),
                TextField(
                  controller: bankNameController,
                  decoration: InputDecoration(labelText: 'Bank Name:'),
                ),
                ElevatedButton(
                    onPressed: () {
                      _validateForm();
                      if (_isValid) {
                        postFormData();
                      } else
                        print('type something');
                    },
                    child: Text('Submit')),
              ]),
            )));
  }
}
