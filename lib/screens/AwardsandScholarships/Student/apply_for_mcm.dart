import 'package:flutter/material.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/mcm_form.dart';

class ApplyForMcm extends StatefulWidget {
  const ApplyForMcm({super.key});
 
  @override
  State<ApplyForMcm> createState() => _ApplyForMcmState();
}

class _ApplyForMcmState extends State<ApplyForMcm> {

   String available = 'yes';
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      
    children: [
     SizedBox(
      height: 30,
     ),
      available=='yes'?GestureDetector(onTap:(){
             Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return McmForm();
                      }));
      },
      child: Text('Fill MCM Form',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30),)):Text('Currently MCM is not Available',style: TextStyle(fontSize: 30),)
      
    ]);
  }
}
