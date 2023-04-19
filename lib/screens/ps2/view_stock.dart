import 'dart:convert';
import 'dart:ui';
import 'package:fusion/Components/side_drawer.dart';

import '../utils.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/ps2/stockdatas.dart';
import 'package:fusion/Components/appBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),

      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: DefaultAppBar().PS2Appbar(),
        drawer: SideDrawer(),
        body: Center(
          child: stockscreen(),
        ),
      ),
    );
  }
}
class stockscreen extends StatefulWidget{
  @override
  State<stockscreen> createState() => _Stocklisted();
}

class _Stocklisted extends State<stockscreen> {
  Future<List<stockdatas>> getStocks() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/stockdatas.json");
    List mapData = jsonDecode(data);
    print(mapData);
    List<stockdatas> stockdat= mapData.map((movie) => stockdatas.fromJson(movie)).toList();
    return stockdat;

  }

  void initState(){
    getStocks();
    super.initState();
  }

  Widget build(BuildContext context) {
    height: double.infinity;
    width: MediaQuery.of(context).size.width;
    return Scaffold(

      body: FutureBuilder<List<stockdatas>>(
        future: getStocks(),
        builder: (context, data) {
          if(data.hasData){
            List<stockdatas> stocks = data.data!;
            return ListView.builder(
              itemCount: stocks.length,
                itemBuilder: (content, index)
                {
                  return ListTile(
                      title: Text(stocks[index].nameOfParticulars!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.numbers),
                      subtitle: Text(("Stock Id:" + stocks[index].stockId! + "  Rate:" + stocks[index].rate!
                          + "  Amount:" + stocks[index].amount! + "  Buy Date:" + stocks[index].buyDate!
                          + "  Issued Date:" + stocks[index].issuedDate! + "  Head of Asset:" + stocks[index].headOfAsset!
                          + "  Section:" + stocks[index].section! + "  Floor:" + stocks[index].floor!), style: TextStyle(fontSize: 11),
                  )
                  );
                }
            );
          }
          else{
            return CircularProgressIndicator();
          }
        }
      )
    );
  }
}
