import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';

class BreakingNews extends StatelessWidget {
  final List<Article> articles;
  const BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Breaking News",
                style: textTheme.headline5?.copyWith(color: Colors.black),
              ),
              Text("More",
                  style: textTheme.subtitle2?.copyWith(color: Colors.black)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 122,
                  width: 193,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 122,
                        width: 193,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(articles[index].urlToImage!),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        articles[index].title,
                        maxLines: 2,
                        style:
                            textTheme.subtitle1?.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${DateTime.now().difference(articles[index].publishedAt!).inHours} hours ago',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
