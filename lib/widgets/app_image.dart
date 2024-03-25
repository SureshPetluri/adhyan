import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.color,
    this.height,
    this.width,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
        height: height,
        fit: fit,
        width: width,
        color: color, errorBuilder: (_, error, ___) {
      if (error is NetworkImageLoadException) {
        if (error.statusCode == 404) {
          return Image.asset(
            'assets/images/placeholder-image.png',
            fit: fit,
            width: width,
            color: color,
          );
        }
      }
      return Image.asset(
        'assets/images/placeholder-image.png',
        fit: fit,
        width: width,
        color: color,
      ); // Show a placeholder image in case of an error.
    });
  }
}
