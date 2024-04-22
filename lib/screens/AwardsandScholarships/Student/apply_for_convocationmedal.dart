import 'package:flutter/material.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/convocation_medal_form.dart';

class ApplyforConvocation extends StatefulWidget {
  const ApplyforConvocation({super.key});

  @override
  State<ApplyforConvocation> createState() => _ApplyforConvocationState();
}

class _ApplyforConvocationState extends State<ApplyforConvocation> {
  String available = 'yes';
  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          
          SizedBox(
            height: 30,
          ),
          available == 'yes'
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ConvocationMedalForm();
                    }));
                  },
                  child: Text(
                    ' Fill Convocation Medal Form ',
                    style:
                        TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
                  ))
              : Text(
                  'Currently MCM is not Available',
                  style: TextStyle(fontSize: 30),
                )
        ]);
  }
}
