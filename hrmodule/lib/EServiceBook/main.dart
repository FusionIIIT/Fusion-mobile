import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';


void main()=>runApp(EServiceApp());

class EServiceApp extends StatelessWidget {
  // const EServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EServiceBook(),
    );
  }
}

class EServiceBook extends StatelessWidget {
  // const EServiceBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Service Book",
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
      body: EServiceBody(),
    );
  }
}

class EServiceBody extends StatelessWidget {
  // const EServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ListView(
      
      children: [
        Container(
          margin: EdgeInsets.all(15),
          child: const Text(
                   'Personal Details',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
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
                   'ID',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '5567',
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
                   'Type',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Staff',
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
                   'Title',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Dr.',
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
                   'Name',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Pankaj Kumar',
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
                   'Email',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'pankaj@iiitdmj.ac.in',
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
                   'Gender',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Male',
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
                   'Date of birth',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   'Feb 9, 1983',
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
                   'Address',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '-----------------------',
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
                   'Phone Number',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ),
                 ),
                 Text(
                   '9999999999',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
      ],
    );
  }
}