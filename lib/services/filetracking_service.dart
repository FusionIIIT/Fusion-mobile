import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> createFile(
  String title,
  String description,
  {
    String? remarks,
    String? forwardTo,
    String? designation,
    String? token, // Optional authorization token (if applicable)
  }) async {
  final url = Uri.parse('http://localhost:8000/filetrcking/api/file');
  final body = jsonEncode({
    'title': title,
    'description': description,
    'remarks': remarks,
    'forwardTo': forwardTo,
    'designation': designation,
  });

  final headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  if (token != null) {
    headers['Authorization'] = '3c94443764b7b0f2b4aec6d5c143378ac1457e57'; // Replace `Bearer $token` with your actual authentication scheme
  }

  final response = await http.post(url, headers: headers, body: body);
  return response;
}
