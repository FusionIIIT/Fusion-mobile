import 'package:flutter/material.dart';
import '../../Components/appBar.dart';
import '../../Components/side_drawer.dart';


List<List<String>> daily = [['Month', 'Monthly Bill', 'Rebate count', 'Rebate amount', 'Total', 'Status'],
  ['January 2023','13500','10','4500','9000','Not paid'],];
class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildRows(daily),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
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
