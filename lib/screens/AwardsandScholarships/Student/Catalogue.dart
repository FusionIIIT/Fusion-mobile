import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fusion/api.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
   Map<String, dynamic> displaySilver={};
   Map<String, dynamic> displayGold={};
  void initState() {
    super.initState();
    getApplications();
  }

  void getApplications() async {
    final String host = kserverLink;
    final String path = "/spacs/getContent/";

    String awardName = "Director's Silver Medal";

    Map<String, dynamic> queryParams = {
      'award_name': awardName,
    };
    Map<String, dynamic> queryParams2 = {
      'award_name': "Director's Gold Medal",
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-MOBILE-ENV': 'true',
      'Accept': "application/json",
    };
    // Create URI with the encoded award_name parameter and query parameters
    Uri uri = Uri.http(host, path, queryParams);
    Uri urg = Uri.http(host, path, queryParams2);
    var client = http.Client();

    try {
      var response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        // Successful response
       
        setState(() {
          displaySilver = jsonDecode(response.body);
        });
        print(displaySilver['content']);
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      var response2 = await client.get(urg, headers: headers);
      if (response2.statusCode == 200) {
        // Successful response
        setState(() {
         displayGold = jsonDecode(response2.body);
        });
        
        print(displayGold['content']);
      } else {
        // Handle error response
        print('Error: ${response2.statusCode}');
        print('Response body: ${response2.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
    Row(
      children: [
        Text(
          "Director's Gold Medal",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )
      ],
    ),
    Row(
      children: [Expanded(child: Text(displayGold['content']??''))],
    ),
    Row(
      children: [
        Text(
          "Director's Silver Medal",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )
      ],
    ),
    Row(
      children: [Expanded(child: Text(displaySilver['content']??''))],
    ),
          ],
        );
  }
}
