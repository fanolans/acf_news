import 'package:acf_news/presentations/widgets/image_container_widget.dart';
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
  late Article article;

  @override
  void initState() {
    super.initState();
    _article = ApiServices().topHeadlines();
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Breaking News',
                style: textTheme.headline6?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
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
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.articles.length,
                        itemBuilder: (context, index) {
                          var article = snapshot.data?.articles[index];
                          return CardBreakingNews(article: article!);
                        },
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
              )
            ],
          ),
        )
      ],
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

class CardBreakingNews extends StatelessWidget {
  const CardBreakingNews({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      // article: article,
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width * 0.70,
      // padding: EdgeInsets.zero,
      // urlToImage: article.urlToImage!,
      // child: Column(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(article.urlToImage!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
