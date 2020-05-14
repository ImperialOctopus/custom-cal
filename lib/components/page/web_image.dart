import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  final String location;
  final double height;

  const WebImage({
    @required this.location,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage(location),
        height: height,
      ),
    );
  }
}
