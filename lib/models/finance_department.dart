class DepartmentModel {
  String companyName;
  String startDate;
  String endDate;
  String description;

  DepartmentModel({
    required this.companyName,
    required this.startDate,
    required this.description,
    required this.endDate,
  });

  static Map<String,dynamic> getData(DepartmentModel model){
    return {
      'fest':model.companyName,
      'Start_Date':model.startDate,
      'End_Date':model.endDate,
      'Description':model.description,
    };
  }

}