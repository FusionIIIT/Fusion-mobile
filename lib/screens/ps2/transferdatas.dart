class transferdatas {
  String? _itemId;
  String? _fromDepartment;
  String? _fromLocation;
  String? _toDepartment;
  String? _toLocation;
  String? _date;
  String? _remark;

  transferdatas(
      {String? itemId,
        String? fromDepartment,
        String? fromLocation,
        String? toDepartment,
        String? toLocation,
        String? date,
        String? remark}) {
    if (itemId != null) {
      this._itemId = itemId;
    }
    if (fromDepartment != null) {
      this._fromDepartment = fromDepartment;
    }
    if (fromLocation != null) {
      this._fromLocation = fromLocation;
    }
    if (toDepartment != null) {
      this._toDepartment = toDepartment;
    }
    if (toLocation != null) {
      this._toLocation = toLocation;
    }
    if (date != null) {
      this._date = date;
    }
    if (remark != null) {
      this._remark = remark;
    }
  }

  String? get itemId => _itemId;
  set itemId(String? itemId) => _itemId = itemId;
  String? get fromDepartment => _fromDepartment;
  set fromDepartment(String? fromDepartment) =>
      _fromDepartment = fromDepartment;
  String? get fromLocation => _fromLocation;
  set fromLocation(String? fromLocation) => _fromLocation = fromLocation;
  String? get toDepartment => _toDepartment;
  set toDepartment(String? toDepartment) => _toDepartment = toDepartment;
  String? get toLocation => _toLocation;
  set toLocation(String? toLocation) => _toLocation = toLocation;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get remark => _remark;
  set remark(String? remark) => _remark = remark;

  transferdatas.fromJson(Map<String, dynamic> json) {
    _itemId = json['item_id'];
    _fromDepartment = json['from_department'];
    _fromLocation = json['from_location'];
    _toDepartment = json['to_department'];
    _toLocation = json['to_location'];
    _date = json['date'];
    _remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this._itemId;
    data['from_department'] = this._fromDepartment;
    data['from_location'] = this._fromLocation;
    data['to_department'] = this._toDepartment;
    data['to_location'] = this._toLocation;
    data['date'] = this._date;
    data['remark'] = this._remark;
    return data;
  }
}
