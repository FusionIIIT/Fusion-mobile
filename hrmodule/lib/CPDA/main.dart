import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';


void main()=>runApp(CpdaApp());


class CpdaApp extends StatelessWidget {
  // const CpdaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CPDA(),
    );
  }
}

class CPDA extends StatelessWidget {
  // const CPDA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "CPDA",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => runApp(App()),
        ),
        actions: <Widget>[
          Icon(
            Icons.settings,
            color: Colors.white,
            size: 35.0,
          )
        ],
      ),
      body: ListView(scrollDirection: Axis.vertical,
      children: [
        CpdaBody()
      ],),
    );
  }
}

class CpdaBody extends StatelessWidget {
  // const CpdaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                child: TabBar(
                  indicatorColor: Color.fromARGB(255, 0, 128, 128),
                  labelColor: Color.fromARGB(255, 0, 128, 128),
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'CPDA\nRequest'),
                    Tab(text: 'Active'),
                    Tab(text: 'Archived'),
                    // Tab(text: 'Tab 4'),
                  ],
                ),
              ),
              Container(
                height: 700, //height of TabBarView
                // decoration: BoxDecoration(
                //   border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                // ),
                child: TabBarView(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                      children: [
                        Container(
                          child: Text(
                            "Block",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text("2022-24"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Total Advance Availed:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Rs 0"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Advance Limit:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Rs 3 Lakh per 3 year block"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "Max Eligible Amount:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            padding: EdgeInsets.all(5),
                            child: Text("300000"),
                          ),
                        )
                      ],
                    ),
                          Container(
                    // padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: CpdaForm(),
                    ),
                  ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('No Active CPDA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('No Archive Available', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ])
              )
            ]),
            )
          ]),
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
              // scrollPadding: EdgeInsets.all(10.0),
              // readOnly: true,
              initialValue: "1234",
              style: TextStyle(color: Colors.grey),
              enabled: false,
              decoration: const InputDecoration(
                labelText: "PF Number",
                border: OutlineInputBorder(),
                focusColor: Color.fromARGB(255, 0, 128, 128)
              ),
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
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
                focusColor: Color.fromARGB(255, 0, 128, 128),
                // focusedBorder: Color.fromARGB(255, 0, 128, 128),

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
                                      Color.fromARGB(255, 0, 128, 128)))),
          )
         
        ],
      ),
    );
  }
}

