import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

import '../api.dart';
import '../constants.dart';
class IncomeServices{
  Future<http.Response> getIncomeStats(String date) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data={date:date};

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching income details");
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
        print("successfully fetched income details");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getExpenditureStats(String date) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data={date:date};

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching expenditure details");
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
        print("successfully fetched expenditure details");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getComparison(String date) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data={date:date};

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching comparison details");
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
        print("successfully fetched comparison details");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getBalanceSheet(String date) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      var data={date:date};

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Balance sheet...");
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
        print("successfully fetched Balance sheet information");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getAllExpenses() async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Balance sheet...");
      var client = http.Client();
      http.Response response = await client.post(
          Uri.http(
            getLink(),
            // kBankDetails, //need to change
          ),
          headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched Balance sheet information");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getAllIncomeSource() async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Balance sheet...");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          // kBankDetails, //need to change
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched Balance sheet information");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getAllExpenditureOfIncome() async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Balance sheet...");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          // kBankDetails, //need to change
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched Balance sheet information");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }
}