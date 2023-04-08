import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitEventReport extends StatefulWidget {
  @override
  _SubmitEventReportState createState() => _SubmitEventReportState();
}

class _SubmitEventReportState extends State<SubmitEventReport>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else {
      print("Error");
    }
  }

  String? formvalidate(value) {
    //form validate function
    if (value.isEmpty) {
      return "Error";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO : Create Drop Down For Club Selection, Automatic Form Filling
    //final GymkhanaData data = ModalRoute.of(context)!.settings.arguments as GymkhanaData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Submit Event Report',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                "Event Form",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              )),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              border: new Border.all(
                                color: Colors.deepOrange,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 2.0,
                                )
                              ],
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Event Name",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Student Incharge",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          validator: formvalidate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: validate,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Upload Report File",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(4)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.deepOrange;
                                return Colors
                                    .deepOrangeAccent; // Use the component's default.
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Date ",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          validator: formvalidate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Time",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          validator: formvalidate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Detail and Description",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          validator: formvalidate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: validate,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.deepOrange;
                                return Colors
                                    .deepOrangeAccent; // Use the component's default.
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
