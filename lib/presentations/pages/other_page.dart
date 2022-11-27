import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  static const routeName = '/other';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Other',
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
