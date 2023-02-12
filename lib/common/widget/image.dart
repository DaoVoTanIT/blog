import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset(this.path,
      {Key? key, this.width = 24, this.height = 24, this.color})
      : super(key: key);
  final String path;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      color: color,
      fit: BoxFit.cover,
    );
  }
}

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(this.path,
      {Key? key, this.width = 24, this.height = 24, this.color})
      : super(key: key);
  final String path;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      width: width,
      height: height,
      color: color,
    );
  }
}
