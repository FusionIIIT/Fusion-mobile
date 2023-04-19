import 'package:flutter/material.dart';

import '../../Components/custom_widgets.dart';
import '../../Components/side_drawer.dart';
import '../../models/PurchaseAndStore.dart';
import 'filed_indents_page.dart';
import 'indent_draft_page.dart';

class PurchaseAndStore extends StatefulWidget {
  const PurchaseAndStore({Key? key}) : super(key: key);

  @override
  State<PurchaseAndStore> createState() => _PurchaseAndStoreState();
}

class _PurchaseAndStoreState extends State<PurchaseAndStore> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Item> itemList = List.empty(growable: true);

  final nameController = TextEditingController();

  final quantityController = TextEditingController();

  final idController = TextEditingController();

  final presentStockController = TextEditingController();

  final estimatedCostController = TextEditingController();

  final purposeAndJustificationController = TextEditingController();

  final itemTypeController = TextEditingController();

  final natureOfItemController = TextEditingController();

  final indigenousController = TextEditingController();

  final replacementController = TextEditingController();

  final budgetaryHeadController = TextEditingController();

  final expectedDeliveryController = TextEditingController();

  final sourceOfSupplyController = TextEditingController();

  late String _itemName = "";
  late String _itemType = "";

  late String _quantity = "";

  late String _itemId = "";

  late String _presentStock = "";

  late String _estimatedCost = "";

  late String _budegetaryHead = "";

  Future addNewItem() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add new item"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Item name ",
                      ),
                    ),
                    TextField(
                      controller: itemTypeController,
                      decoration: InputDecoration(
                        hintText: "Item Type ",
                      ),
                    ),
                    TextField(
                        controller: quantityController,
                        decoration: InputDecoration(
                          hintText: "Quantity ",
                        )),
                    TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          hintText: "Item Id",
                        )),
                    TextField(
                        controller: estimatedCostController,
                        decoration: InputDecoration(
                          hintText: "estimated Cost",
                        )),
                    TextField(
                        controller: presentStockController,
                        decoration: InputDecoration(
                          hintText: "present Stock",
                        )),
                    TextField(
                      controller: purposeAndJustificationController,
                      decoration: InputDecoration(
                        hintText: " purposeAndJustification ",
                      ),
                    ),
                    TextField(
                        controller: natureOfItemController,
                        decoration: InputDecoration(
                          hintText: "natureOfItem",
                        )),
                    TextField(
                        controller: indigenousController,
                        decoration: InputDecoration(
                          hintText: " is it indigenous",
                        )),
                    TextField(
                        controller: replacementController,
                        decoration: InputDecoration(
                          hintText: "is it replaceable",
                        )),
                    TextField(
                        controller: expectedDeliveryController,
                        decoration: InputDecoration(
                          hintText: " expectedDelivery",
                        )),
                    TextField(
                        controller: sourceOfSupplyController,
                        decoration: InputDecoration(
                          hintText: "sourceOfSupply",
                        )),
                  ],
                ),
              ),
              actions: [
                //save
                MaterialButton(onPressed: save, child: const Text('Save')),
                //cancel
                MaterialButton(
                  onPressed: cancel,
                  child: const Text('Cancel'),
                )
              ],
            ));
  }

  void save() {
    //save data to database or provider

    setState(() {
      _itemName = nameController.text.trim();
      _itemId = idController.text.trim();
      _quantity = quantityController.text.trim();
      _estimatedCost = estimatedCostController.text.trim();
      _presentStock = presentStockController.text.trim();
      _itemType = itemTypeController.text.trim();

      itemList.add(Item(
          purposeAndJustification:
              purposeAndJustificationController.text.trim(),
          itemType: _itemType,
          natureOfItem: natureOfItemController.text.trim(),
          indigenous: indigenousController.text.trim(),
          replacement: replacementController.text.trim(),
          expectedDelivery: expectedDeliveryController.text.trim(),
          sourceOfSupply: sourceOfSupplyController.text.trim(),
          itemName: _itemName,
          quantity: quantity,
          uniqueId: _itemId,
          estimatedCost: _estimatedCost,
          presentStock: _presentStock));
    });
    Item.draftItemList.add(Item(
        purposeAndJustification: purposeAndJustificationController.text.trim(),
        itemType: _itemType,
        natureOfItem: natureOfItemController.text.trim(),
        indigenous: indigenousController.text.trim(),
        replacement: replacementController.text.trim(),
        expectedDelivery: expectedDeliveryController.text.trim(),
        sourceOfSupply: sourceOfSupplyController.text.trim(),
        itemName: _itemName,
        quantity: quantity,
        uniqueId: _itemId,
        estimatedCost: _estimatedCost,
        presentStock: _presentStock));
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    nameController.clear();
    quantityController.clear();
    idController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: addNewItem,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Indent Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: customDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (itemList.isEmpty)
                Text(
                  "No new Added Yet ..",
                  style: TextStyle(fontSize: 20),
                )
              else
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) => myCard(
                          itemList[index].itemName.toString(),
                          itemList[index].quantity.toString(),
                          itemList[index].uniqueId.toString(),
                          itemList[index].estimatedCost.toString(),
                          itemList[index].presentStock.toString(),
                          itemList[index].purposeAndJustification.toString(),
                          itemList[index].itemType.toString(),
                          itemList[index].natureOfItem.toString(),
                          itemList[index].indigenous.toString(),
                          itemList[index].replacement.toString(),
                          itemList[index].expectedDelivery.toString(),
                          itemList[index].sourceOfSupply.toString())),
                ),
              buildName(),
              buildDestination(),
              buildbudgetaryHead(),
              buildRecieverDesig(),
              buildForwardTo(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Center(
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();

                      //Send to API

                      ///save to drafts
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Center(
                        child: Text(
                          'Draft',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IdentDraftPage()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
