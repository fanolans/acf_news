import 'package:acf_news/presentations/pages/article_list_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
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
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: const ArticleListPage(),
    );
  }
}



// NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               pinned: true,
//               title: const Text('ACF News'),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, SearchPage.routeName);
//                   },
//                   icon: const Icon(Icons.search),
//                 )
//               ],
//               bottom: TabBar(
//                 indicatorColor: Theme.of(context).colorScheme.secondary,
//                 tabs: [
//                   _buildTabBarItem('Top Headline'),
//                   _buildTabBarItem('Health'),
//                 ],
//               ),
//             ),
//           ];
//         },
//         body: const TabBarView(
//           children: [
//             ArticleListPage(),
//             ArticleListPage(),
//           ],
//         ),
//       ),