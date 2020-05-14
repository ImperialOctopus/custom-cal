import 'package:flutter/material.dart';

class LocalImage extends StatelessWidget {
  final String location;
  final double height;

  const LocalImage({
    @required this.location,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage(location),
        height: height,
      ),
    );
  }
}
