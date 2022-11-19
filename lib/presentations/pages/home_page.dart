import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Card(
                  child: Text(
                    'Berita hari ini',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
