import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'turn_page_button.dart';
import '../control_layer/control_layer.dart';

class KeyboardControlLayer extends ControlLayer {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const KeyboardControlLayer({
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
        RawKeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          onKey: (RawKeyEvent rawKeyEvent) {
            //print(rawKeyEvent);
            if (backEnabled &&
                rawKeyEvent.runtimeType == RawKeyDownEvent &&
                rawKeyEvent.logicalKey == LogicalKeyboardKey.arrowLeft) {
              onBackPressed();
            } else if (forwardEnabled &&
                rawKeyEvent.runtimeType == RawKeyDownEvent &&
                rawKeyEvent.logicalKey == LogicalKeyboardKey.arrowRight) {
              onForwardPressed();
            }
          },
          child: Container(),
        ),
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
