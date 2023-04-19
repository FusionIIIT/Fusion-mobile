class stockdatas {
  String? stockId;
  String? nameOfParticulars;
  String? rate;
  String? amount;
  String? supplierName;
  String? billNo;
  String? buyDate;
  String? issuedDate;
  String? headOfAsset;
  String? section;
  String? floor;
  String? receiverName;

  stockdatas(
      {this.stockId,
        this.nameOfParticulars,
        this.rate,
        this.amount,
        this.supplierName,
        this.billNo,
        this.buyDate,
        this.issuedDate,
        this.headOfAsset,
        this.section,
        this.floor,
        this.receiverName});

  stockdatas.fromJson(Map<String, dynamic> json) {
    stockId = json['stock_id'];
    nameOfParticulars = json['name_of_particulars'];
    rate = json['rate'];
    amount = json['amount'];
    supplierName = json['supplier_name'];
    billNo = json['bill_no'];
    buyDate = json['buy_date'];
    issuedDate = json['issued_date'];
    headOfAsset = json['head_of_asset'];
    section = json['section'];
    floor = json['floor'];
    receiverName = json['receiver_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock_id'] = this.stockId;
    data['name_of_particulars'] = this.nameOfParticulars;
    data['rate'] = this.rate;
    data['amount'] = this.amount;
    data['supplier_name'] = this.supplierName;
    data['bill_no'] = this.billNo;
    data['buy_date'] = this.buyDate;
    data['issued_date'] = this.issuedDate;
    data['head_of_asset'] = this.headOfAsset;
    data['section'] = this.section;
    data['floor'] = this.floor;
    data['receiver_name'] = this.receiverName;
    return data;
  }
}
