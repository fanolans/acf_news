import 'package:acf_news/presentations/pages/article_list_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
import 'package:acf_news/presentations/widgets/category_card.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                title: const Text('ACF News'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.routeName);
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
                bottom: TabBar(
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  tabs: [
                    _buildTabBarItem('Top Headline'),
                    _buildTabBarItem('Health'),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              ArticleListPage(),
              ArticleListPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarItem(String title) => Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      );
}
