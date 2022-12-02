import 'package:acf_news/utils/state_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/provider/search_provider.dart';
import '../widgets/application_error_widget.dart';
import '../widgets/card_category_news.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String queries = '';
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Find something news',
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(children: [
            _searchBar(),
            const SizedBox(height: 8),
            Expanded(
              child: Consumer<SearchProvider>(builder: (context, state, _) {
                if (state.state == StateResult.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.state == StateResult.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result!.articles.length,
                      itemBuilder: (context, index) {
                        var article = state.result!.articles[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CategoryNewsCard(article: article),
                        );
                      });
                } else if (state.state == StateResult.noData) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.search_off, color: Colors.grey, size: 64),
                        SizedBox(height: 24),
                        Text('Not found', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  );
                } else if (state.state == StateResult.noConnection) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const ApplicationError(),
                        const SizedBox(height: 8),
                        Text(state.message),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                } else if (state.state == StateResult.error) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const ApplicationError(),
                        const SizedBox(height: 8),
                        Text(state.message),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(''),
                  );
                }
              }),
            )
          ]),
        ));
  }

  Widget _searchBar() {
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextField(
            maxLines: 1,
            controller: _searchControl,
            onChanged: (String query) {
              if (query.isNotEmpty) {
                setState(
                  () {
                    queries = query;
                  },
                );
                state.fetchQueryArticle(query);
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              hintText: "Search here...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../data/provider/search_provider.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   static const routeName = '/search';

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   String queries = '';
//   final TextEditingController _searchControl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Find something news',
//         ),
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _searchBar(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _searchBar() {
//     return Consumer<ArticleSearchProvider>(builder: (context, state, _) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//         child: TextField(
//           controller: _searchControl,
//           onChanged: (_) => setState(() {}),
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.all(10.0),
//             hintText: "Search",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(40),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(width: 2.0),
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//             prefixIcon: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
