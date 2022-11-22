import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';

class SearchPage extends StatefulWidget {
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
        backgroundColor: kColorPrimary,
        title: Row(
          children: [
            Text(
              'Find something news',
              style: GlobalFunctions.textTheme(context: context)
                  .headline5!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 16),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: kColorPrimary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0x2596C3E2),
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Text(
                                  'Top Headlines',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 16),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: kColorPrimary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0x2596C3E2),
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Text(
                                  'Health',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 16),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: kColorPrimary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0x2596C3E2),
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Text(
                                  'Technology',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 16),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: kColorPrimary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0x2596C3E2),
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Text(
                                  'Sports',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        controller: _searchControl,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          hintText: "Search",
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
  }
}
