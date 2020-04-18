import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  final String url;
  final double height;

  const WebImage({
    @required this.url,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage(url),
        height: height,
      ),
    );
  }
}
