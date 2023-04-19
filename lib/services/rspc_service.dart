import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class RSPCService {
  Future<bool> addResearchProject({
    String? projectIncharge,
    String? coProjectIncharge,
    String? fundingAgency,
    String? projectTitle,
    String? currentStatus,
    String? financialOutlay,
    String? submissionDate,
    String? startDate,
    String? expectedFinishDate,
    String? pfNo,
  }) async {
    try {
      Map<String, dynamic> data = {
        'pf_no': pfNo,
        'pi': projectIncharge,
        'co_pi': coProjectIncharge,
        'title': projectTitle,
        'financial_outlay': financialOutlay,
        'funding_agency': fundingAgency,
        'status': currentStatus,
        'start_date': startDate,
        'finish_date': expectedFinishDate,
        'date_submission': submissionDate,
      };
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');
      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      var client = http.Client();
      var response = await client.post(
        Uri.http(
          getLink(),
          kResearchProjectNew,
        ),
        headers: headers,
        body: data,
      );

      if (response.statusCode == 201) return true;
      return false;
    } catch (e) {
      print('Error While posting new research project -- $e');
      rethrow;
    }
  }

  Future<bool> addConsultancyProject({
    String? consultant,
    String? clientName,
    String? financialOutlay,
    String? projectTitle,
    String? startDate,
    String? endDate,
    String? pfNo,
  }) async {
    try {
      Map<String, dynamic> data = {
        'consultants': consultant,
        'client': clientName,
        'title': projectTitle,
        'financial_outlay': financialOutlay,
        'start_date': startDate,
        'end_date': endDate,
        'pf_no': pfNo,
      };
      print(data);
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');
      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      var client = http.Client();
      var response = await client.post(
        Uri.http(
          getLink(),
          kConsultantProjectNew,
        ),
        headers: headers,
        body: data,
      );

      if (response.statusCode == 201) return true;
      return false;
    } catch (e) {
      print('Error While posting new research project -- $e');
      rethrow;
    }
  }
}
