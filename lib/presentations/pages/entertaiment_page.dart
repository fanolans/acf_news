import 'package:flutter/material.dart';

import '../../data/api/api_service.dart';
import '../../data/model/article_model.dart';
import '../widgets/application_error_widget.dart';
import '../widgets/card_category_news.dart';

class EntertaimentPage extends StatefulWidget {
  const EntertaimentPage({Key? key}) : super(key: key);

  @override
  State<EntertaimentPage> createState() => _EntertaimentPageState();
}

class _EntertaimentPageState extends State<EntertaimentPage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiServices().getEntertainment();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.articles[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CategoryNewsCard(
                    article: article!,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Material(
                child: ApplicationError(),
              ),
            );
          } else {
            return const Material(
              child: Text(''),
            );
          }
        }
      },
    );
  }
}
