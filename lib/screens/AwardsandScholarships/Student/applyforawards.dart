import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/apply_for_convocationmedal.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/apply_for_mcm.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/convocation_medal_form.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/mcm_form.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/view_application_status.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/application_data_provider.dart';
import 'package:provider/provider.dart';

class ApplyForAwards extends StatefulWidget {
  const ApplyForAwards({Key? key}) : super(key: key);

  @override
  State<ApplyForAwards> createState() => _ApplyForAwardsState();
}

class _ApplyForAwardsState extends State<ApplyForAwards> {
  int currentIndex = 0;
  final List<String> buttonText = [
    ' MCM',
    ' Application Status',
    ' Convocation Medal',
  ];
  // List of pages
  final List<Widget> pages = [
    ApplyForMcm(),
    ViewApplicationStatus(),
    ApplyforConvocation(),
  ];

  @override
  Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: DefaultAppBar().buildAppBar(),
//         body: Column(
//           children: [

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: List.generate(
//                   pages.length,

//                   (index) => Padding(
//                       padding: const EdgeInsets.all(1.0),
//                       child: Column(
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 (currentIndex==1)?  Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return ViewApplicationStatus();
//                       })):currentIndex = index;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               elevation: 0.0,
//                             ),
//                             child: Text(
//                               buttonText[index],
//                               style: TextStyle(
//                                 color: currentIndex == index
//                                     ? Color.fromRGBO(249, 89, 53, 1)
//                                     : Colors.black,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                       Container(
//                         width: 140,
//                           height: 2,
//                          color: currentIndex==index? Colors.deepOrangeAccent:Colors.white,
// )
//                         ],
//                       )),
//                 ),
//               ),
//             ),
//            pages[currentIndex]

//           ],
//         ),
//       ),
//     );
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('Apply For Awards'),backgroundColor: Colors.deepOrangeAccent,),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
           
            children: [
              SizedBox(height: 60,),
             
                SizedBox(
                  width: 300,height: 40,
                  child: ElevatedButton(
                                  onPressed: () {
                                  
                                       Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return McmForm();
                            })
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    elevation: 0.0,
                                  ),
                                  child: Text(
                                  'Apply For MCM',
                                    style: TextStyle(
                                      color:
                                           Colors.white,
                                         
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                ), SizedBox(height: 20,),
                                SizedBox(width: 300,height: 40,
                                  child: ElevatedButton(
                                  onPressed: () {
                                  
                                       Navigator.of(context)
                                                              .push(MaterialPageRoute(builder: (context) {
                                                            return ConvocationMedalForm();
                                                          })
                                    );
                               
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    elevation: 0.0,
                                  ),
                                  child: Text(
                                  'Apply For Convocation Medal',
                                    style: TextStyle(
                                      color:
                                           Colors.white,
                                         
                                      fontSize: 18,
                                    ),
                                  ),
                                                              ),
                                ), SizedBox(height: 20,),
                                SizedBox(width: 300,height: 40,
                                  child: ElevatedButton(
                                  onPressed: () {
                                  
                                       Navigator.of(context)
                                                              .push(MaterialPageRoute(builder: (context) {
                                                            return ViewApplicationStatus();
                                                          })
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    elevation: 0.0,
                                    
                                  ),
                                  child: Text(
                                  'Application Status',
                                    style: TextStyle(
                                      color:
                                           Colors.white,
                                         
                                      fontSize: 18,
                                    ),
                                  ),
                                                              ),
                                ),
            ],
          ),
        ],
      ),
       ),
    );
  }
}
