import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';


void main()=>runApp(LtcApp());

class LtcApp extends StatelessWidget {
  // const LtcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LTC(),
    );
  }
}
class LTC extends StatelessWidget {
  // const LTC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "LTC",
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
    
      body: MyTabPage()
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
    _tabController = TabController(length: 4, vsync: this);
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
                Tab(text: 'LTC Info'),
                Tab(text: 'LTC Request'),
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
                    child: LtcInfo(),
                  )
                ),
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(30),
                    child: LtcRequest(),
                  )
                ),
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(15),
                    child: LtcActive(),
                  )
                ),
                SingleChildScrollView(
                  child:  Container(
                    margin:EdgeInsets.all(15),
                    child: LtcArchived(),
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


class LtcInfo extends StatelessWidget {
  // const LtcInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'You are eligible for availing LTC.',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ,fontWeight: FontWeight.bold),
                 ),
                 Text(
                   '2018-2021 LTC Block',
                   style: TextStyle(fontSize: 18.0,color:Colors.black ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Years of Job',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ,fontWeight: FontWeight.bold ),
                 ),
                 Text(
                   '16.69 Years',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   'Total LTC Remaining',
                   style: TextStyle(fontSize: 20.0,color:Colors.black  ,fontWeight: FontWeight.bold),
                 ),
                 Text(
                   '1',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   '"Hometown" LTC Remaining',
                   style: TextStyle(fontSize: 20.0,color:Colors.black ,fontWeight: FontWeight.bold ),
                 ),
                 Text(
                   '0',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                   '"Anywhere in India" LTC Remaining',
                   style: TextStyle(fontSize: 20.0,color:Colors.black  ,fontWeight: FontWeight.bold),
                 ),
                 Text(
                   '1',
                   style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(243, 108, 53, 1) ),
                 ),
            ],
          ),
        ),
        
        // Container(
        //   margin: EdgeInsets.all(15),
        //   child: LtcRequest(),
        // ),
        // Container(
        //   margin: EdgeInsets.all(15.0),
        //   child: LtcActive(),
        // ),
        // Container(
        //   margin: EdgeInsets.all(15.0),
        //   child: LtcArchived(),
        // ),
        
      ],
          ),
        );
  }
}
class LtcRequest extends StatelessWidget {
  // const LtcRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: LtcForm(),
    );
  }
}


class LtcActive extends StatelessWidget {
  // const LtcActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Application id : 12',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(243, 108, 53, 1)),),
              ),
              Text('Status : Requested',style: TextStyle(fontSize: 18),),
              Text('Review Status : under_review by director',style: TextStyle(fontSize: 18),),
              Text('Requested Advance : Rs 10000',style: TextStyle(fontSize: 18),),
              Text('Leave Type : Hometown',style: TextStyle(fontSize: 18),),

              Container(
                margin: EdgeInsets.only(top: 10),

                child: ElevatedButton(onPressed: (() {
                
              }), child: Text('View')),
              )
            ],
          ),
        )
      ],
    );
  }
}

class LtcArchived extends StatelessWidget {
  // const LtcArchived({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Application id : 11',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(243, 108, 53, 1)),),
              ),
              Text('Status : Approved',style: TextStyle(fontSize: 18),),
              Text('Requested Advance : Rs 10000',style: TextStyle(fontSize: 18),),
              Text('Leave Type : Hometown',style: TextStyle(fontSize: 18),),
              Text('Remarks from HR Admin : None ',style: TextStyle(fontSize: 18),),
              Text('Remarks from Director : None ',style: TextStyle(fontSize: 18),),

              Container(
                margin: EdgeInsets.only(top: 10),

                child: ElevatedButton(onPressed: (() {
                
              }), child: Text('View')),
              )
            ],
          ),
        )
      ],
    );
  }
}

class LtcForm extends StatelessWidget {
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
              maxLines: 1,
              minLines: 1,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.phone),
                hintText: 'Enter PF Number*',
                labelText: 'PF Number*',
                border: OutlineInputBorder(),
                focusColor: Color.fromRGBO(243, 108, 53, 1),
                // focusedBorder: Color.fromRGBO(243, 108, 53, 1),

              ),
              
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.phone),
                hintText: 'Enter Basic Pay*',
                labelText: 'Basic Pay*',
                border: OutlineInputBorder(),
                focusColor: Color.fromRGBO(243, 108, 53, 1),
                // focusedBorder: Color.fromRGBO(243, 108, 53, 1),

              ),
              
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: DateTimePicker(
              type: DateTimePickerType.date,
              // initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event,color: Color.fromRGBO(243, 108, 53, 1),),
              dateLabelText: 'Leave Start Date*',
              // onChanged: (val) => setState(() => _selectedDate = val),
              // validator: (val) {
              //   if (val.isEmpty) {
              //     return 'Date is required';
              //   }
              //   return null;
              // },
              // onSaved: (val) => setState(() => _selectedDate = val),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: DateTimePicker(
              type: DateTimePickerType.date,
              // initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event,color: Color.fromRGBO(243, 108, 53, 1),),
              dateLabelText: 'Leave End Date*',
              // onChanged: (val) => setState(() => _selectedDate = val),
              // validator: (val) {
              //   if (val.isEmpty) {
              //     return 'Date is required';
              //   }
              //   return null;
              // },
              // onSaved: (val) => setState(() => _selectedDate = val),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: DateTimePicker(
              type: DateTimePickerType.date,
              // initialValue: 'YYYY/MM/DD',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event,color: Color.fromRGBO(243, 108, 53, 1),),
              dateLabelText: 'Family Departure Date*',
              // onChanged: (val) => setState(() => _selectedDate = val),
              // validator: (val) {
              //   if (val.isEmpty) {
              //     return 'Date is required';
              //   }
              //   return null;
              // },
              // onSaved: (val) => setState(() => _selectedDate = val),
            ),
          ),
          Container(
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.phone),
                hintText: 'Enter Leave Nature*',
                labelText: 'Leave Nature*',
                border: OutlineInputBorder(),
                focusColor: Color.fromRGBO(243, 108, 53, 1),
                // focusedBorder: Color.fromRGBO(243, 108, 53, 1),

              ),
              
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                // icon: const Icon(Icons.phone),
                hintText: 'Enter Purpose*',
                labelText: 'Purpose*',
                border: OutlineInputBorder(),
                focusColor: Color.fromRGBO(243, 108, 53, 1),
                // focusedBorder: Color.fromRGBO(243, 108, 53, 1),

              ),
              
            ),
            margin: EdgeInsets.only(bottom: 10.0),
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