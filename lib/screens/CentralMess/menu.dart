import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Components/appBar.dart';
import '../../Components/side_drawer.dart';
import '../../constants.dart';
import '../../models/mess.dart';
import '../../services/mess_service.dart';


List<List<String>> daily = [['Breakfast', 'Lunch', 'Dinner'],
  ["Dal Makhani",'Razma Sabji, chana Dal, Boondi Raita, Plain Rice','Mix-veg Arhar Dal, Chapati, Veg-Pulao'],
  ['Sprouts, Idli Sambhar, Nariyal Chutney','Aaloo Jeera Sabji, Dal Makhni, Jeera Rice, Chapati, Suji halwa ( one time )','Aaloo Jeera Sabji, Dal Makhni, jeera Rice, Chapati, Suji halwa'],
  ["Sprouts, Poha jalebi, Namkeen, Chopped Onion, Lemon", "Choole-Puri, Arhar Dal, Green-Salad, Plain Rice, Boondi Raita, Chutney", "Shimla mirch, Chana Dal, Jeera Rice, Chapati, tamater-chutney"],
  ["Sprouts, Namkeen Sevaiyan, Black Channa", "paneer tikka masala and dal roti", "Safed matar Sabji, Chana dal, Jeera Rice, Chapati, Fruit custurd(One time)"],
  ["Sprouts, Uttapam, Sambhar, Nariyal Chutney", "burger", "Aaloo beans sabji, Dal makhani, Chapati, Plain Rice"],
  ["Sprouts, Aloo sabji, Puri", "uttpam dal roti", "Rajma"],
  ["Sprouts, Aloo Paratha, Dahi", "Aloo tamator mater, Moong Dal chhilka Fry, Jeera Rice, Chapati, boondi raita, Fryms", "Sahi/Matar paneer, arhar dal, Veg-Biryani, Tawa Veg, Gulab-Jamun (2-pieces)"]
];

class MessMenu extends StatefulWidget {

  @override
  _MessMenuState createState() => _MessMenuState();
}

class _MessMenuState extends State<MessMenu> {
 bool _loading = true;
  List<MessItem> classitems = [];
  List<List<String>> messitemsintable=[];
  late MessService messservice;
  List<String> weekdays = ['','Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  List<String> bld = ['Breakfast','Lunch','Dinner'];
  void getAndSetMenu()async{
    print('texp');
    print(messitemsintable);
    if(messitemsintable.isEmpty)
      {
        try{
          messservice=MessService();
          Response res = await messservice.getMessMenu(ModalRoute.of(context)!.settings.arguments.toString());

          var responseBody =jsonDecode(res.body);
          var jsonlist = responseBody['payload'];
          for(var x in jsonlist)
          {
            classitems.add(MessItem.fromJson(x));
          }


          setState(() {
            messitemsintable=processMessItems(classitems);
            _loading=false;
          });
        }catch(e){
          print(e);
          setState(() {
            _loading=false;
          });
        }
      }
}
  @override
  void initState() {
    super.initState();
  }

List<Widget> _buildCells(List<String> val) {
  return List.generate(
    val.length,
    (index) => Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Text(val[index]),
    ),
  );
}

List<Widget> _buildRows(List<List<String>> items) {
  return List.generate(
  items.length,
    (index) => Row(
      children: _buildCells(items[index]),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    getAndSetMenu();
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: _loading?CircularProgressIndicator():SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildCells(weekdays),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [..._buildRows([bld]),
                    ..._buildRows(messitemsintable)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
