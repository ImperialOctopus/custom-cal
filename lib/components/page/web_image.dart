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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Image(
          image: NetworkImage(location),
          height: height,
        ),
      ),
    );
  }
}
