import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Row(
          children: [
            Text(
              'Your bookmark news',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
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
