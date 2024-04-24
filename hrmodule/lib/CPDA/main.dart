// import 'package:flutter/material.dart';
// import 'package:hrmodule/main.dart';
import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';

// void main()=>runApp(CpdaApp());


// class CpdaApp extends StatelessWidget {
//   // const CpdaApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CPDA(),
//     );
//   }
// }

// class CPDA extends StatelessWidget {
//   // const CPDA({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(
//           "CPDA",
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Color.fromRGBO(243, 108, 53, 1),
//         leading: BackButton(
//           color: Colors.black,
//           onPressed: () => runApp(App()),
//         ),
//         // actions: <Widget>[
//         //   Icon(
//         //     Icons.settings,
//         //     color: Colors.white,
//         //     size: 35.0,
//         //   )
//         // ],
//       ),
//       body: ListView(scrollDirection: Axis.vertical,
//       children: [
//         CpdaBody()
//       ],),
//     );
//   }
// }

// // class CpdaBody extends StatelessWidget {
// //   // const CpdaBody({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Container(
// //           margin: EdgeInsets.all(10),
// //           child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             Expanded(child: ElevatedButton(onPressed: ()=>runApp(CpdaRequest()), child: Text('CPDA Request',style: TextStyle(color:Color.fromRGBO(243, 108, 53, 1)),), style: ButtonStyle(
// //                       backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
// //                       shadowColor: null,
                      
// //                      ),),),
// //             Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Active',style: TextStyle(color:Color.fromRGBO(243, 108, 53, 1))), style: ButtonStyle(
// //                       backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
// //                       shadowColor: null,
                      
// //                      ),),),
// //             Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Archived',style: TextStyle(color:Color.fromRGBO(243, 108, 53, 1)),), style: ButtonStyle(
// //                       backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
// //                       shadowColor: null,
                      
// //                      ),),)
// //           ],
// //         ),
// //         )
// //       ],
// //     );
// //   }
// // }

// class CpdaRequest extends StatelessWidget {
//   // const CpdaRequest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.all(15),
//           padding: EdgeInsets.all(0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                    'ID',
//                    style: TextStyle(fontSize: 20.0,color:Colors.black ),
//                  ),
//                  Text(
//                    '5567',
//                    style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
//                  ),
//             ],
//           ),
//         ),
//       ],
//     );
      
      
//   }
// }
// // class CpdaBody extends StatelessWidget {
// //   // const CpdaBody({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.all(10.0),
// //       child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             DefaultTabController(
// //             length: 3, // length of tabs
// //             initialIndex: 0,
// //             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
// //               Container(
// //                 child: TabBar(
// //                   indicatorColor: Color.fromRGBO(243, 108, 53, 1),
// //                   labelColor: Color.fromRGBO(243, 108, 53, 1),
// //                   unselectedLabelColor: Colors.black,
// //                   tabs: [
// //                     Tab(text: 'CPDA\nRequest'),
// //                     Tab(text: 'Active'),
// //                     Tab(text: 'Archived'),
// //                     // Tab(text: 'Tab 4'),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 height: 700, //height of TabBarView
// //                 // decoration: BoxDecoration(
// //                 //   border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
// //                 // ),
// //                 child: TabBarView(children: <Widget>[
// //                   Container(
// //                     padding: EdgeInsets.all(10.0),
// //                     margin: EdgeInsets.only(top: 10.0),
// //                     child: Center(
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                       children: [
// //                         Container(
// //                           child: Text(
// //                             "Block",
// //                             style: TextStyle(fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Container(
// //                             padding: EdgeInsets.all(5),
// //                             child: Text("2022-24",style: TextStyle(color: Color.fromRGBO(243, 108, 53, 1)),),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                     Row(
// //                       children: [
// //                         Container(
// //                           child: Text(
// //                             "Total Advance Availed:",
// //                             style: TextStyle(fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Container(
// //                             padding: EdgeInsets.all(5),
// //                             child: Text("Rs 0",style: TextStyle(color: Color.fromRGBO(243, 108, 53, 1))),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                     Row(
// //                       children: [
// //                         Container(
// //                           child: Text(
// //                             "Advance Limit:",
// //                             style: TextStyle(fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Container(
// //                             padding: EdgeInsets.all(5),
// //                             child: Text("Rs 3 Lakh per 3 year block",style: TextStyle(color: Color.fromRGBO(243, 108, 53, 1))),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                     Row(
// //                       children: [
// //                         Container(
// //                           margin: EdgeInsets.only(bottom: 15.0),
// //                           child: Text(
// //                             "Max Eligible Amount:",
// //                             style: TextStyle(fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Container(
// //                             margin: EdgeInsets.only(bottom: 15.0),
// //                             padding: EdgeInsets.all(5),
// //                             child: Text("300000",style: TextStyle(color: Color.fromRGBO(243, 108, 53, 1))),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                           Container(
// //                     // padding: EdgeInsets.all(10.0),
// //                     margin: EdgeInsets.only(top: 10.0),
// //                     child: Center(
// //                       child: CpdaForm(),
// //                     ),
// //                   ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   Container(
// //                     child: Center(
// //                       child: Text('No Active CPDA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
// //                     ),
// //                   ),
// //                   Container(
// //                     child: Center(
// //                       child: Text('No Archive Available', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
// //                     ),
// //                   ),
// //                 ])
// //               )
// //             ]),
// //             )
// //           ]),
// //     );
// //   }
// // }






void main()=>runApp(CpdaApp());

class CpdaApp extends StatelessWidget {
  // const CpdaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cpda(),
    );
  }
}

class Cpda extends StatelessWidget {
  // const CpdaBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CPDA",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(243, 108, 53, 1),
        leading: BackButton(
          color: Colors.black,
          onPressed: () => runApp(App()),
        ),
        // actions: <Widget>[
        //   Icon(
        //     Icons.settings,
        //     color: Colors.white,
        //     size: 35.0,
        //   )
        // ],
      ),
      body: MyTabPage(),
    );
  }
}

class MyTabPage extends StatefulWidget {
  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(243, 108, 53, 1),
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  color: Colors.transparent
                  // spreadRadius: 2,
                  // blurRadius: 5,
                  // offset: Offset(0, 3),
                ),
              ],
            ),
            child: TabBar(
              labelColor: Color.fromRGBO(243, 108, 53, 1),
indicatorColor:Color.fromRGBO(243, 108, 53, 1),
              controller: _tabController,
              tabs: [
                Tab(text: 'Cpda Request'),
                Tab(text: 'Active'),
                Tab(text: 'Archived'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(15),
                    child: CpdaRequest(),
                  )
                ),
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(30),
                    child: CpdaActive(),
                  )
                ),
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(15),
                    child: CpdaArchive(),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class CpdaRequest extends StatelessWidget {
  // const CpdaRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Block',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '2022-2024',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Total Advance Availed',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Rs 0',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Advance Limit',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Rs 3 Lakh per 3 year block',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Max Eligible Amount',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '30000',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'PF Number *',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '1234',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: CpdaForm(),
        )
        
      ],
    );
  }
}
class CpdaForm extends StatelessWidget {
  // const CPDA_FORM({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(
            child: TextFormField(
              maxLines: null,
              minLines: 4,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.phone),
                hintText: 'Enter purpose',
                labelText: 'Purpose',
                border: OutlineInputBorder(),
                focusColor: Color.fromRGBO(243, 108, 53, 1),
                // focusedBorder: Color.fromRGBO(243, 108, 53, 1),

              ),
              
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            
            child: TextFormField(
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.calendar_today),
                hintText: 'Enter Advance Requested',
                labelText: 'Advance Requested',
                border: OutlineInputBorder(),
              ),
            ),
            margin: EdgeInsets.only(bottom: 20.0,top: 20.0),
          ),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(value: false, onChanged: ((value) => {})),
              Expanded(child: Text(
              "I hereby declare that I have uploaded & updated all my achievements (including publications, visits, projects etc.) on Institute's website and EIS module."),flex: 1,)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: ElevatedButton(
                              onPressed: () => {},
                              autofocus: true,
                              child: const Text(
                                'Submit Request',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(243, 108, 53, 1)))),
          )
         
        ],
      ),
    );
  }
}
class CpdaActive extends StatelessWidget {
  // const CpdaActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Active CPDA'),
    );
  }
}
class CpdaArchive extends StatelessWidget {
  // const CpdaActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Archive Available'),
    );
  }
}