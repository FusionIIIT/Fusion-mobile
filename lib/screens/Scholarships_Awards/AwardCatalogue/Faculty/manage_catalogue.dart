import 'package:flutter/material.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class ManageCatalogue extends StatefulWidget {
  @override
  _ManageCatalogueState createState() => _ManageCatalogueState();
}

class _ManageCatalogueState extends State<ManageCatalogue> {
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
                  "Manage Award Scholarship Catalogue",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            new Container(
              alignment: Alignment.center,
              child: Column(children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        "Directors Gold Medal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10),
            new Container(
              alignment: Alignment.center,
              child: Column(children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14)),
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(255, 220, 202, 176))),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        "Directors Silver Medal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10),
            new Container(
              alignment: Alignment.center,
              child: Column(children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14)),
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(255, 220, 202, 176))),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        "Notional Prizes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10),
            new Container(
              alignment: Alignment.center,
              child: Column(children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14)),
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(255, 220, 202, 176))),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        "MCM Scholarship",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10),
            new Container(
              alignment: Alignment.center,
              child: Column(children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14)),
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(255, 220, 202, 176))),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        "D&M Proficiency Gold Medal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
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
