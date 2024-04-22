import 'package:flutter/material.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/dashboard.dart';
import '../models/profile.dart';
import 'dashboard_service.dart';

class DataFetcher {
  // late String club = "";
  Future<String> getClub(BuildContext context) async {
    try {
      var dashboardService = DashboardService();
      var profileService = ProfileService();
      var clubDetailsService = ViewClubDetails();

      var response = await dashboardService.getDashboard();
      var response2 = await profileService.getProfile();
      var clubDetails = await clubDetailsService.getClubDetails();

      if (response.statusCode == 200) {
        var data = DashboardData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load dashboard data: ${response.statusCode}');
      }

      if (response2.statusCode == 200) {
        var data2 = ProfileData.fromJson(jsonDecode(response2.body));
        var name = data2.user!["username"];

        String? userClub;
        for (var clubDetail in clubDetails) {
          if (clubDetail['co_ordinator'] == name) {
            userClub = clubDetail['club_name'];
            break;
          }
        }

        if (userClub != null) {
          return userClub;
        } else {
          return "";
        }
      } else {
        throw Exception('Failed to load profile data: ${response2.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while loading data: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      return "Error";
    }
  }
}
