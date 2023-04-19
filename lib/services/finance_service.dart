
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

import '../api.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../models/finance_department.dart';

class FinanceService{

  Future<http.Response> getSalary(String month,String year) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data={
        month:month,
        year:year,
      };

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching salary");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kBankDetails, //constant api path
        ),
        headers: headers,
        body: data
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

  Future<http.Response> getCompanyStatus(DepartmentModel department) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data=DepartmentModel.getData(department);

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching salary");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          // kBankDetails, //need to change
        ),
        headers: headers,
        body: data
      );
      if (response.statusCode == 200) {
        print("successfully status fetched");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

}