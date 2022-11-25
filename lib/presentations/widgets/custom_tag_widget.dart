import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.backgroundcolor,
    required this.children,
  }) : super(key: key);

  final Color backgroundcolor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
