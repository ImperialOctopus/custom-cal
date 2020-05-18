import 'package:flutter/material.dart';

class LocalImage extends StatelessWidget {
  static String prefix = 'assets/images/';

  final String location;
  final double height;

  const LocalImage({
    @required this.location,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: height),
        child: Center(
          child: Image(
            image: AssetImage(prefix + location),
          ),
        ),
      ),
    );
  }
}
