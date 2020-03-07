import 'package:flutter/material.dart';

class PageBackButtonComponent extends StatelessWidget {
  final Function onPressed;

  const PageBackButtonComponent({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}
