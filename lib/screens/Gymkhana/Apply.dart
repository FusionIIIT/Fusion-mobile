// @dart=2.9


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apply extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Applyy(),
    );

  }
}
class Applyy extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();  //Global key
  void validate(){
    if(formkey.currentState.validate()){
      print("ok");
    }else{
      print("Error");
    }
  }
  String formvalidate(value){            //form validate function
    if(value.isEmpty){
      return "Error";
    }else{
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Apply',
        style: TextStyle(fontSize: 25),)
      ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              key: formkey,
             child: ListView(

               children: <Widget>[Padding(
                 padding: EdgeInsets.all(5.0),
                 child: Center(
                   child:Container(
                     color: Colors.grey[300],
                     padding:EdgeInsets.all(5.0),
                     child: Text("Club Membership Form",
                       style: TextStyle(fontSize: 25.0)),
                   ),  ),
               ),

                 SizedBox(height: 30,),
                 TextFormField(
                   decoration: InputDecoration(
                   labelText: "Name",
                   border: OutlineInputBorder()),
                   // ignore: missing_return
                   validator: formvalidate,
                 ),
              Padding(
                padding: EdgeInsets.only(
                    top: 20.0
                ),
                 child :  TextFormField(
                   decoration: InputDecoration(
                       labelText: "Email",
                       border: OutlineInputBorder()),
                   // ignore: missing_return
                   validator: formvalidate,
                 ),
              ),
                 Padding( padding: EdgeInsets.only(
                     top: 20.0
                 ),
                   child :  TextFormField(
                     decoration: InputDecoration(
                         labelText: "Club",
                         border: OutlineInputBorder()),
                     // ignore: missing_return
                     validator: formvalidate,

                   ),),
                  Padding( padding: EdgeInsets.only(
                       top: 20.0),
                    child :  TextFormField( maxLength: 3,
                           decoration: InputDecoration(
                             labelText: "Achievments",
                          border: OutlineInputBorder()),
                                                         // ignore: missing_return
                          validator: formvalidate,
                  ),),
                 Padding(
                   padding: EdgeInsets.all(25.0),
                   child: ElevatedButton
                     (onPressed:  validate,
                   child: Text("submit"))
                 )
               ],

              )
            )
          )
        )
    );
  }
}
