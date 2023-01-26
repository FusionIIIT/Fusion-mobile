 import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Academic/Branch_Change/branch_change.dart';

class Project extends StatefulWidget {
  @override
  State<Project> createState() => _ProjectState();
}



class _ProjectState extends State<Project> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = '';
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //NAME OF USER
                  'Sree Shanthi Bhasuthkar',
                  // data.details!['current_user']['first_name'] +
                  //     ' ' +
                  //     data.details!['current_user']['last_name'],
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CSE',
                  // data.details!['user_branch'] + ' | ' + "STUDENT",
                  // style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),

         Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shadowColor: Colors.black,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             InkWell(
              child: myContainer('Create project requisition:'),
             ),
                 SizedBox(
                 
width: 10.0,
             ),
             Row(
              
              children:[
   ElevatedButton(onPressed: (){

             }, child: const Text('Fill Page 1')),
             SizedBox(
width: 10.0,
             ),
 ElevatedButton(onPressed: (){

             }, child: const Text('Fill Page 2')),
                 SizedBox(
width: 10.0,
             ),
             ElevatedButton(onPressed: (){

             }, child: const Text('Fill Page 3')),
               ], ),
              ],
            ),
         ),

        ],
      ),
    );
  }
}