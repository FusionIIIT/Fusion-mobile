import 'package:flutter/material.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';


class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? programme_type;
  List complaintTypeItem = [
    "Directors Gold Medal",
    "Directors Silver Medal",
    'Notional Prizes',
    'MCM Scholarship',
    'D&M Proficiency Gold Medal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Catalogue",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text('Select Scholarship/Award'),
                  dropdownColor: Colors.grey[200],
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (newValue) {
                    setState(() {
                      programme_type = newValue.toString();
                    });
                    print(programme_type);
                  },
                  value: programme_type,
                  items: complaintTypeItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onPressed: () {
                // Respond to button press
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red))),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepOrange;
                    return Colors
                        .deepOrangeAccent; // Use the component's default.
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1,
                color: Colors.black54,
              ),
            ),
            
            Text(
              "Director's Gold Medal:",
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "4.2 DirectorΓÇÖs Gold Medals 4.2.1 DirectorΓÇÖs Gold Medals (DGMs), to be presented at the Institute Convocation every year, shall be awarded for the best all round performance from among the graduating",
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ]),
        ),
      ),
    );
  }
}
