class Department {
  String companyName;
  String startDate;
  String endDate;
  String description;
  String status = "not verified";

  Department({
    required this.companyName,
    required this.startDate,
    required this.description,
    required this.endDate,
    required this.status
  });

  static Map<String,dynamic> getData(Department model){
    return {
      'Company_Name':model.companyName,
      'Start_Date':model.startDate,
      'Status':model.status,
      'End_Date':model.endDate,
      'Description':model.description,
    };
  }

}