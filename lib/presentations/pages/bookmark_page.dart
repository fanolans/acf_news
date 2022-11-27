import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
import '../../utils/styles.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);
  static const routeName = '/bookmark';

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your bookmark news',
        ),
        elevation: 0,
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Bookmark Page'),
        ),
      ),
    );
  }
}
