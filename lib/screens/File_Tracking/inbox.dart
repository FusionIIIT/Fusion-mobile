import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/File_Tracking/compose_file.dart';
import 'package:fusion/screens/File_Tracking/outbox.dart';
import 'package:fusion/screens/File_Tracking/drafts_page.dart';

// import 'package:fusion/screens/File_Tracking/drafts_page.dart';

class InboxPage extends StatefulWidget {
  // const DraftPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
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
                                          builder: (context) =>
                                              const ComposeFile()));
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
                                          builder: (context) => OutboxPage()));
                                },
                                child: const Text('Inbox'),
                              ),
                              OutlinedButton(
                                style: style,
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => const MobileScaffold()));
                                },
                                child: const Text('Track'),
                              ),
                            ]),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0,
                                  bottom: 20,
                                  top: 30,
                                  right: 190), //apply padding to all four sides
                              child: Text(
                                'Received Files',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext, int index) =>
                                  Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                child: Card(
                                  elevation: 25.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0)),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                width: 55.0,
                                                height: 55.0,
                                                color: Colors.blue,
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    foregroundColor:
                                                        Colors.blue,
                                                    child: Icon(
                                                      Icons.folder,
                                                      size: 40,
                                                      color: Colors.white,
                                                    ))),
                                            SizedBox(width: 6.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("Subject",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                    )),
                                                const Divider(
                                                  height: 20,
                                                  thickness: 5,
                                                  indent: 20,
                                                  endIndent: 0,
                                                  color: Colors.black,
                                                ),
                                                Text("20BCS056-Student",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // Container(
                                        // alignment:Alignment.center,
                                        // padding:EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
                                        SizedBox(width: 6.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0)),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'View',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ),
                                            // Text(DateFormat('dd/MM/yy').format(DateTime.now())),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ))));
  }
}
