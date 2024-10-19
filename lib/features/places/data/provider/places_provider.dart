import 'dart:convert';

import 'package:http/http.dart' as http;

class PlacesProvider {
  Future<Map<String, dynamic>> findPlaces({required String query}) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "key": "AIzaSyC8o3ShF1B6EBxuEqY04RTZ9bGKcfYmkM8"});

    try {
      final response = await http.get(uri);

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
