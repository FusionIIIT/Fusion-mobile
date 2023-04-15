import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/PurchaseAndStore.dart';

class PurchaseService {
  static const String baseUrl = 'https://example.com/api/items';

  static Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> decoded = jsonDecode(response.body);
      return decoded.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  static Future<Item> createItem(Item item) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(item),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      return Item.fromJson(decoded);
    } else {
      throw Exception('Failed to create item');
    }
  }
}
