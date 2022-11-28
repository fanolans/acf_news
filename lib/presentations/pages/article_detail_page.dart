import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';
import '../widgets/card_article_detail.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: CardArticleDetail(article: article),
    );
  }
}
