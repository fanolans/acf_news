import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
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
              style: GlobalFunctions.textTheme(context: context)
                  .headline5!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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
