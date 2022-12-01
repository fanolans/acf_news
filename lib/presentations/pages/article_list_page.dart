import 'package:acf_news/presentations/pages/category_news_page.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/api/api_service.dart';
import '../../data/model/article_model.dart';
import '../widgets/card_article_list_widget.dart';
import '../widgets/platform_widget.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiServices().topHeadlines();
  }

  Widget _buildList(BuildContext context) {
    List<String> tabs = [
      'Business',
      'Entertaiment',
      'Health',
      'Science',
      'Sports',
      'Technology'
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Breaking News',
                style: textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: _article,
              builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.articles.length,
                          itemBuilder: (context, index) {
                            var article = snapshot.data?.articles[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CardArticleList(
                                article: article!,
                              ),
                            );
                          },
                        ),
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
            ),
            const SizedBox(
              height: 15,
            ),
            CategoryNews(tabs: tabs),
          ],
        ),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
