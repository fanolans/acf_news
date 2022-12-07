import 'package:acf_news/presentations/pages/article_list_page.dart';
import 'package:acf_news/presentations/pages/business_page.dart';
import 'package:acf_news/presentations/pages/entertaiment_page.dart';
import 'package:acf_news/presentations/pages/health_page.dart';
import 'package:acf_news/presentations/pages/science_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
import 'package:acf_news/presentations/pages/sport_page.dart';
import 'package:acf_news/presentations/pages/technology_page.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widgets/custom_drawer.dart';
import 'category_news_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      floating: false,
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
                            length: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Text(
                                    'Breaking News',
                                    style: textTheme.headline5?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  child: const ArticleListPage(),
                                ),
                                // CategoryNews(tabs: tabs),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverCategoryDelegate(
                          minHeight: 50,
                          maxHeight: 50,
                          child: Container(
                            color: Colors.white,
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: kColorNavy,
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  child: Text(
                                    "Business",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Entertaiment",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Health",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Science",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Sport",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Technology",
                                    style: textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: const [
                    BusinessPage(),
                    EntertaimentPage(),
                    HealthPage(),
                    SciencePage(),
                    SportPage(),
                    TechnologyPage()
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

class _SliverCategoryDelegate extends SliverPersistentHeaderDelegate {
  _SliverCategoryDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverCategoryDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
