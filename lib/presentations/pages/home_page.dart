import 'package:acf_news/presentations/pages/article_list_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import 'category_news_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'Business',
      'Entertaiment',
      'Health',
      'Science',
      'Sports',
      'Technology'
    ];
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchPage.routeName);
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          'Breaking News',
                          style: textTheme.headline5?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: const ArticleListPage(),
                      ),
                      CategoryNews(tabs: tabs),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
