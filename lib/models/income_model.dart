// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

import 'dart:convert';

IncomeModel incomeModelFromJson(String str) => IncomeModel.fromJson(json.decode(str));

String incomeModelToJson(IncomeModel data) => json.encode(data.toJson());

class IncomeModel {
  IncomeModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.remark,
  });

  String purpose;
  int amount;
  String date;
  String remark;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
    purpose: json["purpose"],
    amount: json["amount"],
    date: json["date"],
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "purpose": purpose,
    "amount": amount,
    "date": date,
    "remark": remark,
  };
}
