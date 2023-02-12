class Department{
  final String companyName;
  final String startDate;
  final String endDate;
  final String description;
  final String status;

  Department({required this.companyName,required this.startDate,required this.endDate,required this.description,required this.status});

  static Map<String,dynamic> getData(Department model){
    return {
      'company_Name':model.companyName,
      'start_Date':model.startDate,
      'End_date':model.endDate,
      'description':model.description,
      'status':model.status
    };
  }

}