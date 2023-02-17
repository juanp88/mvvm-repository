import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://worldtimeapi.org/api/timezone/';

  Future<Map<String, dynamic>> getTimeZoneData(
      http.Client client, timeZone) async {
    final response = await client.get(Uri.parse('$baseUrl/$timeZone'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
