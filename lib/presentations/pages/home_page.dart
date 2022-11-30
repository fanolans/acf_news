import 'package:acf_news/data/api/api_service.dart';
import 'package:acf_news/data/model/article_model.dart';
import 'package:acf_news/presentations/widgets/card_breaking_news_widget.dart';
import 'package:acf_news/presentations/widgets/card_news_of_theday_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiServices().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            var article = snapshot.data?.articles;
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  NewsOfTheDay(
                    article: article!.first,
                  ),
                  BreakingNews(articles: article),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Material(
                child: Text(
                  snapshot.error.toString(),
                ),
              ),
            );
          } else {
            return const Material(
              child: Text(''),
            );
          }
        }
      },
    );
  }
}
