// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:fusion/constants.dart';
import 'package:fusion/services/file_tracking_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/File_Tracking/drafts_page.dart';
import 'package:fusion/screens/File_Tracking/outbox.dart';
import 'package:fusion/screens/File_Tracking/inbox.dart';
import 'package:fusion/models/file_tracking.dart';
import 'package:fusion/api.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
// import 'package:csv/csv.dart';

//use this controller to get what the user has typed
TextEditingController title = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController create_as = TextEditingController();
TextEditingController forward_to = TextEditingController();
TextEditingController recievers_designation = TextEditingController();
TextEditingController remarks = TextEditingController();

class ComposeFile extends StatefulWidget {
  const ComposeFile({Key? key}) : super(key: key);

  @override
  State<ComposeFile> createState() => _ComposeFileState();
}

class _ComposeFileState extends State<ComposeFile> {
  final _composefile = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // child:Row(
                            children: <Widget>[
                              const SizedBox(height: 30),

                              //  Padding(padding:EdgeInsets.all(0)),
                              OutlinedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ComposeFile()));
                                },
                                child: const Text('Compose'),
                              ),

                              OutlinedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DraftPage()));
                                },
                                child: const Text('Drafts'),
                              ),

                              OutlinedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OutboxPage()));
                                },
                                child: const Text('Outbox'),
                              ),
                              OutlinedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InboxPage()));
                                },
                                child: const Text('Inbox'),
                              ),

                              //OutlinedButton(
                              //style: style,
                              //onPressed: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => const MobileScaffold()));
                              //},
                              //child: const Text('Track'),
                              //),
                            ]),
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                // child: SingleChildScrollView(
                                //     scrollDirection: Axis.vertical,
                                //     child: SafeArea(
                                child: Form(
                                  key: _composefile,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),

                                      //title box
                                      Text(
                                        'Title',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 8),
                                      TextField(
                                        controller: title,
                                        decoration: InputDecoration(
                                            hintText: 'Title',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                title.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 15),

                                      //description box
                                      Text(
                                        'Description',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: description,
                                        decoration: InputDecoration(
                                            hintText: 'Description',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                description.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 15),

                                      // create box
                                      Text(
                                        'Create As',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: create_as,
                                        decoration: InputDecoration(
                                            hintText: 'Create As',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                create_as.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 15),

                                      // attach file
                                      Text(
                                        'Attach Files(Maximum Size: 10MB)',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      MaterialButton(
                                        onPressed: () {
                                          //  _pickFile();
                                        },
                                        color: Colors.blue,
                                        child: const Text(
                                          'Choose File',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      // remarks
                                      Text(
                                        'Remarks',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: remarks,
                                        decoration: InputDecoration(
                                            hintText: 'Remarks',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                remarks.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 15),

                                      //forward to
                                      Text(
                                        'Forward To',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: forward_to,
                                        decoration: InputDecoration(
                                            hintText: 'Forward To',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                forward_to.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 15),

                                      //reciever's designation
                                      Text(
                                        'Recievers Designation',
                                        style: TextStyle(fontSize: 17),
                                      ),

                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: recievers_designation,
                                        decoration: InputDecoration(
                                            hintText: 'Recievers Designation',
                                            border: const OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                // clear what's currently in the text box
                                                recievers_designation.clear();
                                              },
                                              icon: Icon(Icons.clear),
                                            )),
                                      ),

                                      const SizedBox(height: 20),

                                      //send
                                      Row(children: <Widget>[
                                        MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            child: Text(
                                              "Save To draft",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              115, 0, 0, 0),
                                          child: MaterialButton(
                                            onPressed: () {},
                                            color: Colors.green,
                                            child: const Text(
                                              'Send',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                )))
                      ]),
                ))));
  }
}
