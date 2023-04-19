import 'dart:convert';
import 'dart:ui';
import 'package:fusion/Components/side_drawer.dart';
import '../utils.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/ps2/transferdatas.dart';
import 'package:fusion/Components/appBar.dart';
class TransferTable extends StatelessWidget {
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
          child: transferscreen(),
        ),
      ),
    );
  }
}
class transferscreen extends StatefulWidget{
  @override
  State<transferscreen> createState() => _Transferlisted();
}

class _Transferlisted extends State<transferscreen> {
  Future<List<transferdatas>> getTransfer() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/ps2/transferdatas.json");
    List vatData = jsonDecode(data);
    print(vatData);
    List<transferdatas> transferdat= vatData.map((movie) => transferdatas.fromJson(movie)).toList();
    return transferdat;

  }

  void initState(){
    getTransfer();
    super.initState();
  }

  Widget build(BuildContext context) {
    height: double.infinity;
    width: MediaQuery.of(context).size.width;
    return Scaffold(

        body: FutureBuilder<List<transferdatas>>(
            future: getTransfer(),
            builder: (context, data) {
              if(data.hasData){
                List<transferdatas> transfer = data.data!;
                return ListView.builder(
                    itemCount: transfer.length,
                    itemBuilder: (content, index)
                    {
                      return ListTile(
                          title: Text(transfer[index].itemId!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.numbers),
                          subtitle: Text(("From department:" + transfer[index].fromDepartment! + "  From Location:" + transfer[index].fromLocation!
                              + "  To department:" + transfer[index].toDepartment! + "  To location:" + transfer[index].toLocation!
                              + "  Date:" + transfer[index].date! + "  Remark:" + transfer[index].remark!), style: TextStyle(fontSize: 11),
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
