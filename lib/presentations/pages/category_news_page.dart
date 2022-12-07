import 'package:acf_news/data/api/api_service.dart';
import 'package:acf_news/data/model/article_model.dart';
import 'package:acf_news/presentations/pages/business_page.dart';
import 'package:acf_news/presentations/pages/entertaiment_page.dart';
import 'package:acf_news/presentations/pages/health_page.dart';
import 'package:acf_news/presentations/pages/science_page.dart';
import 'package:acf_news/presentations/pages/sport_page.dart';
import 'package:acf_news/presentations/pages/technology_page.dart';
import 'package:acf_news/presentations/widgets/card_category_news.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/application_error_widget.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: kColorNavy,
          tabs: widget.tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: textTheme.headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const TabBarView(children: [
            BusinessPage(),
            EntertaimentPage(),
            HealthPage(),
            SciencePage(),
            SportPage(),
            TechnologyPage(),
          ]),
        ),
      ],
    );
  }
}
