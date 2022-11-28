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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Theme.of(context).colorScheme.secondary,
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
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () => '',
                          ),
                          isBookmarked
                              ? IconButton(
                                  icon: const Icon(Icons.bookmark),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: () =>
                                      provider.removeBookmark(article.url),
                                )
                              : IconButton(
                                  icon: const Icon(Icons.bookmark_border),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: () =>
                                      provider.addBookmark(article),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ArticleDetailPage.routeName,
                      arguments: article,
                    ),
                    child: Column(
                      children: [
                        Text(
                          article.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle1?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          article.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle1?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withAlpha(200),
                              fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${DateTime.now().difference(article.publishedAt!).inHours} hours ago',
                            style: textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        );
      },
    );
  }
}
