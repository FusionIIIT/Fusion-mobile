import 'dart:convert';
// // import 'dart:html';
// // import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/api.dart';
import 'package:fusion/services/profile_service.dart';

import 'dart:async';

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';

import 'package:http/http.dart' as http;

import 'package:fusion/screens/AwardsandScholarships/Student/previous_winners_listpage.dart';

class PreviousWinners extends StatefulWidget {
  const PreviousWinners({super.key});

  @override
  State<PreviousWinners> createState() => _PreviousWinnersState();
}

class _PreviousWinnersState extends State<PreviousWinners> {
  final List<String> programmeItems = ['B.Tech', 'B.Des', 'M.Tech'];
  final List<String> academicYearItems = ['2016', '2017', '2018', '2019'];
  final List<String> scholarshipsorAwardItems = [
    'MCM Scholarship',
    "Director's Gold Medal",
    "Director's Silver Medal"
  ];
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  var service;
  List<dynamic> displayData = [];
  bool _loading1 = true;

  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
  }

  late String award;
  late String batch;
  late String programme;
  void getApplications() async {
    final String host = kserverLink;
    final String path = "/spacs/student_view/";
    // final String path = "/spacs/getContent/";

    Uri uri = Uri.http(host, path);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-MOBILE-ENV': 'true',
      'Accept': "application/json",
    };

    Map<String, dynamic> requestBody = {
      'PreviousWinnerAward': award,
      'PreviousWinnerAcadYear': batch,
      'PreviousWinnerProgramme': programme,
      'SubmitPreviousWinner': true,
    };

    var client = http.Client();

    var response = await client.post(
      uri,
      headers: headers,
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      // Successful response
      var responseData = jsonDecode(response.body);
      displayData = responseData;
    } else {
      // Handle error response

      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    client.close();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PreviousYearWinnerPage(
        displayData: displayData,
      );
    }));
  }

  void handleProgrammeSelection(String? value) {
    setState(() {
      programme = value ?? '';
    });
  }

  void handleawardSelection(String? value) {
    setState(() {
      award = value ?? '';
    });
  }

  void handlebatchSelection(String? value) {
    setState(() {
      batch = value ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Change this to your desired color
            width: 2.0, // Change this to your desired border width
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.2), // Adjust opacity for shadow intensity
              spreadRadius: 2.0, // Adjusts how far the shadow spreads
              blurRadius: 1.0, // Adjusts how blurry the shadow is
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Previous Winners',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu(
                    label: 'Programme:',
                    items: programmeItems,
                    onChanged: handleProgrammeSelection),
                DropdownMenu(
                  label: 'Academic Year:',
                  items: academicYearItems,
                  onChanged: handlebatchSelection,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu(
                  label: 'Scholarship/Award:',
                  items: scholarshipsorAwardItems,
                  onChanged: handleawardSelection,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      getApplications();
                      print(displayData[0]['id']);
                    },
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      backgroundColor: Color.fromRGBO(249, 89, 53, 1),
                      elevation: 0.0,
                    ),
                    child: Text('Submit'))
              ],
            )
            //
          ],
        ),
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  final String label;
  final List<String> items;
  final void Function(String?) onChanged;
  DropdownMenu(
      {required this.label, required this.items, required this.onChanged});

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14.0),
          DropdownButton<String>(
            hint: Text('Select'),
            value: selectedItem,
            onChanged: widget.onChanged,
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,
                    style: TextStyle(
                      fontSize: 12.0,
                    )),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// class DropdownMenu extends StatelessWidget {
//   final String label;
//   final List<String> items;
//   final void Function(String?)
//       onChanged; // Callback function to handle selection

//   DropdownMenu(
//       {required this.label, required this.items, required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(label),
//         DropdownButton<String>(
//           onChanged: onChanged, // Pass the callback function here
//           items: items.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
