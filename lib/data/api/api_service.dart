import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class ApiServices {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '5d4aa4354567426ab5769a414fede321';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=general&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load general news');
    }
  }

  Future<ArticlesResult> getBusiness() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=business&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load business news');
    }
  }

  Future<ArticlesResult> getEntertainment() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=entertainment&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load entertainment news');
    }
  }

  Future<ArticlesResult> getHealth() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=health&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load health news');
    }
  }

  Future<ArticlesResult> getScience() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=science&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load science news');
    }
  }

  Future<ArticlesResult> getSports() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=sports&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load sports news');
    }
  }

  Future<ArticlesResult> getTechnology() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=technology&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load technology news');
    }
  }

  Future<ArticleSearch> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=general&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return ArticleSearch.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load search result');
    }
  }
}
