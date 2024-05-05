import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';

import 'package:fusion/screens/RSPC/request_pen.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


class Dean_rspc extends StatefulWidget {
  const Dean_rspc({Key? key}) : super(key: key);

  @override
  State<Dean_rspc> createState() => _Dean_rspcState();
}

class _Dean_rspcState extends State<Dean_rspc> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
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
        body: ListView(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/mypic.jpg',
                  width: 150.0,
                  height: 150.0,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Dean RSPC",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
           SizedBox(
            height:40,
          ),
           Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            width: 30,
            child: ElevatedButton(
                  onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  Pending_request()));
                  },
                  child: Text(
                    'View Pending request',
                    style: TextStyle( color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 81, 152, 210)
                  ),
                ),
          ),
        ),


        ]));
  }
}
