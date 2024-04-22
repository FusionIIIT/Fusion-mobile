import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/RSPC/request_pen.dart';

class Dean_rspc extends StatelessWidget {
  const Dean_rspc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
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
