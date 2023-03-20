import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/finance_service.dart';

import '../../models/finance_bank.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({Key? key}) : super(key: key);

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  TextEditingController _accountController=TextEditingController();
  TextEditingController _ifscController=TextEditingController();
  TextEditingController _bankNameController=TextEditingController();
  TextEditingController _branchNameController=TextEditingController();
  late Bank bankDetail;
  final _formKey = GlobalKey<FormState>();

  saveToDatabase(Bank bank) async{
   var status= await FinanceService().addBankDetails(bank);
   return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children:[ Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  // month
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Account No.",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _accountController,
                    validator: (value){
                      if(value?.length==0){
                        return "Please give your account number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Bank Name
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("Bank Name",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _bankNameController,
                    validator: (value){
                      if(value?.length==0){
                        return "Please give your bank name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // IFSC
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("IFSC",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _ifscController,
                    validator: (value){
                      if(value?.length==0){
                        return "Please give your ifsc code";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Branch Name
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("Branch Name",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _branchNameController,
                    validator: (value){
                      if(value?.length==0){
                        return "Please give your branch name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // submit button
                  Center(
                      child:SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 1,color: Colors.white,),
                            backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          onPressed: ()async{
                            final isValid=_formKey.currentState?.validate();
                            if(isValid!=null){
                              bankDetail=Bank(accountNumber: _accountController.text, bankName: _bankNameController.text, branchName: _branchNameController.text  , ifscCode: _ifscController.text);
                              var status= await saveToDatabase(bankDetail);
                              print(status);
                            }
                          },
                          child: Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      )
                  )
                ,
                ],
               ),
            ),
           ),
          ],
        ),
      ),
    );
  }
}
