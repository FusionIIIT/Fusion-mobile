import 'dart:convert';
import 'dart:core';
import 'package:fusion/constants.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ComplaintService {
  getComplaint(String token) async {
    //print('Token '+token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    print("fetching complaints");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        //"/complaint/api/user/detail/394"
        "/complaint/api/studentcomplain",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched complaints");
      return response;
    }
    throw Exception('Can\'t load');
  }

  Future<bool> lodgeComplaint(
    String token,
    String? complaint_finish,
    String? complaint_type,
    String? location,
    String? specific_location,
    String? details,
    String? status,
    String? remarks,
    String? flag,
    String? reason,
    String? feedback,
    String? comment,
    String? complainer,
    String? worker_id,
  ) async {
    Map<String, dynamic> data = {
      "complaint_finish": complaint_finish!,
      "complaint_type": complaint_type!,
      "location": location!,
      "specific_location": specific_location!,
      "details": details!,
      "status": status!,
      "remarks": remarks!,
      "flag": flag!,
      "reason": reason!,
      "feedback": feedback!,
      "comment": comment!,
      "complainer": complainer!,
      "worker_id": worker_id!,
    };
    Map<String, String> headers = {'Authorization': 'Token ' + token};

    // Map<String, dynamic> data1 = {
    //   "complaint_finish": "2021-03-12",
    //   "complaint_type": "dustbin",
    //   "location": "hall-3",
    //   "specific_location": "KFC",
    //   "details": "kfc",
    //   "status": "0",
    //   "remarks": "Pending",
    //   "flag": "0",
    //   "reason": "None",
    //   "feedback": "",
    //   "comment": "None",
    //   "complainer": "2018186",
    //   "worker_id": ""
    // };
    // print(data1.toString());
    //print(data.toString());

    var client = http.Client();
    var response = await client.post(
        Uri.http(
          "172.27.16.216:80",
          "/complaint/api/newcomplain",
        ),
        headers: headers,
        body: data);
    print(response.statusCode);

    // var prefs = await StorageService.getInstance();
    //
    // prefs!.saveUserInDB(User((jsonDecode(response.body))["token"]));
    if (response.statusCode == 201) return true;
    return false;
  }

  Future<bool> updateComplaint(
    String token,
    int? id,
    String? complaint_date,
    String? complaint_finish,
    String? complaint_type,
    String? location,
    String? specific_location,
    String? details,
    String? status,
    String? remarks,
    String? flag,
    String? reason,
    String? feedback,
    String? comment,
    String? complainer,
  ) async {
    Map<String, dynamic> data = {
      "complaint_date": complaint_date!,
      "complaint_finish": complaint_finish!,
      "complaint_type": complaint_type!,
      "location": location!,
      "specific_location": specific_location!,
      "details": details!,
      "status": status!,
      "remarks": remarks!,
      "flag": flag!,
      "reason": reason!,
      "feedback": feedback!,
      "comment": comment!,
      "complainer": complainer!,
    };
    Map<String, String> headers = {'Authorization': 'Token ' + token};

    // Map<String, dynamic> data1 = {
    //   "complaint_date": "2021-03-14T16:47:51.870035",
    //   "complaint_finish": "2021-03-12",
    //   "complaint_type": "dustbin",
    //   "location": "hall-3",
    //   "specific_location": "A303",
    //   "details": "bed water",
    //   "status": 0,
    //   "remarks": "Pending",
    //   "flag": 0,
    //   "reason": "None",
    //   "feedback": "",
    //   "comment": "None",
    //   "complainer": "2018186"
    // };
    // print(data1.toString());
    //print(data.toString());

    var client = http.Client();
    var response = await client.put(
        Uri.http(
          "172.27.16.216:80",
          "complaint/api/updatecomplain/${id}",
        ),
        headers: headers,
        body: data);
    print(response.statusCode);

    // var prefs = await StorageService.getInstance();
    //
    // prefs!.saveUserInDB(User((jsonDecode(response.body))["token"]));
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<bool> deleteComplaint(String token, int? id) async {
    print(token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    var client = http.Client();
    print(id);
    var response = await client.delete(
      Uri.http(
        "172.27.16.216:80",
        "/complaint/api/removecomplain/${id}",
      ),
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 404) return true;
    return false;
  }
}
