import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';
import 'customtag_newsoftheday_widget.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(article.urlToImage.toString()),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundcolor: Colors.grey.withAlpha(150),
            children: [
              Text(
                "News of the Day",
                style: textTheme.subtitle2?.copyWith(color: kColorSecondary),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: textTheme.headline4?.copyWith(
              color: kColorSecondary,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "Read more",
                  style: textTheme.subtitle2?.copyWith(color: kColorSecondary),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
