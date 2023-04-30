import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/CentralMess/payment_details.dart';

import '../../Components/appBar.dart';
import '../../Components/side_drawer.dart';

class MessRegisteration extends StatelessWidget {
  const MessRegisteration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black,
                      height: 1.5
                      ),
                      children: [
                        TextSpan(
                          text: 'Mess Registeration',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: '\nCurrently registered for no-mess',
                          style: TextStyle(
                            fontSize: 15
                          )
                        ),
                        TextSpan(
                            text: '\n\nMess registeration period has ended.',
                            style: TextStyle(
                                fontSize: 15
                            )
                        )
                      ]
                    ),
                  ),
                )
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentDetails()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      'Payment Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,

                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
