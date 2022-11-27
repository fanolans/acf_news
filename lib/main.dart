import 'package:acf_news/presentations/pages/article_detail_page.dart';
import 'package:acf_news/presentations/pages/article_web_view.dart';
import 'package:acf_news/presentations/pages/bookmark_page.dart';
import 'package:acf_news/presentations/pages/home_page.dart';
import 'package:acf_news/presentations/pages/other_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import 'data/model/article_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACF News',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kColorPrimary,
              onPrimary: kColorSecondary,
              secondary: kColorSecondary,
            ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: textTheme,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kColorSecondary,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
        SearchPage.routeName: (context) => const SearchPage(),
        BookmarkPage.routeName: (context) => const BookmarkPage(),
        OtherPage.routeName: (context) => const OtherPage(),
      },
    );
  }
}
