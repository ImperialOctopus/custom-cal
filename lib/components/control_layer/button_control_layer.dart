import 'package:flutter/material.dart';

class ButtonControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const ButtonControlLayer({
    @required this.backEnabled,
    @required this.onBackPressed,
    @required this.forwardEnabled,
    @required this.onForwardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          left: 0,
          bottom: 0,
          child: TurnPageButton(
            iconData: Icons.arrow_back,
            onPressed: backEnabled ? onBackPressed : null,
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: TurnPageButton(
              iconData: Icons.arrow_forward,
              onPressed: forwardEnabled ? onForwardPressed : null,
            )),
      ],
    );
  }
}

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
