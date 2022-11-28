import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/article_model.dart';
import '../../data/provider/database_provider.dart';
import '../../utils/styles.dart';
import '../pages/article_web_view.dart';
import 'custom_tag_widget.dart';

class CardArticleDetail extends StatelessWidget {
  const CardArticleDetail({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(article.urlToImage!),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsetsDirectional.only(
                        top: MediaQuery.of(context).size.height * 0.40),
                    child: CustomTag(
                      backgroundcolor: Colors.grey.withAlpha(100),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${DateTime.now().difference(article.publishedAt!).inHours} hours ago',
                            style: textTheme.bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsetsDirectional.only(
                        top: MediaQuery.of(context).size.height * 0.44),
                    child: Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headline5?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        top: MediaQuery.of(context).size.height * 0.56),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    article.author!,
                                    style: textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.share),
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    onPressed: () => '',
                                  ),
                                  isBookmarked
                                      ? IconButton(
                                          icon: const Icon(Icons.bookmark),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () => provider
                                              .removeBookmark(article.url),
                                        )
                                      : IconButton(
                                          icon:
                                              const Icon(Icons.bookmark_border),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () =>
                                              provider.addBookmark(article),
                                        ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                article.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.subtitle1?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                article.description!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.subtitle1?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withAlpha(200),
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kColorMaroon,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                child: const Text('Read more'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ArticleWebView.routeName,
                                      arguments: article.url);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
