import 'package:acf_news/presentations/pages/home_page.dart';
import 'package:acf_news/presentations/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ACF News',
      home: SplashScreen(),
    );
  }
}
