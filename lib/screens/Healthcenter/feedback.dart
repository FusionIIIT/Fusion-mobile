import 'package:flutter/material.dart';
import 'package:fusion/services/health_service.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  String feedback = '', date = '';

  @override
  Widget feed = Container(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        TextFormField(
          maxLines: 8,
          cursorHeight: 30,
          decoration: new InputDecoration(
            labelText: "Feedback",
            fillColor: Colors.white,
            border: new OutlineInputBorder(),
            //fillColor: Colors.green
          ),
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
        Center(
          child: SizedBox(
            width: 100,
            height: 40,
            child: TextButton(
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20),
              ),

              // try something new

              onPressed: () async {
                HeathService auth = HeathService();
                bool lodge = await auth.postFeedback(
                  // user_id,
                  feedback,
                );
                print(lodge);

                // TextInput.finishAutofillContext();
                if (lodge == true) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Success"),
                      content: Text("Ambulance Request Added Successfully"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("okay"),
                        ),
                      ],
                    ),
                  );
                } else {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Failed"),
                      content: Text("Cannot add Ambulance Request"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("okay"),
                        ),
                      ],
                    ),
                  );
                }
              },

              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.red),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.red),
                )),
              ),
            ),
          ),
        )
      ],
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Health Center"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 1, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color: Colors.deepOrangeAccent,
                          child: TabBar(
                            labelColor: Colors.deepOrange,
                            indicatorColor: Colors.deepOrangeAccent,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Feedback Form",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 520, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              feed,
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
