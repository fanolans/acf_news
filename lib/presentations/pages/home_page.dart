import 'package:acf_news/data/model/article_model.dart';
import 'package:acf_news/presentations/widgets/custom_tag.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _NewsOfTheDay(article: article),
          ],
        ),
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://img.antaranews.com/cache/800x533/2022/11/19/Team-Mitsubishi-Ralliart-2.jpg"),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
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
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
          ),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "Read more",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
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
