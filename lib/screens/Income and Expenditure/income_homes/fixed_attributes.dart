import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';

class FixedAttributeScreen extends StatefulWidget {
  const FixedAttributeScreen({Key? key}) : super(key: key);

  @override
  State<FixedAttributeScreen> createState() => _FixedAttributeScreenState();
}

class _FixedAttributeScreenState extends State<FixedAttributeScreen> {
  var _corpusFundController=TextEditingController();
  var _endownmentFundController=TextEditingController();
  var _liabilitiesFundController=TextEditingController();
  var _fixedAssetsController=TextEditingController();
  var _tangibleAssetsController=TextEditingController();
  var _intangibleAssetsController=TextEditingController();
  var _capitalWorkController=TextEditingController();
  var _investmentController=TextEditingController();
  var _loanController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // corpus fund
              Text("Corpus Fund"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _corpusFundController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
              SizedBox(height: 5,),

              // endownment fund
              Text("Endownment fund"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _endownmentFundController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // liabilities
              Text("Liabilities and Provision"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _liabilitiesFundController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // fixed asset
              Text("Fixed assests"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _fixedAssetsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // tangible assets
              Text("Tangible assets"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _tangibleAssetsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // intangible assets
              Text("Intangible assets"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _intangibleAssetsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // capital work
              Text("Capital work in progress"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _capitalWorkController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // investments
              Text("Investments"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _investmentController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 5,),

              // loan
              Text("Loan and Deposits"),
              SizedBox(height: 2,),
              TextFormField(
                controller: _loanController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){}, child: Text("Update",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
              ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
