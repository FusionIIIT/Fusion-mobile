
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

import '../api.dart';
import '../constants.dart';
import '../models/finance_bank.dart';
import 'package:http/http.dart' as http;

import '../models/finance_department.dart';

class FinanceService{

  Future<bool> addBankDetails(Bank bank)async{
   try{
     var data=Bank.getData(bank);

     var storage_service = locator<StorageService>();
     if (storage_service.userInDB?.token == null)
       throw Exception('Token Error');

     Map<String, String> headers = {
       'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
     };

     var client = http.Client();
     var response = await client.post(
         Uri.http(
           getLink(),
           kBankDetails, //constant new complaint path
         ),
         headers: headers,
         body: data);
     // print(response.statusCode);

     if (response.statusCode == 201) return true;
     return false;
   }catch(e){
      rethrow;
   }
  }

  Future<bool> addDepartment (Department department)async{
    try{
      var data=Department.getData(department);

      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      var client = http.Client();
      var response = await client.post(
          Uri.http(
            getLink(),
            kCompanyDetails, //constant new complaint path
          ),
          headers: headers,
          body: data);
      // print(response.statusCode);

      if (response.statusCode == 201) return true;
      return false;
    }catch(e){
      rethrow;
    }
  }

  Future<http.Response> getSalary() async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching salary");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kBankDetails, //constant api path
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched salary");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }
}