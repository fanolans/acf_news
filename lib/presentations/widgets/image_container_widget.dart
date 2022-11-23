import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    required this.iamgeUrl,
    this.padding,
    this.margin,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final String iamgeUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            '${assetImages}icon-profile.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
