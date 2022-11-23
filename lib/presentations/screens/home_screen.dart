import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/image_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ImageContainer(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            iamgeUrl: '',
            child: Column(
              children: const [
                Text('News'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
