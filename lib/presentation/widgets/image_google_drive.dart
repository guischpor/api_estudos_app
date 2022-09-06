import 'package:flutter/material.dart';

class ImageGoogleDrive extends StatelessWidget {
  const ImageGoogleDrive({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://drive.google.com/uc?export=download&id=$imageUrl',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
