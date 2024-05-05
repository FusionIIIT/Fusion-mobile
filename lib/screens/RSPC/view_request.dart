import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';

import 'package:fusion/screens/RSPC/show_project.dart';
import 'package:fusion/screens/RSPC/view_staff.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


class View_request extends StatefulWidget {
  const View_request({Key? key}) : super(key: key);

  @override
  State<View_request> createState() => _View_requestState();
}

class _View_requestState extends State<View_request> {
   var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Make the HTTP request
    final String response = await rootBundle.loadString('assets/db.json');

    Map<String, dynamic> data = json.decode(response);

    print("ho gaya fetch");
    List<dynamic> user = data['user'];

    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Research Module",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      body: Container( // Wrap with a Container and provide a finite height
        height: MediaQuery.of(context).size.height, // or any specific height you want
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/mypic.jpg',
                    width: 150.0,
                    height: 150.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Rspc_admin",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    border: Border.all(color: Color.fromARGB(255, 179, 128, 51)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Requests',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container( // Wrap ListView.builder with a Container and provide a finite height
              height: MediaQuery.of(context).size.height * 0.6, // or any specific height you want
              child: Expanded(
                child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    var user = userData[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(
                                    'Project Name: ${user['Project Name']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                // SizedBox(width: 124),
                                // ElevatedButton(
                                //   onPressed: () {},
                                //   child: Text('View', style: TextStyle(color: Colors.white)),
                                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                // ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  Show_project(index: userData[index]['Project Name'])));
                                  },
                                  child: Text('View', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                                ),
                                SizedBox(width: 90),
                                ElevatedButton(
                                  onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  View_staff(index: userData[index]['Project Name'])));
                                  },
                                  child: Text('View Staff', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
