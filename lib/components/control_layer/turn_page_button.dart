import 'package:flutter/material.dart';

class TurnPageButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const TurnPageButton({
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
