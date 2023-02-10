import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';

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
        LtcBody()
      ],),
    );
  }
}

class LtcBody extends StatelessWidget {
  // const LtcBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // SizedBox(height: 20.0),
            // Text('Tabs Inside Body',
            //     textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
            DefaultTabController(
            length: 1, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10.0),
                child: TabBar(
                  indicatorColor: Color.fromARGB(255, 0, 128, 128),
                  labelColor: Color.fromARGB(255, 0, 128, 128),
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'LTC Info'),
                   
                    // Tab(text: 'Tab 4'),
                  ],
                ),
              ),
              Container(
                height: 600, //height of TabBarView
                // decoration: BoxDecoration(
                //   border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                // ),
                child: TabBarView(children: <Widget>[
                  Container(
                                        child: Center(
                      child: Text('You are not eligible for availing LTC', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  
                ])
              )
            ]),
            )

            //create tabs here
          ]),
    );
  }
}