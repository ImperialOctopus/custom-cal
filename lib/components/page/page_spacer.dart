import 'package:flutter/material.dart';

class PageSpacer extends StatelessWidget {
  final double height;

  const PageSpacer({this.height = 6.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height),
    );
  }
}
