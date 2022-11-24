import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            maxLines: 2,
            style: textTheme.subtitle1?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.author!,
            style: textTheme.subtitle2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
