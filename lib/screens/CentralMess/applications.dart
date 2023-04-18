import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomElevatedButton.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/CentralMess/application_status.dart';

import '../../Components/side_drawer.dart';

class MessApplication extends StatelessWidget {
  const MessApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Leave application',
              ),
              Tab(
                text: 'Food Requests',
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: RequestForm(
                val: 'Request for Leave',
                isFood: false,
              ),
            ),
            Center(
              child: RequestForm(
                val: 'Request for Special Food',
                isFood: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestForm extends StatelessWidget {
  const RequestForm({Key? key, required this.val, required this.isFood})
      : super(key: key);
  final String val;
  final bool isFood;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            val,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Mess :',
            style: TextStyle(fontSize: 15, height: 2),
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From :',
                      style: TextStyle(fontSize: 15, height: 2),
                    ),
                    myTextfield(),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To :',
                      style: TextStyle(fontSize: 15, height: 2),
                    ),
                    myTextfield(),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          isFood
              ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purpose :',
                        style: TextStyle(fontSize: 15, height: 2),
                      ),
                      myTextfield(),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
              onPressed: () {}, text: 'Submit', isFilled: true),
          SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Status()),
                );
              },
              text: 'Status',
              isFilled: true),
        ],
      ),
    );
  }
}

class myTextfield extends StatelessWidget {
  const myTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
