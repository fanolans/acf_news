import 'package:flutter/material.dart';

import 'presentations/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        BookmarkScreen.routeName: (context) => const BookmarkScreen(),
        OtherScreen.routeName: (context) => const OtherScreen(),
      },
    );
  }
}
