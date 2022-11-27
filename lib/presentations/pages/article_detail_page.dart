import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';
import '../../utils/styles.dart';
import '../widgets/custom_tag_widget.dart';
import 'article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: SingleChildScrollView(
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
                      style: textTheme.bodySmall?.copyWith(color: Colors.white),
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.account_circle_rounded),
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
                          children: const [
                            Icon(Icons.share),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.bookmark_border_outlined),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle1?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.description!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle1?.copyWith(
                              color: Colors.black.withAlpha(150), fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
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
      ),
    );
  }
}
