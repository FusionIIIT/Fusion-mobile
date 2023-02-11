import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

import '../models/bank.dart';

class BankService{
 Future<bool> addBankDetails(Bank bankDetails)async{

   var storage_service = locator<StorageService>();
   if (storage_service.userInDB?.token == null)
     throw Exception('Token Error');

   Map<String, String> headers = {
     'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
   };
   var data=Bank.getData(bankDetails);
   var client = http.Client();
   var response = await client.post(
       Uri.http(
         getLink(),
         kComplaintNew, //constant new complaint path
       ),
       headers: headers,
       body: data);
}
}