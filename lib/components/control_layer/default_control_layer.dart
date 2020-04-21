import 'package:flutter/material.dart';

import 'turn_page_button.dart';

class DefaultControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const DefaultControlLayer({
    this.backEnabled = true,
    this.onBackPressed,
    this.forwardEnabled = true,
    this.onForwardPressed,
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
