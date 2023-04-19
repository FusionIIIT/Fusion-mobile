import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  static List<Item> draftItemList = List.empty(growable: true);

  void saveToDrafts(Item item) {
    draftItemList.add(item);
  }

  static List<Item> getDrafts() {
    return draftItemList;
  }

  Item({
    required this.itemName,
    required this.quantity,
    required this.uniqueId,
    required this.estimatedCost,
    required this.presentStock,
    required this.purposeAndJustification,
    required this.itemType,
    required this.natureOfItem,
    required this.indigenous,
    required this.replacement,
    required this.expectedDelivery,
    required this.sourceOfSupply,
  });

  final String itemName;
  final String quantity;
  final String uniqueId;
  final String estimatedCost;
  final String presentStock;
  final String purposeAndJustification;
  final String itemType;
  final String natureOfItem;
  final String indigenous;
  final String replacement;
  final String expectedDelivery;
  final String sourceOfSupply;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemName: json["itemName"],
        quantity: json["quantity"],
        uniqueId: json["uniqueId"],
        estimatedCost: json["estimatedCost"],
        presentStock: json["presentStock"],
        purposeAndJustification: json["purposeAndJustification"],
        itemType: json["itemType"],
        natureOfItem: json["natureOfItem"],
        indigenous: json["indigenous"],
        replacement: json["replacement"],
        expectedDelivery: json["expectedDelivery"],
        sourceOfSupply: json["sourceOfSupply"],
      );

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "quantity": quantity,
        "uniqueId": uniqueId,
        "estimatedCost": estimatedCost,
        "presentStock": presentStock,
        "purposeAndJustification": purposeAndJustification,
        "itemType": itemType,
        "natureOfItem": natureOfItem,
        "indigenous": indigenous,
        "replacement": replacement,
        "expectedDelivery": expectedDelivery,
        "sourceOfSupply": sourceOfSupply,
      };
}
