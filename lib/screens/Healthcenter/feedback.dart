import 'package:flutter/material.dart';

enum gender {Male, Female}
enum Rating {first,second, third,forth, fifth}
class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}



class _FeedBackState extends State<FeedBack> {
  gender? _genderEnum;
  Rating? _treatment,_waiting,_maintenance;
  @override
  // Widget feed=Container(
  //   padding: EdgeInsets.all(20.0),
  //   child: Column(
  //     children: [
  //       Container(
  //         height: 400,
  //         color: Colors.white,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextFormField(
  //               cursorHeight: 15,
  //               decoration: new InputDecoration(
  //                 labelText: "Name",
  //                 fillColor: Colors.blue,
  //                 border: new OutlineInputBorder(
  //                 ),
  //                 //fillColor: Colors.green
  //               ),
  //               style: new TextStyle(
  //                 fontFamily: "Poppins",
  //               ),
  //             ),
  //             Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
  //             TextFormField(
  //               cursorHeight: 15,
  //               decoration: new InputDecoration(
  //                 labelText: "Name of Doctor",
  //                 fillColor: Colors.blue,
  //                 border: new OutlineInputBorder(
  //                 ),
  //                 //fillColor: Colors.green
  //               ),
  //               style: new TextStyle(
  //                 fontFamily: "Poppins",
  //               ),
  //             ),
  //            Radio(value: null, groupValue: _genderEnum, onChanged: null),
  //             RadioListTile(value: null, groupValue: _genderEnum, onChanged: null)
  //           ],
  //         ),
  //       ),
  //       // TextFormField(
  //       //   maxLines: 8,
  //       //   cursorHeight: 30,
  //       //   decoration: new InputDecoration(
  //       //     labelText: "Feedback",
  //       //     fillColor: Colors.white,
  //       //     border: new OutlineInputBorder(
  //       //     ),
  //       //     //fillColor: Colors.green
  //       //   ),
  //       //   style: new TextStyle(
  //       //     fontFamily: "Poppins",
  //       //   ),
  //       // ),
  //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
  //       Center(child:TextButton(
  //         child: Text('Submit', style: TextStyle(fontSize: 15.0),),
  //         onPressed: () {},
  //       ),
  //       ),
  //     ],
  //   ),
  // );


  Widget build(BuildContext context) {
    int _value=1;
    double iconSize = 40;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Health Center"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 20.0),
          DefaultTabController(
              length: 1, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      //color: Colors.deepOrangeAccent,
                      child: TabBar(
                        labelColor: Colors.deepOrange,
                        indicatorColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text("Feedback Form", style: TextStyle(
                                fontWeight: FontWeight.bold),),),
                        ],
                      ),
                    ),
                    Container(
                        height: 520, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                        child: TabBarView(children: <Widget>[
                        Container(
                        padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  cursorHeight: 5,
                                  decoration: new InputDecoration(
                                    labelText: "Name",
                                    fillColor: Colors.blue,
                                    border: new OutlineInputBorder(
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                                TextFormField(
                                  cursorHeight: 5,
                                  decoration: new InputDecoration(
                                    labelText: "Name of Doctor",
                                    fillColor: Colors.blue,
                                    border: new OutlineInputBorder(
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                                Row(
                                  children: [
                                    Text("Select  Gender : "),
                                    SizedBox(width: 15.0,),
                                    Expanded(
                                      child: RadioListTile<gender>(
                                        contentPadding: EdgeInsets.all(0.0),
                                        value: gender.Male,
                                        dense: true,
                                        tileColor: Colors.deepPurple.shade50,
                                        groupValue: _genderEnum,
                                        title: Text(gender.Male.name),
                                        onChanged: (val){
                                          setState(() {
                                            _genderEnum= val;
                                          });
                                        }),
                                    ),
                                    Expanded(
                                      child: RadioListTile<gender>(
                                          contentPadding: EdgeInsets.all(0.0),
                                          value: gender.Female,
                                          dense: true,
                                          tileColor: Colors.deepPurple.shade50,
                                          groupValue: _genderEnum,
                                          title: Text(gender.Female.name),
                                          onChanged: (val){
                                            setState(() {
                                              _genderEnum= val;
                                            });
                                          }),
                                    )],
                                )

                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          Container(
                            margin: EdgeInsets.all(0.2),
                            width: double.maxFinite,
                            child: Table(
                              border: TableBorder.all(),
                              columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.1), 2: FractionColumnWidth(.1), 3: FractionColumnWidth(.1), 4: FractionColumnWidth(.1), 5: FractionColumnWidth(.1)},
                              children: [
                                TableRow( children: [
                                  Column(children:[
                                    Text('')
                                  ]),
                                  Column(children:[
                                    Text('1')
                                  ]),
                                  Column(children:[
                                    Text('2')
                                  ]),
                                  Column(children:[
                                    Text('3')
                                  ]),
                                  Column(children:[
                                    Text('4')
                                  ]),
                                  Column(children:[
                                    Text('5')
                                  ]),
                                ]),
                                TableRow( children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Doctor's Treatment"),
                                  ),
                                 // Icon(Icons.cake, size: iconSize,),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.first,
                                      dense: true,
                                      groupValue: _treatment,
                                      onChanged: (val){
                                        setState(() {
                                          _treatment= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.second,
                                      dense: true,
                                      groupValue: _treatment,
                                      onChanged: (val){
                                        setState(() {
                                          _treatment= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.third,
                                      dense: true,
                                      groupValue: _treatment,
                                      onChanged: (val){
                                        setState(() {
                                          _treatment= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.forth,
                                      dense: true,
                                      groupValue: _treatment,
                                      onChanged: (val){
                                        setState(() {
                                          _treatment= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.fifth,
                                      dense: true,
                                      groupValue: _treatment,
                                      onChanged: (val){
                                        setState(() {
                                          _treatment= val;
                                        });
                                      }),
                                ]),
                                TableRow( children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Waiting Time"),
                                  ),
                                  // Icon(Icons.cake, size: iconSize,),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.first,
                                      dense: true,
                                      groupValue: _waiting,
                                      onChanged: (val){
                                        setState(() {
                                          _waiting= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.second,
                                      dense: true,
                                      groupValue: _waiting,
                                      onChanged: (val){
                                        setState(() {
                                          _waiting= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.third,
                                      dense: true,
                                      groupValue: _waiting,
                                      onChanged: (val){
                                        setState(() {
                                          _waiting= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.forth,
                                      dense: true,
                                      groupValue: _waiting,
                                      onChanged: (val){
                                        setState(() {
                                          _waiting= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.fifth,
                                      dense: true,
                                      groupValue: _waiting,
                                      onChanged: (val){
                                        setState(() {
                                          _waiting= val;
                                        });
                                      }),
                                ]),
                                TableRow( children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Doctor's Treatment"),
                                  ),
                                  // Icon(Icons.cake, size: iconSize,),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.first,
                                      dense: true,
                                      groupValue: _maintenance,
                                      onChanged: (val){
                                        setState(() {
                                          _maintenance= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.second,
                                      dense: true,
                                      groupValue: _maintenance,
                                      onChanged: (val){
                                        setState(() {
                                          _maintenance= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.third,
                                      dense: true,
                                      groupValue: _maintenance,
                                      onChanged: (val){
                                        setState(() {
                                          _maintenance= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.forth,
                                      dense: true,
                                      groupValue: _maintenance,
                                      onChanged: (val){
                                        setState(() {
                                          _maintenance= val;
                                        });
                                      }),
                                  RadioListTile<Rating>(
                                      contentPadding: EdgeInsets.all(10.0),
                                      value: Rating.fifth,
                                      dense: true,
                                      groupValue: _maintenance,
                                      onChanged: (val){
                                        setState(() {
                                          _maintenance= val;
                                        });
                                      }),
                                ]),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                          Center(child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () { },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  textStyle:
                                  const TextStyle(fontSize: 20)),
                              child: const Text('Submit Form'),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                        ])
                    )
                  ])
          ),
        ]),
      ),
    );
  }
}