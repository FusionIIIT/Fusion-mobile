class Bank{
  final String bankName;
  final String branchName;
  final String ifscCode;
  final String accountNumber;

  Bank({required this.accountNumber,required this.bankName,required this.branchName,required this.ifscCode});

 static Map<String,dynamic> getData(Bank model){
    return {
      'Bank_Name':model.bankName,
      'IFSC_Code':model.ifscCode,
      'Branch_Name':model.branchName,
      'Account_no':model.accountNumber
    };
  }

  }