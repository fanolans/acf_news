import 'dart:ui';

import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/article_model.dart';
import '../../data/provider/database_provider.dart';
import '../pages/article_detail_page.dart';

class CardArticleList extends StatelessWidget {
  final Article article;

  const CardArticleList({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ArticleDetailPage.routeName,
                    arguments: article,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(article.urlToImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.black38.withOpacity(0.32),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        article.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodyText1?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        article.description!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.subtitle1?.copyWith(
                                            color: Colors.white54,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
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
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
