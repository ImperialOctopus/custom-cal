import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const PageButton({
    @required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
