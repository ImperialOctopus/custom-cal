import 'package:flutter/material.dart';

class PageForwardButtonComponent extends StatelessWidget {
  final Function onPressed;

  const PageForwardButtonComponent({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: onPressed,
    );
  }
}
