import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
import '../../utils/styles.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  static const routeName = '/other';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Row(
          children: [
            Text(
              'Other',
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
          child: Text('Other Page'),
        ),
      ),
    );
  }
}
