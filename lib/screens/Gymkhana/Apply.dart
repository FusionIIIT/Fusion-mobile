
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/services/newclubmember.dart';

class Apply extends StatefulWidget {
  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  final GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey2 = GlobalKey<FormState>();

  void validate() {
    if (_controller.index == 0) {
      if (formkey1.currentState!.validate()) {
        String club = clubController.text;
        String rollNo = rollNoController.text;
        String description = descriptionController.text;
        String achievements = achievementsController.text;
        String status = statusController.text;

        NewClubMember().createNewClubMember(
          member: rollNo,
          club: club,
          description: description,
          status: status,
          remarks: achievements,
        );

        print("Form 1 is valid");
      } else {
        print("Form 1 is invalid");
      }
    } else {
      if (formkey2.currentState!.validate()) {
        print("Form 2 is valid");
      } else {
        print("Form 2 is invalid");
      }
    }
  }

  String? formvalidate(value) {
    if (value.isEmpty) {
      return "Error";
    } else {
      return null;
    }
  }

  // Define controller variables
  TextEditingController clubController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController achievementsController = TextEditingController();
  TextEditingController statusController = TextEditingController(text: 'open');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        title: Text(
          'Apply',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 6.0,
          controller: _controller,
          tabs: [
            Tab(text: 'Form'),
            Tab(text: 'New Form'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: Form(
                key: formkey1,
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
                              "Club Membership Form",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            border: Border.all(
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: clubController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Club",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: rollNoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Roll No",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Description",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: achievementsController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Achievements",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: statusController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Status",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        enabled: false, // Disable editing
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.deepOrange;
                              return Colors.deepOrangeAccent;
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
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: Form(
                key: formkey2,
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
                              "New Club Form",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            border: Border.all(
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Club",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Category",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Coordinator",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Co-Cordinator",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Faculty Incharge",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        validator: formvalidate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Details and Description",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.deepOrange;
                              return Colors.deepOrangeAccent;
                            },
                          ),
                        ),
                      ),
                    )
                    // Repeat the pattern for other TextFormFields
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
