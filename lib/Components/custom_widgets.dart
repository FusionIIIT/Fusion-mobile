import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

late String itemName = "";

late String quantity = "";

late String itemId = "";

late String presentStock = "";

late String estimatedCost = "";

late String budegetaryHead = "";
final _screenWidth = WidgetsBinding.instance.window.physicalSize.width;
final _screenHeight = WidgetsBinding.instance.window.physicalSize.height;

Drawer customDrawer() => Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Manish Kumar',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CSE student',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
            ModulesCard(
              cardLine: 'Indent form',
              pageMover: '/Purchase_and_store_homePage',
            ),
            ModulesCard(
              cardLine: 'All Filed Indents',
              pageMover: '/Purchase_and_store_homePage/filed_indents',
            ),
            ModulesCard(
              cardLine: 'Indent Drafts',
              pageMover: '/Purchase_and_store_homePage/indent_drafts',
            ),
            ModulesCard(
              cardLine: 'Indent Status',
              pageMover: '/Purchase_and_store_homePage/indent_status',
            ),
          ],
        ),
      ),
    );

Widget myCard(
  String indentName,
  String quantity,
  String uniqueId,
  String estimatedCost,
  String presentStock,
  String purposeAndJustification,
  String itemType,
  String natureOfItem,
  String indigenous,
  String replacement,
  String expectedDelivery,
  String sourceOfSupply,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey[100],
    ),
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(indentName),
            SizedBox(
              width: 10,
            ),
            Text(quantity),
            SizedBox(
              width: 10,
            ),
            Text(uniqueId),
            SizedBox(
              width: 10,
            ),
            Text(estimatedCost),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(presentStock),
            SizedBox(
              width: 10,
            ),
            Text(purposeAndJustification),
            SizedBox(
              width: 10,
            ),
            Text(itemType),
            SizedBox(
              width: 10,
            ),
            Text(natureOfItem),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(indigenous),
            SizedBox(
              width: 10,
            ),
            Text(replacement),
            SizedBox(
              width: 10,
            ),
            Text(expectedDelivery),
            SizedBox(
              width: 10,
            ),
            Text(sourceOfSupply),
          ],
        )
      ],
    ),
  );
}

Widget filedIndents(
  String indentName,
  String uniqueId,
  String expectedDelivery,
) {
  return Container(
    height: _screenHeight / 14,
    width: _screenWidth / 2,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File Id : ' + uniqueId,
          style: TextStyle(fontSize: 20),
        ),
        Text('Ident Item : ' + indentName),
        Text('Date : ' + expectedDelivery),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'View',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Pending',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ],
        )
      ],
    ),
  );
}

Widget draftCard(
  String indentName,
  String uniqueId,
  String expectedDelivery,
) {
  return Container(
    height: _screenHeight / 15,
    width: _screenWidth / 2,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File id : ' + uniqueId,
          style: TextStyle(fontSize: 20),
        ),
        Text('Ident Item : ' + indentName),
        Text('Date : ' + expectedDelivery),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.edit_document,
              color: Colors.green,
            ),
            Icon(
              Icons.delete,
              color: Colors.red,
            )
          ],
        )
      ],
    ),
  );
}

Widget statusCard(
  String indentName,
  String uniqueId,
  String expectedDelivery,
) {
  return Container(
    height: _screenHeight / 15,
    width: _screenWidth / 2,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File id : ' + uniqueId,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Ident Item : ' + indentName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Date : ' + expectedDelivery,
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('...\n...'),
      ],
    ),
  );
}

Widget buildName() {
  return TextFormField(
    decoration: InputDecoration(
        labelText: 'Name of the Indenter',
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    maxLength: 20,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Name is Required';
      }

      return null;
    },
    onSaved: (value) {},
  );
}

Widget buildDestination() {
  return TextFormField(
    decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Destination',
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    maxLength: 20,
    validator: (value) {
      if (value!.isEmpty) {
        return 'destination is Required';
      }

      return null;
    },
    onSaved: (value) {},
  );
}

Widget buildRecieverDesig() {
  return TextFormField(
    decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Receiver Designation',
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    maxLength: 20,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Receiver Designation is Required';
      }

      return null;
    },
    onSaved: (value) {},
  );
}

Widget buildForwardTo() {
  return TextFormField(
    decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Forward to',
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    maxLength: 20,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Field is Required';
      }

      return null;
    },
    onSaved: (value) {},
  );
}

Widget buildbudgetaryHead() {
  return TextFormField(
    decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Budgetary Head',
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    maxLength: 20,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Budgetary Head is Required';
      }

      return null;
    },
    onSaved: (value) {},
  );
}
