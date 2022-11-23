import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '5d4aa4354567426ab5769a414fede321';
  static const String _category = 'general';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
