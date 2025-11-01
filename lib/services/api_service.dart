import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://172.30.1.82:8000';

  Future<Map<String, dynamic>> identifySpecies(File imageFile) async {
    try {
      print('API call start: $baseUrl/api/v1/identify');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/api/v1/identify'),
      );

      var imageBytes = await imageFile.readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'image.jpg',
      );
      request.files.add(multipartFile);

      print('Uploading image...');

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(responseBody);
        print('Success!');
        return jsonResponse;
      } else {
        print('API error: ${response.statusCode}');
        throw Exception('API error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
      rethrow;
    }
  }

  Future<bool> checkServerHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      print('Server connection failed: $e');
      return false;
    }
  }
}