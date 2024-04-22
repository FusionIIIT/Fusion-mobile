import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:intl/intl.dart';
import 'package:fusion/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class InviteApplications extends StatefulWidget {
  const InviteApplications({super.key});

  @override
  State<InviteApplications> createState() => _InviteApplicationsState();
}

class _InviteApplicationsState extends State<InviteApplications> {
  int currentIndex = 0;
  final List<String> buttonText = [
    ' Invite Applications',
    ' Update Applications',
  ];
  // List of pages
  final List<Widget> pages = [
    InvitedApplications(),
    UpdateApplications(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  pages.length,
                  (index) => Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0.0,
                            ),
                            child: Text(
                              buttonText[index],
                              style: TextStyle(
                                color: currentIndex == index
                                    ? Color.fromRGBO(249, 89, 53, 1)
                                    : Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            height: 2,
                            color: currentIndex == index
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                          )
                        ],
                      )),
                ),
              ),
            ),
            pages[currentIndex],
          ],
        ),
      ),
    );
  }
}

class InvitedApplications extends StatefulWidget {
  const InvitedApplications({super.key});

  @override
  State<InvitedApplications> createState() => _InvitedApplicationsState();
}

class _InvitedApplicationsState extends State<InvitedApplications> {
  void initState() {
    super.initState();
  }

  void getapplication() async {
    final String host = kserverLink;
    final String path = "/spacs/convener_view/";
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-mobile-env': 'true',
      'Accept': "application/json",
    };
    Map<String, dynamic> requestBody = {
      'Submit': 'true',
      'programme': programme,
      'batch': batch,
      'From': startdate,
      'To': enddate,
      'remarks': 'MCM is available.',
      'type': award
    };
    // Create URI with the encoded award_name parameter and query parameters
    Uri uri = Uri.http(host, path);
    var client = http.Client();
    try {
      var response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Successful response
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }

  late String award;
  late String batch;
  late String programme;
  late String startdate;
  late String enddate;
  final List<String> programmeItems = ['B.Tech', 'B.Des', 'M.Tech'];
  final List<String> BatchItems = ['2023', '2022', '2021', '2020', 'All'];
  final List<String> scholarshipsorAwardItems = [
    'Merit-cum-Means Scholarship',
    "Director's Gold Medal",
    "Director's Silver Medal"
  ];
  void handlestartdateSelection(String value){
    setState(() {
      startdate=value;
    });
  }
    void handleenddateSelection(String value){
    setState(() {
      enddate=value;
    });
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownMenu(label: 'Programme:', items: programmeItems,onChanged:handleProgrammeSelection),
              DropdownMenu(label: 'Batch:', items: BatchItems,onChanged:handlebatchSelection),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownMenu(
                  label: 'Scholarship/Award:', items: scholarshipsorAwardItems,onChanged:handleawardSelection),
            ],
          ),
          Row(
            children: [
              Expanded(child: DatePicker(label: 'Starting Date',onDateSelected:handlestartdateSelection ,)),
              Expanded(
                  child: DatePicker(
                label: 'Ending Date',
                onDateSelected:handleenddateSelection ,
              ))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    getapplication();
                    print('Submit Button Pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    // backgroundColor: Color.fromRGBO(249, 89, 53, 1),
                    elevation: 0.0,
                  ),
                  child: Text('Invite Applications'))
            ],
          ),

          //
        ],
      ),
    );
  }
}

class UpdateApplications extends StatefulWidget {
  const UpdateApplications({super.key});

  @override
  State<UpdateApplications> createState() => _UpdateApplicationsState();
}

class _UpdateApplicationsState extends State<UpdateApplications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('invited')],
    );
  }
}

class DropdownMenu extends StatefulWidget {
  final String label;
  final List<String> items;
final void Function(String?) onChanged;
  DropdownMenu({required this.label, required this.items,required this.onChanged});

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
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
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.0),
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

class DatePicker extends StatefulWidget {
  final String label;
   final void Function(String selectedDate) onDateSelected;
  const DatePicker({required this.label,required this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.width / 3,
        child: Center(
            child: TextField(
          controller: dateInput,

          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: widget.label, //label text of field
          ),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              //formatted date output using intl package =>  2021-03-16
              setState(() {
                dateInput.text =
                    formattedDate; //set output date to TextField value.
              });
              widget.onDateSelected(formattedDate);
            } else {}
          },
        )));
  }
}
