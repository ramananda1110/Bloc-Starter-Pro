import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const int timeoutSeconds = 45;

  static Future<dynamic> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      ).timeout(const Duration(seconds: timeoutSeconds));

      if (response.statusCode == 200) {
        // Decode response to handle special characters including Bangla text
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred while fetching data: $e");
    }
  }

  static Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: timeoutSeconds));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to post data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred during POST request: $e");
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: timeoutSeconds));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to delete data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error during DELETE request: $e");
    }
  }
}
