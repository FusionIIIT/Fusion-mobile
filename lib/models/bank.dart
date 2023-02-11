class Bank{
  final String bankName;
  final String branchName;
  final String ifscCode;
  final String accountNumber;

  Bank({required this.accountNumber,required this.bankName,required this.branchName,required this.ifscCode});

 static Map<String,dynamic> getData(Bank model){
    return {
      'bank_name':model.bankName,
      'ifsc_code':model.ifscCode,
      'branch_name':model.branchName,
      'account_number':model.accountNumber
    };
  }

  }