import 'package:fusion/models/finance_department.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';
import '../../constants.dart';
import '../../models/finance_bank.dart';

class BankService {
  Future<bool> addDepartmentService(Department companyDetail) async {
    var storage_service = locator<StorageService>();
    if (storage_service.userInDB?.token == null) throw Exception('Token Error');

    try {
      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      var data = Department.getData(companyDetail);
      var client = http.Client();
      var response = await client.post(
          Uri.http(
            getLink(),
            kCompanyDetails, //constant new complaint path
          ),
          headers: headers,
          body: data);

      if (response.statusCode == 201)
        return true;
      else
        return false;
    } catch (e) {
      rethrow;
    }
  }
}
