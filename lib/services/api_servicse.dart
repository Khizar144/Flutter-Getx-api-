// api_servicse.dart
import 'dart:convert';
import 'package:api/constants/app_urls.dart';
import 'package:api/models/exception_model.dart';
import 'package:http/http.dart' as http;

class ApiServicse {
  final AppUrls appUrls = AppUrls();

  Future<List<dynamic>> fetchApi() async {
    final url = Uri.parse(appUrls.getPostsUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Decode JSON response into list
      } else {
        throw ExceptionModel("Failed to get the response");
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      throw ExceptionModel("An error occurred while fetching data");
    }
  }
}
