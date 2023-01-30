import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = '';
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //NAME OF USER
                  'Sree Shanthi Bhasuthkar',
                  // data.details!['current_user']['first_name'] +
                  //     ' ' +
                  //     data.details!['current_user']['last_name'],
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CSE',
                  // data.details!['user_branch'] + ' | ' + "STUDENT",
                  // style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Project ID',
                          suffixText: '*',
                          suffixStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
