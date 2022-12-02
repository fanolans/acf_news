import 'dart:io';
import 'package:acf_news/data/api/api_service.dart';
import 'package:acf_news/data/model/article_model.dart';
import 'package:flutter/foundation.dart';

import '../../utils/state_result.dart';

class SearchProvider extends ChangeNotifier {
  final ApiServices apiService;

  SearchProvider({required this.apiService}) {
    fetchQueryArticle(query);
  }

  ArticlesResult? _articleList;
  StateResult? _state;
  String _message = '';
  String _query = '';

  String get message => _message;
  String get query => _query;
  ArticlesResult? get result => _articleList;
  StateResult? get state => _state;

  Future<dynamic> fetchQueryArticle(String query) async {
    try {
      if (query.isNotEmpty) {
        _state = StateResult.loading;
        _query = query;
        notifyListeners();
        final articleList = await apiService.searchArticles(query);
        if (articleList.articles.isEmpty) {
          _state = StateResult.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _state = StateResult.hasData;
          notifyListeners();
          return _articleList = articleList;
        }
      }
    } on SocketException {
      _state = StateResult.noConnection;
      notifyListeners();
      return _message = 'Please check your connection.';
    } catch (e) {
      _state = StateResult.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
