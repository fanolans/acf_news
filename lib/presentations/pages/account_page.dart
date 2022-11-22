import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
import '../../utils/styles.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Row(
          children: [
            Text(
              'Settings',
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
          child: Text('Account Page'),
        ),
      ),
    );
  }
}
