import 'package:flutter/material.dart';

import '../../../models/income_model.dart';

class CustomHistoryCard extends StatelessWidget {
  final IncomeModel incomeModel;

  CustomHistoryCard({Key? key,
  required this.incomeModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,top: 10,right: 5),
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
              Text('Purpose : ${incomeModel.purpose}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              Text("Date added: ${incomeModel.date}",style: TextStyle(fontSize:14,color: Colors.black54)),
              SizedBox(height: 5,),
              Text("Date added: ${incomeModel.amount}",style: TextStyle(fontSize:14,color: Colors.black54)),
              SizedBox(height: 5,),
              Text("Date added: ${incomeModel.remark}",style: TextStyle(fontSize:14,color: Colors.black54)),
              SizedBox(height: 10,),
              // ElevatedButton(onPressed: (){},
              //     child: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
              //     ),
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.orange),
              // ),
              // ),
              Divider(height: 2,thickness: 1.2,)
            ],
          ),
        )
      ),
    );
  }
}
