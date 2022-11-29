import 'package:flutter/cupertino.dart';

import '../../data/model/article_model.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.article,
    required this.height,
    this.borderRadius = 20,
    required this.width,
    required this.urlToImage,
    required this.child,
    required this.padding,
  }) : super(key: key);

  final Article article;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsets padding;
  final String urlToImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(article.urlToImage!), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
