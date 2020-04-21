import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const KeyboardControlLayer({
    @required this.backEnabled,
    @required this.onBackPressed,
    @required this.forwardEnabled,
    @required this.onForwardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKey: (RawKeyEvent rawKeyEvent) {
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
    );
  }
}
