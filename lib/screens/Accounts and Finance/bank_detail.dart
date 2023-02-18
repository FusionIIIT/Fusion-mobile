import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

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

  saveToDatabase(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
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
                          onPressed: (){
                            final isValid=_formKey.currentState?.validate();
                            if(isValid!=null){
                              bankDetail=Bank(accountNumber: _accountController.text, bankName: _bankNameController.text, branchName: _branchNameController.text  , ifscCode: _ifscController.text);
                              saveToDatabase();
                            }
                          },
                          child: Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      )
                  )
                ,
                  Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shadowColor: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, 'account_finance/department');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Department',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(
                                  context, 'account_finance/bank_detail');
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank Details',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(context, 'account_finance/view_salary');
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'View Salary',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),],
               ),
            ),
           ),
          ],
        ),
      ),
    );
  }
}
