import 'package:flutter/material.dart';

class ExpenseHistroyCard extends StatelessWidget {
  const ExpenseHistroyCard({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 5,top: 10,right:5),
        child: Container(
          // height: MediaQuery.of(context).size.height/5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black54,
                  width: 1.5,
                )
            ),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Roll No: ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 5,),
                  Text("Date added:",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 3,),
                  Text("Name:",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 3,),
                  Text("Purpose:",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 3,),
                  Text("Amount: ",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 3,),
                  Text("Remark: ",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 3,),
                  Text("Status: ",style: TextStyle(fontSize:14,color: Colors.black54)),
                  SizedBox(height: 10,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     // decline
                  //     ElevatedButton(onPressed: (){},
                  //       child: Text("Decline",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                  //       ),
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(Colors.orange),
                  //       ),
                  //     ),
                  //
                  //     // approved
                  //     ElevatedButton(onPressed: (){},
                  //       child: Text("Approved",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                  //       ),
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(Colors.orange),
                  //       ),
                  //     ),
                  //
                  //     // transferred to bank
                  //     ElevatedButton(onPressed: (){},
                  //       child: Text("Transfer to bank",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                  //       ),
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(Colors.orange),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Divider(height: 2,thickness: 1.2,)
                ],
              ),
            )
        ),
      );
    }
  }
